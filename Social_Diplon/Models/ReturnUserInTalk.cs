using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.Models
{
    public class ReturnUserInTalk
    {
        public ReturnUserInTalk(user_open_information u)
        {
            this.id = u.id;
        }
        public int id { get; set; }
    }
}