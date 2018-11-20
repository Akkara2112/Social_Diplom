using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.Models;
using Social_Diplon.logic;
using Social_Diplon.Filters;

namespace Social_Diplon.Controllers
{
    public class SettingsController : Controller
    {
        // GET: Settings
        [AuthCookieOnJob]
        public ActionResult SettingsList()
        {
            var id = CookieProcessing.GetUserCookie(HttpContext);
            user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
            ViewBag.Raiting = Iam.rating.ToString();
            ViewBag.Prof = Iam.profession.name_of.ToString();

            using(db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                ViewBag.Contacts = db.contact_type.ToList().Select(x => new ReturnContactsInf(x)).ToList();
                ViewBag.Cities = db.city.ToList().Select(x => new ReturnCities(x)).ToList();
            }

            return View();
        }

        [HttpPost]
        public ActionResult GetSettings(string about, string quote, string choseCity, DateTime date, string first, string last, string patronymic)
        {
            var id = CookieProcessing.GetUserCookie(HttpContext);
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                var Iam = db.user_open_information.Where(x => x.id == id).FirstOrDefault();
                if (about != null)
                {
                    Iam.about_youself = about;
                }
                if (quote != null)
                {
                    Iam.user_quote = quote;
                }
                if (choseCity != null)
                {
                    Iam.city_id = db.city.Where(x => x.name_of == choseCity).FirstOrDefault().id;
                }
                if (date != null)
                {
                    Iam.date_of_birth = date;
                }
                if (first != null)
                {
                    Iam.first_name = first;
                }
                if (last != null)
                {
                    Iam.last_name = last;
                }
                if (patronymic != null)
                {
                    Iam.patronymic = patronymic;
                }
                db.SaveChanges();

            }

            return RedirectToAction("SettingsList");
        }

    }
}