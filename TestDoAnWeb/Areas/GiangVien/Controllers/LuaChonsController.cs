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
    public class LuaChonsController : Controller
    {
        private QLThiTracNghiemOnlEntities db = new QLThiTracNghiemOnlEntities();

        // GET: GiangVien/LuaChons
        public async Task<ActionResult> Index()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("Login", "Default");
            }
            return View(await db.LuaChons.ToListAsync());
        }

        // GET: GiangVien/LuaChons/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LuaChon luaChon = await db.LuaChons.FindAsync(id);
            if (luaChon == null)
            {
                return HttpNotFound();
            }
            return View(luaChon);
        }

        // GET: GiangVien/LuaChons/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GiangVien/LuaChons/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaLuaChon,NoiDung")] LuaChon luaChon)
        {
            if (ModelState.IsValid)
            {
                db.LuaChons.Add(luaChon);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(luaChon);
        }

        // GET: GiangVien/LuaChons/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LuaChon luaChon = await db.LuaChons.FindAsync(id);
            if (luaChon == null)
            {
                return HttpNotFound();
            }
            return View(luaChon);
        }

        // POST: GiangVien/LuaChons/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaLuaChon,NoiDung")] LuaChon luaChon)
        {
            if (ModelState.IsValid)
            {
                db.Entry(luaChon).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(luaChon);
        }

        // GET: GiangVien/LuaChons/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LuaChon luaChon = await db.LuaChons.FindAsync(id);
            if (luaChon == null)
            {
                return HttpNotFound();
            }
            return View(luaChon);
        }

        // POST: GiangVien/LuaChons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            LuaChon luaChon = await db.LuaChons.FindAsync(id);
            db.LuaChons.Remove(luaChon);
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
