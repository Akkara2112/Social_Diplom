using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.Models;

namespace Social_Diplon.Controllers
{
    public class LOLController : Controller
    {
        db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities();

        // GET: LOL
        public ActionResult Index()
        {
            ViewBag.Users = db.user_close_information.ToList();




            int sendId;
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {

                var c = db.talk.Where(x => x.id == 2).ToList();
                foreach (var i in c)
                {
                    foreach (var z in i.user_open_information)
                    {
                        sendId = z.id;
                    }
                }

                talk lol = new db_a3cf84_akkara2Entities().talk.Where(x => x.id == 1).FirstOrDefault();

               

            }
            

            return View();
        }
    }
}