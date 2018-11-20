using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.logic;
using Social_Diplon.Filters;
using Social_Diplon.Models;


namespace Social_Diplon.Controllers
{
    public class MessagesController : Controller
    {
        //GET: Messages
       [AuthCookieOnJob]

        public ActionResult MessageList()
        {

            var id = logic.CookieProcessing.GetUserCookie(HttpContext);
            user_open_information Iam = new db_a3cf84_akkara2Entities().user_open_information.AsNoTracking().Where(c => c.id == id).FirstOrDefault();
            ViewBag.Raiting = Iam.rating.ToString();
            ViewBag.Prof = Iam.profession.name_of.ToString();

            var idUser = logic.CookieProcessing.GetUserCookie(HttpContext);
            var idTalk = 1;
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                //диалоги, которые есть у пользователя
                //var temp = db.talk.Where(x => x.user_open_information.Where(z => z.id == id).Count() != 0).Select(x=> new ReturnTalks(x)).ToList();
                ViewBag.AllTalks = db.talk.Where(x => x.user_open_information.Where(z => z.id == id).Count() != 0).ToList().Select(x => new ReturnTalks(x)).ToList();
                //temp.Where(x=> x.message.Where(z=> z.))

                //пользователь, который находится в диалоге
                // var temp = db.user_open_information.Where(x => x.talk.Where(z => z.id == idTalk).Count() != 0 && x.id != idUser).ToList().FirstOrDefault();
            }



            return View();
        }
        public int ReturnIId()
        {
            return logic.CookieProcessing.GetUserCookie(HttpContext);
        }

        [HttpPost]
        //public List<ReturnMessages> returnMessages(string id, string Iid)

        public ActionResult returnMessages(int Iid)
        {
            int id = CookieProcessing.GetUserCookie(HttpContext);
            ViewBag.IId = id;
            ViewBag.OtherId = Iid;

            //лол
            db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities();
            //var id = logic.CookieProcessing.GetUserCookie(HttpContext);
            var talk = db.user_open_information.Where(x => x.id == Iid).ToList().FirstOrDefault()?.talk.Where(x => x.user_open_information.Count(z => z.id == id) != 0).ToList().FirstOrDefault();
            if (talk == null)
                return null;
            var mess = db.message.Where(x => x.talk_id == talk.id).ToList().OrderByDescending(x => x.sending_time);
            ViewBag.Mehh = mess.Select(x => new ReturnMessages(x)).ToList();
            return PartialView();
        }


    }
}