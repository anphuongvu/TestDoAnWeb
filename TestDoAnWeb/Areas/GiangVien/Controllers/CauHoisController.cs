using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestDoAnWeb.Models;

namespace TestDoAnWeb.Areas.GiangVien.Controllers
{
    public class CauHoisController : Controller
    {
        private QLThiTracNghiemEntities db = new QLThiTracNghiemEntities();

        // GET: GiangVien/CauHois
        public ActionResult Index()
        {
            var cauHois = db.CauHois.Include(c => c.GiaoVien);
            return View(cauHois.ToList());
        }

        // GET: GiangVien/CauHois/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHoi cauHoi = db.CauHois.Find(id);
            if (cauHoi == null)
            {
                return HttpNotFound();
            }
            return View(cauHoi);
        }

        // GET: GiangVien/CauHois/Create
        public ActionResult Create()
        {
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens, "MaGiaoVien", "HoTen");
            return View();
        }

        // POST: GiangVien/CauHois/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaCauHoi,MaGiaoVien,NoiDung,DapAnA,DapAnB,DapAnC,DapAnD,CauTraLoiDung")] CauHoi cauHoi)
        {
            if (ModelState.IsValid)
            {
                db.CauHois.Add(cauHoi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens, "MaGiaoVien", "HoTen", cauHoi.MaGiaoVien);
            return View(cauHoi);
        }

        // GET: GiangVien/CauHois/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHoi cauHoi = db.CauHois.Find(id);
            if (cauHoi == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens, "MaGiaoVien", "HoTen", cauHoi.MaGiaoVien);
            return View(cauHoi);
        }

        // POST: GiangVien/CauHois/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaCauHoi,MaGiaoVien,NoiDung,DapAnA,DapAnB,DapAnC,DapAnD,CauTraLoiDung")] CauHoi cauHoi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cauHoi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaGiaoVien = new SelectList(db.GiaoViens, "MaGiaoVien", "HoTen", cauHoi.MaGiaoVien);
            return View(cauHoi);
        }

        // GET: GiangVien/CauHois/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CauHoi cauHoi = db.CauHois.Find(id);
            if (cauHoi == null)
            {
                return HttpNotFound();
            }
            return View(cauHoi);
        }

        // POST: GiangVien/CauHois/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CauHoi cauHoi = db.CauHois.Find(id);
            db.CauHois.Remove(cauHoi);
            db.SaveChanges();
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
