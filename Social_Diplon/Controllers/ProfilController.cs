using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.Models;
using Social_Diplon.Filters;

namespace Social_Diplon.Controllers
{
    public class ProfilController : Controller
    {
        [AuthCookieOnJob]
        public ActionResult YourselfProfil()
        {
                var id = logic.CookieProcessing.GetUserCookie(HttpContext);
                user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
                ViewBag.Raiting = Iam.rating.ToString();
                ViewBag.Prof = Iam.profession.name_of.ToString();
                ReturnYouself returnYouself;
                UserPosts userPosts;
                using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
                {
                    ViewBag.I = db.user_open_information.Where(x => x.id == id).ToList().Select(x => new ReturnYouself(x)).ToList();
                    ViewBag.Posts = db.user_post.Where(x => x.user_id == id).OrderByDescending(x=> x.id).ToList().Select(x => new UserPosts(x)).ToList();
                }
                return View();
        }

        public ActionResult OtherProfil(int id)
        {
            var Iid = logic.CookieProcessing.GetUserCookie(HttpContext);
            user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == Iid).FirstOrDefault();
            ViewBag.Raiting = Iam.rating.ToString();
            ViewBag.Prof = Iam.profession.name_of.ToString();
            ReturnYouself returnYouself;
            UserPosts userPosts;
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                ViewBag.I = db.user_open_information.Where(x => x.id == id).ToList().Select(x => new ReturnYouself(x)).ToList();
                ViewBag.Posts = db.user_post.Where(x => x.user_id == id).OrderByDescending(x => x.id).ToList().Select(x => new UserPosts(x)).ToList();
            }
            return View();
        }

        [HttpPost]
        public ActionResult GetUserPost(HttpPostedFileBase uploadpostpic, string postarea)
        {
            

            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                if (uploadpostpic != null)
                {
                    // получаем имя файла
                    string fileName = System.IO.Path.GetFileName(uploadpostpic.FileName);
                    // сохраняем файл в папку Files в проекте
                    uploadpostpic.SaveAs(Server.MapPath("~/Images/users/userposts/" + fileName));
                    user_post newpost = new user_post
                    {
                        user_id = logic.CookieProcessing.GetUserCookie(HttpContext),
                        description = postarea,
                        date_of_creation = DateTime.Now.ToString(),
                        photo_path = ("/Images/users/userposts/" + fileName).ToString()

                    };
                    db.user_post.Add(newpost);
                    db.SaveChanges();
                }
                else
                {
                    user_post newpost = new user_post
                    {
                        user_id = logic.CookieProcessing.GetUserCookie(HttpContext),
                        description = postarea,
                        date_of_creation = DateTime.Now.ToString(),
                    };
                    db.user_post.Add(newpost);
                    db.SaveChanges();
                }
            }
            return RedirectToAction("YourselfProfil");
        }

        [HttpPost]
        public ActionResult UpdateUserAvatar(HttpPostedFileBase UpdateAvatar)
        {
            var id = logic.CookieProcessing.GetUserCookie(HttpContext);
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                if (UpdateAvatar != null)
                {
                    var user = db.user_open_information.Where(x => x.id == id).FirstOrDefault();
                    if(user != null)
                    {
                        // получаем имя файла
                        string fileName = System.IO.Path.GetFileName(UpdateAvatar.FileName);
                        // сохраняем файл в папку Files в проекте
                        UpdateAvatar.SaveAs(Server.MapPath("~/Images/users/useravatar" + fileName));
                        user.avatar_path = ("/Images/users/useravatar" + fileName).ToString();
                        db.SaveChanges();
                    }
                }
            }
                return RedirectToAction("YourselfProfil");
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
            return RedirectToAction("OtherProfil",new { id = userId});
        }
    }
}