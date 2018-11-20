using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.Models
{
    public class UserPosts
    {
        public UserPosts(user_post u)
        {
            this.id = u.id;
            this.description = u.description;
            this.photo_path = u.photo_path;
            this.date_of_creation = u.date_of_creation;
        }
        public int id { get; set; }
       //public int user_id { get; set; }
        public string description { get; set; }
        public string photo_path { get; set; }
        public string date_of_creation { get; set; }
    }
}