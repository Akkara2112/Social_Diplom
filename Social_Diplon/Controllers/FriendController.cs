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
    public class FriendController : Controller
    {
        // GET: Friend
        [AuthCookieOnJob]
        public ActionResult FriengList()
        {
            //int i = 0;
            ReturnPeoples returnPeoples;
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                var id = logic.CookieProcessing.GetUserCookie(HttpContext);
                user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
                ViewBag.Raiting = Iam.rating.ToString();
                ViewBag.Prof = Iam.profession.name_of.ToString();
                user_open_information friends = new db_a3cf84_akkara2Entities().user_open_information.Where(c => c.id == id).FirstOrDefault();
                ViewBag.Friends = friends.user_open_information2.Select(s => new ReturnPeoples(s)).ToList();
            }
            return View();
        }

        [HttpGet]
        public ActionResult FindFriends(string FindFriend)
        {
            try
            {
                var id = logic.CookieProcessing.GetUserCookie(HttpContext);
                user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
                ViewBag.Raiting = Iam.rating.ToString();
                ViewBag.Prof = Iam.profession.name_of.ToString();
                string[] names = FindFriend.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                ReturnPeoples returnPeoples;
                using(db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
                {
                    if (names.Count() == 1)
                    {
                        string first = names[0];
                        ViewBag.Peoples = db.user_open_information.Where(x => 
                        ((x.first_name.Contains(first)) || 
                        (x.last_name.Contains(first)))&&
                        (x.id != id)).Distinct()
                        .ToList().Select(x => new ReturnPeoples(x)).ToList();
                    }
                    if (names.Count() == 2 )
                    {
                        string first = names[0];
                        string last = names[1];
                        ViewBag.Peoples = db.user_open_information.Where(x => 
                        ((x.first_name.Contains(first) && x.last_name.Contains(last))|| 
                        (x.first_name.Contains(last) && x.last_name.Contains(first))||
                        (x.first_name.Contains(first))||
                        (x.last_name.Contains(last)) || 
                        (x.first_name.Contains(last)) || 
                        (x.last_name.Contains(first)))&&
                        (x.id!=id)).Distinct()
                        .ToList().Select(x => new ReturnPeoples(x)).ToList();
                    }
                }
                return View();
            }
            catch
            {
                return RedirectToAction("FriengList");
            }
        }

        [HttpPost]
        public ActionResult AddFriend(int userId)
        {
            var id = logic.CookieProcessing.GetUserCookie(HttpContext);

            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                var addI = db.user_open_information.Where(x => x.id == id).ToList().FirstOrDefault();
                var addFr = db.user_open_information.Where(x => x.id == userId).ToList().FirstOrDefault();
                addI.user_open_information2.Add(addFr);
                addI.user_open_information1.Add(addFr);
                //addI.user_open_information1.Add(addFr);
                //addI.user_open_information2.Add(addI);
                db.SaveChanges();
            }

            return RedirectToAction("FriengList");
        }
        public ActionResult SendMessage(string userText, int userId)
        {
            var id = logic.CookieProcessing.GetUserCookie(HttpContext);
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                var talk = db.user_open_information.Where(x => x.id == id).ToList().FirstOrDefault()?.talk.Where(x => x.user_open_information.Count(z => z.id == userId) != 0).FirstOrDefault();
                var d = 0;
                if (talk != null)
                {
                    message mes = new message
                    {
                        sending_time = DateTime.Now,
                        talk_id = talk.id,
                        user_text = userText,
                        user_id = id
                    };
                    db.message.Add(mes);
                    db.SaveChanges();
                }
                else
                {
                    var i = db.user_open_information.Where(x => x.id == id).ToList().FirstOrDefault();
                    var j = db.user_open_information.Where(x => x.id == userId).ToList().FirstOrDefault();
                    talk temp = new talk
                    {
                        date_of_creation = DateTime.Now.ToString(),
                        name_of = (i.last_name + ", " + j.last_name).ToString(),
                    };
                    db.talk.Add(temp);
                    db.SaveChanges();
                    message mes = new message
                    {
                        sending_time = DateTime.Now,
                        talk_id = temp.id,
                        user_text = userText,
                        user_id = id
                    };
                    i.talk.Add(temp);
                    j.talk.Add(temp);
                    db.message.Add(mes);
                    db.SaveChanges();
                }
            }
            return RedirectToAction("FriengList");
        }
    }
}