using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.Models;
using Social_Diplon.logic;
using System.Web.Mvc.Ajax;
using Social_Diplon.Filters;

namespace Social_Diplon.Controllers
{
    public class RegistrationAndLoginController : Controller
    {
        // GET: RegistrationAndLogin
        [AuthOnRegLog]
        public ActionResult Index()
        {
            db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities();
            var cities = db.city.AsNoTracking().ToList();

            return View(cities);
        }

        public ActionResult test()
        {
            db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities();


            var userr = db.user_close_information.AsNoTracking().ToList();


            return View(userr);
        }

        public ActionResult CheckLogin()
        {
            return Content("AAAAA");
        }

        [HttpPost]
        public JsonResult Registration(string LoginField, string PasswordInField, 
                                        string LastNameField, string FirstNameField, string FathertNameField,
                                        int testSomeSelector, DateTime testSomeDate,
                                        int optionsRadios, string testSomeText1, string testSomeText2)
        {
            logic.Regictration rep = new Regictration();
            if (rep.Repeating(LoginField))
            {
                logic.Regictration regictration = new Regictration();
                regictration.Regis(LoginField,
                                    PasswordInField, LastNameField,
                                    FirstNameField, FathertNameField,
                                    testSomeSelector, testSomeDate, optionsRadios,
                                    testSomeText1, testSomeText2);
                using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
                {
                    int idforcookie = 0;
                    var us = db.user_close_information.AsNoTracking().Where(x => x.user_login == LoginField && x.user_pasword == PasswordInField);
                    foreach (user_close_information u in us)
                        idforcookie = u.id;
                    logic.CookieProcessing.SetUserCookie(HttpContext, idforcookie);
                        }
                return Json(new { IsSuccess = true });
            }
            return Json(new { IsSuccess = false });
        }
        [HttpPost]
        public JsonResult LogIn (string LoginField, string PasswordField)
        {
            logic.LoginOn loginOn = new LoginOn();
            if (loginOn.SearchUserForLogIn(LoginField, PasswordField))
            {
                using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
                {
                    int idforcookie = 0;
                    var us = db.user_close_information.AsNoTracking().Where(x => x.user_login == LoginField && x.user_pasword == PasswordField);
                    foreach (user_close_information u in us)
                        idforcookie = u.id;
                    logic.CookieProcessing.SetUserCookie(HttpContext, idforcookie);
                }
                return Json(new { IsSuccess = true });
            }
            return Json(new { IsSuccess = false });
        }
    }
}