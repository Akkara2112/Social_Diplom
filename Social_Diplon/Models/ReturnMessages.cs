using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.Models
{
    public class ReturnMessages
    {
        public ReturnMessages (message mess)
        {
            this.id = mess.id;
            this.talkId = mess.talk_id;
            this.userId = mess.user_id;
            this.Text = mess.user_text;
            this.time = mess.sending_time.ToString("HH:mm");
        }

        public int id { get; set; }
        public string Text { get; set; }
        public int userId { get; set; }
        public int talkId { get; set; }
        public string time { get; set; }
    }
}