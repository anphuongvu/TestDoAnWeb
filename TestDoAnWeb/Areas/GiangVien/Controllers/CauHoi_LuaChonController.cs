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
    public class CauHoi_LuaChonController : Controller
    {
        private QLThiTracNghiemOnlEntities db = new QLThiTracNghiemOnlEntities();

        // GET: GiangVien/CauHoi_LuaChon
        public async Task<ActionResult> Index()
        {
            var cauHoi_LuaChon = db.CauHoi_LuaChon.Include(c => c.CauHois).Include(c => c.LuaChon);
            return View(await cauHoi_LuaChon.ToListAsync());
        }

        // GET: GiangVien/CauHoi_LuaChon/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHoi_LuaChon cauHoi_LuaChon = await db.CauHoi_LuaChon.FindAsync(id);
            if (cauHoi_LuaChon == null)
            {
                return HttpNotFound();
            }
            return View(cauHoi_LuaChon);
        }

        // GET: GiangVien/CauHoi_LuaChon/Create
        public ActionResult Create()
        {
            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MaCauHoi", "NoiDung");
            ViewBag.MaLuaChon = new SelectList(db.LuaChons, "MaLuaChon", "NoiDung");
            return View();
        }

        // POST: GiangVien/CauHoi_LuaChon/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaCauHoi,MaLuaChon,CauTraLoi")] CauHoi_LuaChon cauHoi_LuaChon)
        {
            if (ModelState.IsValid)
            {
                db.CauHoi_LuaChon.Add(cauHoi_LuaChon);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MaCauHoi", "NoiDung", cauHoi_LuaChon.MaCauHoi);
            ViewBag.MaLuaChon = new SelectList(db.LuaChons, "MaLuaChon", "NoiDung", cauHoi_LuaChon.MaLuaChon);
            return View(cauHoi_LuaChon);
        }

        // GET: GiangVien/CauHoi_LuaChon/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHoi_LuaChon cauHoi_LuaChon = await db.CauHoi_LuaChon.FindAsync(id);
            if (cauHoi_LuaChon == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MaCauHoi", "NoiDung", cauHoi_LuaChon.MaCauHoi);
            ViewBag.MaLuaChon = new SelectList(db.LuaChons, "MaLuaChon", "NoiDung", cauHoi_LuaChon.MaLuaChon);
            return View(cauHoi_LuaChon);
        }

        // POST: GiangVien/CauHoi_LuaChon/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaCauHoi,MaLuaChon,CauTraLoi")] CauHoi_LuaChon cauHoi_LuaChon)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cauHoi_LuaChon).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaCauHoi = new SelectList(db.CauHois, "MaCauHoi", "NoiDung", cauHoi_LuaChon.MaCauHoi);
            ViewBag.MaLuaChon = new SelectList(db.LuaChons, "MaLuaChon", "NoiDung", cauHoi_LuaChon.MaLuaChon);
            return View(cauHoi_LuaChon);
        }

        // GET: GiangVien/CauHoi_LuaChon/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHoi_LuaChon cauHoi_LuaChon = await db.CauHoi_LuaChon.FindAsync(id);
            if (cauHoi_LuaChon == null)
            {
                return HttpNotFound();
            }
            return View(cauHoi_LuaChon);
        }

        // POST: GiangVien/CauHoi_LuaChon/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            CauHoi_LuaChon cauHoi_LuaChon = await db.CauHoi_LuaChon.FindAsync(id);
            db.CauHoi_LuaChon.Remove(cauHoi_LuaChon);
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
