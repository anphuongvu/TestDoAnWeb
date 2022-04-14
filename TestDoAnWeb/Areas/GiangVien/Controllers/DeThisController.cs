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
        private QLThiTracNghiemEntities db = new QLThiTracNghiemEntities();

        // GET: GiangVien/DeThis
        public async Task<ActionResult> Index()
        {
            var deThis = db.DeThis.Include(d => d.MonThi);
            return View(await deThis.ToListAsync());
        }

        // GET: GiangVien/DeThis/Details/5
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
            return View(deThi);
        }

        // GET: GiangVien/DeThis/Create
        public ActionResult Create()
        {
            ViewBag.MaMonThi = new SelectList(db.MonThis, "MaMonThi", "TenKiThi");
            return View();
        }

        // POST: GiangVien/DeThis/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaDeThi,MaMonThi,TenMonThi,NgayThi,SoCauHoi")] DeThi deThi)
        {
            if (ModelState.IsValid)
            {
                db.DeThis.Add(deThi);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaMonThi = new SelectList(db.MonThis, "MaMonThi", "TenKiThi", deThi.MaMonThi);
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
            ViewBag.MaMonThi = new SelectList(db.MonThis, "MaMonThi", "TenKiThi", deThi.MaMonThi);
            return View(deThi);
        }

        // POST: GiangVien/DeThis/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaDeThi,MaMonThi,TenMonThi,NgayThi,SoCauHoi")] DeThi deThi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deThi).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaMonThi = new SelectList(db.MonThis, "MaMonThi", "TenKiThi", deThi.MaMonThi);
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
