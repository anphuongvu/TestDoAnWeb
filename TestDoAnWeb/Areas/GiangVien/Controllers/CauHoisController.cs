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
    public class CauHoisController : Controller
    {
        private QLThiTracNghiemOnlEntities db = new QLThiTracNghiemOnlEntities();

        // GET: GiangVien/CauHois
        public async Task<ActionResult> Index()
        {
            var cauHois = db.CauHois.Include(c => c.DeThi).Include(c => c.GiaoVien);
            return View(await cauHois.ToListAsync());
        }

        // GET: GiangVien/CauHois/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHois cauHois = await db.CauHois.FindAsync(id);
            if (cauHois == null)
            {
                return HttpNotFound();
            }
            return View(cauHois);
        }

        // GET: GiangVien/CauHois/Create
        public ActionResult Create()
        {
            ViewBag.MaDeThi = new SelectList(db.DeThis, "MaDeThi", "TenMonThi");
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens, "MaGiaoVien", "HoTen");
            return View();
        }

        // POST: GiangVien/CauHois/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaCauHoi,MaDeThi,NoiDung,MaGiaoVien")] CauHois cauHois)
        {
            if (ModelState.IsValid)
            {
                db.CauHois.Add(cauHois);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaDeThi = new SelectList(db.DeThis, "MaDeThi", "TenMonThi", cauHois.MaDeThi);
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens, "MaGiaoVien", "HoTen", cauHois.MaGiaoVien);
            return View(cauHois);
        }

        // GET: GiangVien/CauHois/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHois cauHois = await db.CauHois.FindAsync(id);
            if (cauHois == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDeThi = new SelectList(db.DeThis, "MaDeThi", "TenMonThi", cauHois.MaDeThi);
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens, "MaGiaoVien", "HoTen", cauHois.MaGiaoVien);
            return View(cauHois);
        }

        // POST: GiangVien/CauHois/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaCauHoi,MaDeThi,NoiDung,MaGiaoVien")] CauHois cauHois)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cauHois).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaDeThi = new SelectList(db.DeThis, "MaDeThi", "TenMonThi", cauHois.MaDeThi);
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens, "MaGiaoVien", "HoTen", cauHois.MaGiaoVien);
            return View(cauHois);
        }

        // GET: GiangVien/CauHois/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHois cauHois = await db.CauHois.FindAsync(id);
            if (cauHois == null)
            {
                return HttpNotFound();
            }
            return View(cauHois);
        }

        // POST: GiangVien/CauHois/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            CauHois cauHois = await db.CauHois.FindAsync(id);
            db.CauHois.Remove(cauHois);
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
