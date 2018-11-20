using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.Models
{
    public class ReturnPeoples
    {
        public ReturnPeoples (user_open_information u)
        {
            this.AvatarPath = (u.avatar_path != null)? u.avatar_path:"null";
            this.FirstName = u.first_name;
            this.id = u.id;
            this.LastName = u.last_name;
            this.Quote = (u.user_quote != null) ? u.user_quote : "";
        }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int id { get; set; }
        public string AvatarPath { get; set; }
        public string Quote { get; set;  }
    }
}