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
using System.IO;
using OfficeOpenXml;
//using Excel = Microsoft.Office.Interop.Excel;

namespace TestDoAnWeb.Areas.GiangVien.Controllers
{
    public class CauHoisController : Controller
    {
        private QLThiTracNghiemOnlEntities db = new QLThiTracNghiemOnlEntities();

        // GET: GiangVien/CauHois
        public async Task<ActionResult> Index()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("Login", "Default");
            }
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

        private void XuLy(string maLuaChon, string luachon, int maCauHoi, bool dapan = false)
        {
            
            if (maLuaChon != "")
            {
                int mlc = int.Parse(maLuaChon);
                // cập nhật lựa chọn cũ
                LuaChon luaChon = db.LuaChons.Where(lc => lc.MaLuaChon == mlc).FirstOrDefault();
                luaChon.NoiDung = luachon;
                db.Entry(luaChon).State = EntityState.Modified;

                // câp nhật đáp án false
                CauHoi_LuaChon chlc = db.CauHoi_LuaChon.Where(lc => lc.MaLuaChon == mlc).FirstOrDefault();
                if (chlc != null)
                {
                    chlc.CauTraLoi = dapan;
                    db.Entry(chlc).State = EntityState.Modified;
                }
                
            }
            else
            {
                // them lựa chọn mới
                if (luachon != "")
                {
                    // them lựa chọn
                    if (db.LuaChons.Where(lc => lc.NoiDung == luachon).ToList().Count == 0)
                    {
                        LuaChon luaChon = new LuaChon();
                        luaChon.NoiDung = luachon;
                        db.LuaChons.Add(luaChon);
                        db.SaveChanges();
                    }

                    LuaChon newLC = db.LuaChons.Where(lc => lc.NoiDung == luachon).FirstOrDefault();

                    // thêm câu hỏi lựa chọn
                    CauHoi_LuaChon chlc = db.CauHoi_LuaChon.Where(clc => clc.MaCauHoi == maCauHoi && clc.MaLuaChon == newLC.MaLuaChon).FirstOrDefault();
                    if (chlc == null)
                    {
                        chlc = new CauHoi_LuaChon();
                        chlc.MaCauHoi = maCauHoi;
                        chlc.MaLuaChon = newLC.MaLuaChon;
                        chlc.CauTraLoi = dapan;
                        db.CauHoi_LuaChon.Add(chlc);
                    }    
                    else
                    {
                        chlc.CauTraLoi = dapan;
                        db.Entry(chlc).State = EntityState.Modified;
                    }
                    db.SaveChanges();
                }
            }
            
        }

        [HttpPost]
        public ActionResult EditCauHoiLuaChon(string maCauHoi, string lc1, string lc2, string lc3, string lc4, string dapan=null, string id1 =null, string id2 = null, string id3 = null, string id4 = null)
        {

            XuLy(id1, lc1, int.Parse(maCauHoi));
            XuLy(id2, lc2, int.Parse(maCauHoi));
            XuLy(id3, lc3, int.Parse(maCauHoi));
            XuLy(id4, lc4, int.Parse(maCauHoi));
            if(dapan != "")
            {
                int da = int.Parse(dapan);
                CauHoi_LuaChon chlc = db.CauHoi_LuaChon.Where(lc => lc.MaLuaChon == da).FirstOrDefault();
                if(chlc != null)
                {
                    chlc.CauTraLoi = true;
                }
                db.Entry(chlc).State = EntityState.Modified;
            }

            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
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

        public ActionResult ThemTuExcel(HttpPostedFileBase formFile)
        {
            // lấy mã giáo viên
            int? maGV = 1;
            if (Session["TaiKhoan"] != null)
            {
                if(((TaiKhoan)Session["TaiKhoan"]).GiaoVien != null)
                    maGV = ((TaiKhoan)Session["TaiKhoan"]).GiaoVien.MaGiaoVien;
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (formFile != null)
                    {
                        // upload
                        //string path = Path.Combine(Server.MapPath("~/Upload"), formFile.FileName);
                        //formFile.SaveAs(path);
                        ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                        using (var package = new ExcelPackage(formFile.InputStream))
                        {
                            // get the first worksheet in the workbook
                            ExcelWorksheet worksheet = package.Workbook.Worksheets.FirstOrDefault();
                            
                            if (worksheet != null)
                            {
                                var start = worksheet.Dimension.Start;
                                var end = worksheet.Dimension.End;
                                for (int row = start.Row+1; row <= end.Row; row++)
                                { // Row by row...
                                    // Thêm câu hỏi

                                    // kiểm tra trùng
                                    CauHois ch = null;
                                    string noidungCH = worksheet.Cells[row, 1].Text;
                                    if (db.CauHois.Where(cc => cc.NoiDung.Equals(noidungCH)).ToList().Count == 0)
                                    {
                                        ch = new CauHois();
                                        ch.MaGiaoVien = maGV;
                                        ch.NoiDung = worksheet.Cells[row, 1].Text;
                                        db.CauHois.Add(ch);
                                        db.SaveChanges();
                                    }

                                    // thêm lựa chọn
                                    ch = db.CauHois.Where(cc => cc.NoiDung.Equals(noidungCH)).FirstOrDefault();
                                    if(ch != null)
                                    {
                                        int da = 1;
                                        if (worksheet.Cells[row, 6].Text != "")
                                        {
                                            da = int.Parse(worksheet.Cells[row, 6].Text);
                                            
                                        }

                                        XuLy("", worksheet.Cells[row, 2].Text, ch.MaCauHoi, da == 1);
                                        XuLy("", worksheet.Cells[row, 3].Text, ch.MaCauHoi, da == 2);
                                        XuLy("", worksheet.Cells[row, 4].Text, ch.MaCauHoi, da == 3);
                                        XuLy("", worksheet.Cells[row, 5].Text, ch.MaCauHoi, da == 4);
                                    }    

                                }
                            }
                            
                        } // the using 

                        // đọc file với chuyển vô SQL
                    }
                }
                catch (Exception e)
                {
                    ViewBag.FileStatus = "Error while file uploading.";
                }
            }

            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}
