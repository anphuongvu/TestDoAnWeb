using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestDoAnWeb.Models;

namespace TestDoAnWeb.Controllers
{
    public class DeThisController : Controller
    {
        private QLThiTracNghiemOnlEntities db = new QLThiTracNghiemOnlEntities();

        // GET: DeThis

        public async Task<ActionResult> Index()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("Login", "Default");
            }
            var deThis = db.DeThis.Include(d => d.KhoaHoc);
            return View(await deThis.ToListAsync());
        }

        // GET: DeThis/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            DeThi deThi = await db.DeThis.FindAsync(id);
            
            if (deThi == null)
            {
                return HttpNotFound();
            }
            ViewBag.cauhois = db.CauHois.Where(item => item.MaDeThi == id).ToList();
            ViewBag.quest_idx = 0;
            return View(deThi);
        }

        public ActionResult BaiLam(int maHocSinh, int maDeThi)
        {
            DeThi deThi = db.DeThis.Find(maDeThi);
            List<DeThis_Chitiets> dtcts = deThi.DeThis_Chitiets.ToList();
            List<CauHois> cauHois = db.CauHois.Where(item => item.MaDeThi == maDeThi).ToList();
            List<BaiLam> baiLams = db.BaiLams.Where(bl => bl.MaHocSinh == maHocSinh).ToList();
            ViewBag.cauhois = cauHois;
            ViewBag.baiLams = baiLams;

            //tinh diem
            int soCauDung = 0;
            foreach(CauHois ch in cauHois)
            {
                BaiLam bailam = baiLams.Where(bl => bl.MaCauHoi == ch.MaCauHoi).FirstOrDefault();
                CauHoi_LuaChon chlc = ch.CauHoi_LuaChon.Where(cc => cc.CauTraLoi).FirstOrDefault();
                if (bailam != null && chlc!= null && bailam.MaLuaChon == chlc.MaLuaChon)
                {
                    soCauDung += 1;
                }
            }
            ViewBag.soCauDung = soCauDung;

            return View(deThi);
        }

        [HttpPost]
        public ActionResult NopBai(int? id)
        {
            int maHS = 1;
            if (Session["TaiKhoan"] != null )
            {
                if(((TaiKhoan)Session["TaiKhoan"]).HocSinh != null)
                    maHS = ((TaiKhoan)Session["TaiKhoan"]).HocSinh.MaHocSinh;
            }
            else
            {
                return RedirectToAction("Login", "Default");
            }   
            
            foreach (string maCauHoi in Request.Form)
            {
                int maCH = int.Parse(maCauHoi);
                int maLuaChon = int.Parse(Request.Form[maCauHoi]);
                BaiLam bl = db.BaiLams.Where(bb => bb.MaCauHoi == maCH && bb.MaHocSinh == maHS).FirstOrDefault();
                if(bl != null)
                {
                    bl.MaLuaChon = maLuaChon;
                    db.Entry(bl).State = EntityState.Modified;
                }
                else
                {
                    bl = new BaiLam();
                    bl.MaLuaChon = maLuaChon;
                    bl.MaHocSinh = maHS;
                    bl.MaCauHoi = maCH;
                    db.BaiLams.Add(bl);   
                }
            }
            db.SaveChanges();
            string refUri = Request.UrlReferrer.AbsoluteUri;

            return Redirect("/DeThis/BaiLam?maHocSinh="+maHS.ToString()+ "&maDeThi="+id.ToString());
        }
    }
}
