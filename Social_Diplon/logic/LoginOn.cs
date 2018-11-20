using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Social_Diplon.Models;


namespace Social_Diplon.logic
{
    public class LoginOn
    {
        public bool SearchUserForLogIn(string LoginField, string PasswordField)// если есть повторения то возвращаем true иначе false
        {
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                var IsUserExist = db.user_close_information.Where(p => p.user_login == LoginField).Where(c=>c.user_pasword == PasswordField).Count();
                if (IsUserExist > 0) return true;
                /*var log = db.user_close_information.AsNoTracking().ToList();
                foreach (user_close_information u in log)
                {
                    if (u.user_login == LoginField && u.user_pasword == PasswordField) return true;
                } */
            }
            return false;
        }
    }
}