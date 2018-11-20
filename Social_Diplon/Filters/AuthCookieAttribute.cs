using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Social_Diplon.logic;
using Social_Diplon.Models;

namespace Social_Diplon.Filters
{
    public class AuthCookieOnJobAttribute: FilterAttribute, IActionFilter
    {
        public void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
                {
                    var id = CookieProcessing.GetUserCookie(filterContext.HttpContext);
                    var user = db.user_open_information.Where(x => x.id == id).FirstOrDefault();
                    if (user == null)
                    {
                        filterContext.Result = new RedirectResult("/RegistrationAndLogin/Index");
                    }
                }
            }
            catch
            {
                filterContext.Result = new RedirectResult("/RegistrationAndLogin/Index");
            }
            
        }



        public void OnActionExecuted(ActionExecutedContext filterContext)
        {
            // что должно происходить после вызова метода
        }
    }
}