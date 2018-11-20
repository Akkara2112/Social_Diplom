using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Social_Diplon
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}",
                defaults: new { controller = "RegistrationAndLogin", action = "Index"}
            );


            routes.MapRoute(
                name: "MyProfil",
                url: "{controller}/{action}/{id}",
                defaults: new { contoller = "Profil", action = "YouselfRpofil", id = UrlParameter.Optional }
                );
            routes.MapRoute(
                name: "Myfriends",
                url: "{controller}/{action}/{id}",
                defaults: new { contoller = "FriendList", action = "FriendList", id = UrlParameter.Optional }
                );
            routes.MapRoute(
                name: "MyMessages",
                url: "{controller}/{action}/{id}",
                defaults: new { contoller = "Messages", action = "MessageList", id = UrlParameter.Optional }
                );
            routes.MapRoute(
                name: "OtherProfil",
                url: "{controller}/{action}/{id}",
                defaults: new { contoller = "Profil", action = "OtherProfil", id = UrlParameter.Optional }
                );

        
        }
    }
}
