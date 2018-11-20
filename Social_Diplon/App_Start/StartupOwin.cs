using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(Social_Diplon.App_Start.StartupOwin))]

namespace Social_Diplon.App_Start
{
    public class StartupOwin
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
            // Дополнительные сведения о настройке приложения см. на странице https://go.microsoft.com/fwlink/?LinkID=316888
        }
    }
}
