using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestDoAnWeb.Areas.GiangVien.Controllers
{
    public class HomeController : Controller
    {
        // GET: GiangVien/Home
        public ActionResult Index()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("Login", "Default");
            }
            return View();
        }
    }
}