using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.logic;
using Social_Diplon.Filters;

namespace Social_Diplon.Controllers
{
    public class ExitController : Controller
    {
        // GET: Exit
        public ActionResult Index()
        {
            CookieProcessing.DropUserCookie(HttpContext);
            return Redirect("/RegistrationAndLogin/Index");
        }
    }
}