using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TestDoAnWeb
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "GiangVienPage",
                "GiangVien/{controller}/{action}",
                new { area = "GiangVien", controller = "Home", action = "Index" },
                new[] { typeof(Areas.Admin.Controllers.HomeController).Namespace }
            );

            routes.MapRoute(
                "AdminPage",
                "Admin/{controller}/{action}",
                new { area = "Admin", controller = "Home", action = "Index" },
                new[] { typeof(Areas.Admin.Controllers.HomeController).Namespace }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "TestDoAnWeb.Controllers" }
            );
        }
    }
}
