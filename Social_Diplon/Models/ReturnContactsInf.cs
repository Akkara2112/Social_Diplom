using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Social_Diplon.Models
{
    public class ReturnContactsInf
    {
        public ReturnContactsInf(contact_type contact)
        {
            this.id = contact.id;
            this.nameOf = contact.name_of;
        }

        public int id { get; set; }
        public string nameOf { get; set; }
    }
}