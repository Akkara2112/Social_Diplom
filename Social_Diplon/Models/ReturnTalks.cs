using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.Models
{
    public class ReturnTalks
    {
        public ReturnTalks(talk talk)
        {
            this.id = talk.id;
            this.TalkName = talk.name_of;
            this.LastMessage = (talk.message.OrderByDescending(x => x.sending_time).FirstOrDefault().user_text != null)? talk.message.OrderByDescending(x => x.sending_time).FirstOrDefault().user_text.ToString():"null";

        }

        public int id { get; set; }
        public string TalkName { get; set; }
        public string LastMessage { get; set; }

    }
}