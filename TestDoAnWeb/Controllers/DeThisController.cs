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

        // GET: DeThis/Create
        public ActionResult Create()
        {
            ViewBag.MaKhoaHoc = new SelectList(db.KhoaHocs, "MaKhoaHoc", "TenKhoaHoc");
            return View();
        }

        // POST: DeThis/Create
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

        // GET: DeThis/Edit/5
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

        // POST: DeThis/Edit/5
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

        // GET: DeThis/Delete/5
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

        // POST: DeThis/Delete/5
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
