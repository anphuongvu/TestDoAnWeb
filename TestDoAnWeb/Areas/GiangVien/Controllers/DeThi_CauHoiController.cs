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
    public class DeThi_CauHoiController : Controller
    {
        private QLThiTracNghiemEntities db = new QLThiTracNghiemEntities();

        // GET: GiangVien/DeThi_CauHoi
        public async Task<ActionResult> Index()
        {
            var deThi_CauHoi = db.DeThi_CauHoi.Include(d => d.CauHoi).Include(d => d.DeThi);
            return View(await deThi_CauHoi.ToListAsync());
        }

        // GET: GiangVien/DeThi_CauHoi/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeThi_CauHoi deThi_CauHoi = await db.DeThi_CauHoi.FindAsync(id);
            if (deThi_CauHoi == null)
            {
                return HttpNotFound();
            }
            return View(deThi_CauHoi);
        }

        // GET: GiangVien/DeThi_CauHoi/Create
        public ActionResult Create()
        {
            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MaCauHoi", "NoiDung");
            ViewBag.MaCauHoi = new SelectList(db.DeThis, "MaDeThi", "TenMonThi");
            return View();
        }

        // POST: GiangVien/DeThi_CauHoi/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaDeThi,MaCauHoi")] DeThi_CauHoi deThi_CauHoi)
        {
            if (ModelState.IsValid)
            {
                db.DeThi_CauHoi.Add(deThi_CauHoi);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MaCauHoi", "NoiDung", deThi_CauHoi.MaCauHoi);
            ViewBag.MaCauHoi = new SelectList(db.DeThis, "MaDeThi", "TenMonThi", deThi_CauHoi.MaCauHoi);
            return View(deThi_CauHoi);
        }

        // GET: GiangVien/DeThi_CauHoi/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeThi_CauHoi deThi_CauHoi = await db.DeThi_CauHoi.FindAsync(id);
            if (deThi_CauHoi == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MaCauHoi", "NoiDung", deThi_CauHoi.MaCauHoi);
            ViewBag.MaCauHoi = new SelectList(db.DeThis, "MaDeThi", "TenMonThi", deThi_CauHoi.MaCauHoi);
            return View(deThi_CauHoi);
        }

        // POST: GiangVien/DeThi_CauHoi/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaDeThi,MaCauHoi")] DeThi_CauHoi deThi_CauHoi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deThi_CauHoi).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MaCauHoi", "NoiDung", deThi_CauHoi.MaCauHoi);
            ViewBag.MaCauHoi = new SelectList(db.DeThis, "MaDeThi", "TenMonThi", deThi_CauHoi.MaCauHoi);
            return View(deThi_CauHoi);
        }

        // GET: GiangVien/DeThi_CauHoi/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeThi_CauHoi deThi_CauHoi = await db.DeThi_CauHoi.FindAsync(id);
            if (deThi_CauHoi == null)
            {
                return HttpNotFound();
            }
            return View(deThi_CauHoi);
        }

        // POST: GiangVien/DeThi_CauHoi/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            DeThi_CauHoi deThi_CauHoi = await db.DeThi_CauHoi.FindAsync(id);
            db.DeThi_CauHoi.Remove(deThi_CauHoi);
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
