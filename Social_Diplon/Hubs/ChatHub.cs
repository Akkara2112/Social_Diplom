using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.SignalR;
using Social_Diplon.Models;
using Social_Diplon.Controllers;
using System.Threading.Tasks;

namespace Social_Diplon.Hubs
{
    public class ChatHub : Hub
    {
        private static Dictionary<string, ConnectedUser> ConnectedUsers = new Dictionary<string, ConnectedUser>();

        public void Send(int cdata, string message/* string id,string[] users = null*/)
        {
            var id = GetId();
            if (id == null)
                return;

            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                var c = db.talk.Where(x => x.user_open_information.Where(z => z.id == cdata).Count() != 0 && x.user_open_information.Where(s => s.id == id).Count() != 0).ToList().FirstOrDefault();
                message mess = new message()
                {
                    talk_id = c.id,
                    user_id = id.Value,
                    user_text = message,
                    message_status_id = 1,
                    sending_time = DateTime.Now

                };
            }

            var user = ConnectedUsers.Where(x => x.Value.IdsChats.Contains(cdata) && x.Value.Id != id.Value);
            if (user.Count() != 0)
                Clients.User(user.First().Key).SendMessage(message);
            //я сделяль добавление сообщенек в бд :3
        }

        public bool Connect()
        {
            var id = GetId();

            if (id == null)
                return false;

            var isExist = ConnectedUsers.Where(x => x.Value.Id == id);
            if (isExist.Count() != 0)
                return true;
            try
            {
                using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
                {
                    var tempList = db.talk.AsNoTracking().Where(x => x.user_open_information.Where(z => z.id == id).Count() != 0).ToList().Select(x => x.id).ToList();
                    ConnectedUsers.Add(Context.ConnectionId, new ConnectedUser()
                    {
                        Id = id.Value,
                        IdsChats = tempList
                    });
                }
            }
            catch (Exception ex)
            {
                var s = ex.Message;
                return false;
            }


            return true;
        }

        public override Task OnConnected()
        {
            return base.OnConnected();
        }

        private int? GetId()
        {
            try
            {
                System.Web.HttpContextBase httpContext = Context.Request.GetHttpContext();
                return logic.CookieProcessing.GetUserCookie(httpContext);
            }
            catch (Exception ex)
            {
                var s = ex.Message;
                return null;
            }
        }
    }

    public class ConnectedUser
    {
        public int Id { get; set; }
        public List<int> IdsChats { get; set; }
    }
}