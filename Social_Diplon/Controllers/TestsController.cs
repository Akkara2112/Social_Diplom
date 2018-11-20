using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.Models;
using Social_Diplon.Filters;

namespace Social_Diplon.Controllers
{
    public class TestsController : Controller
    {
        // GET: Tests
        [AuthCookieOnJob]
        public ActionResult TestList()
        {
            var id = logic.CookieProcessing.GetUserCookie(HttpContext);
            user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
            ViewBag.Raiting = Iam.rating.ToString();
            ViewBag.Prof = Iam.profession.name_of.ToString();
            return View();
        }
        public ActionResult ResultTest()
        {
            var id = logic.CookieProcessing.GetUserCookie(HttpContext);
            user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
            ViewBag.Raiting = Iam.rating.ToString();
            ViewBag.Prof = Iam.profession.name_of.ToString();
            return View();
        }
        public ActionResult Ends()
        {
            return PartialView();
        }

        [HttpPost]
        public ActionResult Consider(int optionsRadios1, int optionsRadios2, int optionsRadios3, int optionsRadios4, 
            int optionsRadios5, int optionsRadios6, int optionsRadios7, int optionsRadios8, int optionsRadios9, 
            int optionsRadios10, int optionsRadios11, int optionsRadios12, int optionsRadios13, int optionsRadios14, 
            int optionsRadios15, int optionsRadios16, int optionsRadios17, int optionsRadios18, int optionsRadios19, 
            int optionsRadios20, int optionsRadios21, int optionsRadios22, int optionsRadios23, int optionsRadios24, 
            int optionsRadios25, int optionsRadios26, int optionsRadios27, int optionsRadios28, int optionsRadios29, 
            int optionsRadios30)
        {
            var id = logic.CookieProcessing.GetUserCookie(HttpContext);
            user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
            ViewBag.Raiting = Iam.rating.ToString();
            ViewBag.Prof = Iam.profession.name_of.ToString();
            

            int i = optionsRadios1 + optionsRadios2 + optionsRadios3 + optionsRadios4 +
                optionsRadios6 + optionsRadios7 + optionsRadios8 + optionsRadios9 + 
                optionsRadios5 + optionsRadios10 + optionsRadios11 + optionsRadios12 + 
                optionsRadios13 + optionsRadios14 + optionsRadios15 + optionsRadios16 + 
                optionsRadios17 + optionsRadios18 + optionsRadios19 + optionsRadios20 + 
                optionsRadios21 + optionsRadios22 + optionsRadios23 + optionsRadios24 + 
                optionsRadios25 + optionsRadios26 + optionsRadios27 + optionsRadios28 + 
                optionsRadios29 + optionsRadios30;
            ViewBag.EndTest = i;
            return View();

        }
    }
}