using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.logic
{
    public class CookieProcessing
    {
        public static bool SetUserCookie(System.Web.HttpContextBase HttpContext,int id)
        {
                       try
            {
                if (id == 0)
                    return false;
                HttpContext.Response.Cookies["id"].Value = id.ToString();
                HttpContext.Response.Cookies["id"].Expires = DateTime.Now.AddDays(365);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public static int GetUserCookie (System.Web.HttpContextBase HttpContext)
        {

            return Int32.Parse(HttpContext.Request.Cookies["id"].Value);
        }

        public static bool DropUserCookie (System.Web.HttpContextBase HttpContext)
        {
            try
            {
                HttpContext.Response.Cookies["id"].Expires = DateTime.Now.AddDays(-1);
                HttpContext.Request.Cookies["id"].Expires = DateTime.Now.AddDays(-1);

            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}