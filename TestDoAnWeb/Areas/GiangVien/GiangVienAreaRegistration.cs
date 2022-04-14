using System.Web.Mvc;

namespace TestDoAnWeb.Areas.GiangVien
{
    public class GiangVienAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "GiangVien";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "GiangVien_default",
                "GiangVien/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}