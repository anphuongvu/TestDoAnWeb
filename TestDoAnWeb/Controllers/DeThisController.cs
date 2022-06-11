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
            ViewBag.cauhois = db.CauHois.Where(item => item.MaDeThi == id).ToList();
            ViewBag.quest_idx = 0;
            if (deThi == null)
            {
                return HttpNotFound();
            }
            return View(deThi);
        }
    }
}
