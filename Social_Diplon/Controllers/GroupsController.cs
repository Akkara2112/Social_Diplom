using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Social_Diplon.Controllers
{
    public class GroupsController : Controller
    {
        // GET: Groups
        public ActionResult GroupsList()
        {
            return View();
        }

        public ActionResult GroupInfo()
        {
            return View();
        }
    }
}