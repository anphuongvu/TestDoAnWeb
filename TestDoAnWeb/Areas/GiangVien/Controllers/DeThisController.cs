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

namespace TestDoAnWeb.Areas.GiangVien.Controllers
{
    public class DeThisController : Controller
    {
        private QLThiTracNghiemOnlEntities db = new QLThiTracNghiemOnlEntities();

        // GET: GiangVien/DeThis
        public async Task<ActionResult> Index()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("Login", "Default");
            }
            var deThis = db.DeThis.Include(d => d.KhoaHoc);
            return View(await deThis.ToListAsync());
        }
        [HttpPost]
        public JsonResult AddCauHoi(int IdDeThi, int IdCauHoi)
        {
            try
            {
                //int IdDeThi =1, IdCauHoi = 1;
                //Kiểm tra đã tồn tịa 1 record trong bảng chi tiết đề thi hay chưa
                var kt= db.DeThis_Chitiets.Count(x=> x.IdCauHoi == IdCauHoi && x.IdDeThi ==IdDeThi);
                if(kt > 0)
                {
                    return Json(new { code = 403, msg = "Câu hỏi này đã tồn tại trong đề thi !" }, JsonRequestBehavior.AllowGet);
                }
                var ctdt = new DeThis_Chitiets();
                ctdt.IdDeThi = IdDeThi;
                ctdt.IdCauHoi = IdCauHoi;

                db.DeThis_Chitiets.Add(ctdt);
                db.SaveChanges();

                // cập nhật số lượng câu hỏi
                DeThi dt = db.DeThis.Where(dd => dd.MaDeThi == IdDeThi).FirstOrDefault();
                if(dt != null)
                {
                    dt.SoCauHoi = dt.DeThis_Chitiets.Count;
                    db.Entry(dt).State = EntityState.Modified;
                    db.SaveChanges();
                }
                return Json(new { code = 200, msg = "Thêm mới câu hỏi thành công!" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Thêm mới câu hỏi thất bại: "+ex.Message }, JsonRequestBehavior.AllowGet);
            }
            
        }
        [HttpGet]
        public JsonResult ListDTCT(int IdDeThi)
        {
            try
            {

                var rs = (from ct in db.DeThis_Chitiets.Where(x => x.IdDeThi == IdDeThi)
                          select new
                          {
                              Id = ct.CauHois.MaCauHoi,
                              NoiDung = ct.CauHois.NoiDung,
                              DA = ct.CauHois.CauHoi_LuaChon.OrderBy(ii => ii.MaLuaChon).FirstOrDefault().LuaChon.NoiDung,
                              DB = ct.CauHois.CauHoi_LuaChon.OrderBy(ii=> ii.MaLuaChon).Skip(1).FirstOrDefault() != null ? ct.CauHois.CauHoi_LuaChon.OrderBy(ii => ii.MaLuaChon).Skip(1).FirstOrDefault().LuaChon.NoiDung : "",
                              DC = ct.CauHois.CauHoi_LuaChon.OrderBy(ii => ii.MaLuaChon).Skip(2).FirstOrDefault() != null ? ct.CauHois.CauHoi_LuaChon.OrderBy(ii => ii.MaLuaChon).Skip(2).FirstOrDefault().LuaChon.NoiDung : "",
                              DD = ct.CauHois.CauHoi_LuaChon.OrderBy(ii => ii.MaLuaChon).Skip(3).FirstOrDefault() != null ? ct.CauHois.CauHoi_LuaChon.OrderBy(ii => ii.MaLuaChon).Skip(3).FirstOrDefault().LuaChon.NoiDung : "",
                              DAD = ct.CauHois.CauHoi_LuaChon.Where(chlc => chlc.CauTraLoi).FirstOrDefault() != null ? ct.CauHois.CauHoi_LuaChon.Where(chlc => chlc.CauTraLoi).FirstOrDefault().LuaChon.NoiDung: "Không đáp án"
                          }).ToList();
                return Json(new { code = 200,dsCauHoi = rs, msg = "Load chi tiết câu hỏi thành công!" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { code = 500, msg = "Load chi tiết câu hỏi thất bại: " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        //GET: GiangVien/DeThis/Details/5
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
            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MacauHoi", "NoiDung");
            return View(deThi);
        }

        // GET: GiangVien/DeThis/Create
        public ActionResult Create()
        {
            ViewBag.MaKhoaHoc = new SelectList(db.KhoaHocs, "MaKhoaHoc", "TenKhoaHoc");
            return View();
        }

        // POST: GiangVien/DeThis/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaDeThi,TenMonThi,NgayThi,SoCauHoi,MaKhoaHoc,ThoiHanDeThi,ThoiGianLamBai")] DeThi deThi)
        {
            if (ModelState.IsValid)
            {
                db.DeThis.Add(deThi);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaKhoaHoc = new SelectList(db.KhoaHocs, "MaKhoaHoc", "TenKhoaHoc", deThi.MaKhoaHoc);
            return View(deThi);
        }

        // GET: GiangVien/DeThis/Edit/5
        public async Task<ActionResult> Edit(int? id)
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
            ViewBag.MaKhoaHoc = new SelectList(db.KhoaHocs, "MaKhoaHoc", "TenKhoaHoc", deThi.MaKhoaHoc);
            return View(deThi);
        }

        // POST: GiangVien/DeThis/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaDeThi,TenMonThi,NgayThi,SoCauHoi,MaKhoaHoc,ThoiHanDeThi,ThoiGianLamBai")] DeThi deThi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deThi).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaKhoaHoc = new SelectList(db.KhoaHocs, "MaKhoaHoc", "TenKhoaHoc", deThi.MaKhoaHoc);
            return View(deThi);
        }

        // GET: GiangVien/DeThis/Delete/5
        public async Task<ActionResult> Delete(int? id)
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
            return View(deThi);
        }

        // POST: GiangVien/DeThis/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            DeThi deThi = await db.DeThis.FindAsync(id);
            db.DeThis.Remove(deThi);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}
