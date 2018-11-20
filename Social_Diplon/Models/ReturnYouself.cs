using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.Models
{
    public class ReturnYouself
    {
        public ReturnYouself(user_open_information u)
        {
            this.id = u.id;
            this.sex = u.sex.name_of;
            this.about_youself = (u.about_youself != null) ? u.about_youself:"";
            this.profession = u.profession.name_of;
            this.rating = u.rating;
            this.user_status = u.user_status.ToString();
            this.city = (u.city.name_of!= null) ? u.city.name_of: "Не указано";
            this.avatar_path = (u.avatar_path != null) ? u.avatar_path : "null";
            this.user_quote = (u.user_quote != null)? u.user_quote: "" ;
            this.date_of_birth = (u.date_of_birth != null) ? u.date_of_birth.Value.ToShortDateString() : "Не указано";
            this.first_name = u.first_name;
            this.last_name = u.last_name;
            this.patronymic = (u.patronymic != null) ? u.patronymic: "";
    }
        public int id { get; set; }
        public string sex{ get; set; }
        public string about_youself { get; set; }
        public string profession { get; set; }
        public int rating { get; set; }
        public string user_status { get; set; }
        public string city { get; set; }
        public string avatar_path { get; set; }
        public string user_quote { get; set; }
        public string date_of_birth { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string patronymic { get; set; }
    }
}