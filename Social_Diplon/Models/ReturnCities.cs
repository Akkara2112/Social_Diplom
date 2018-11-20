using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.Models
{
    public class ReturnCities
    {
        public ReturnCities(city cities)
        {
            this.id = cities.id;
            this.nameOf = cities.name_of;
        }
        public int id { get; set; }
        public string nameOf { get; set; }
    }
}