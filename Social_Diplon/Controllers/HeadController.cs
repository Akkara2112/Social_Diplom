using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.Models;

namespace Social_Diplon.Controllers
{
    public class HeadController : Controller
    {
        // GET: Head
        public ActionResult head()
        {
            var id = logic.CookieProcessing.GetUserCookie(HttpContext);
            user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
            ViewBag.Raiting = Iam.rating.ToString();
            ViewBag.Prof = Iam.profession.name_of.ToString();

            return PartialView();
        }

        public ActionResult section()
        {
            return PartialView();
        }

    }
}