using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Social_Diplon.Models;

namespace Social_Diplon.logic
{
    public class Regictration
    {
        public void Regis(string LoginField, string PasswordInField, string LastNameField, string FirstNameField, string FathertNameField, int testSomeSelector, DateTime testSomeDate, int optionsRadios, string testSomeText1, string testSomeText2)
        {
            try
            {
                var id = -1;
                using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
                {
                    user_close_information user = new user_close_information
                    {
                        user_login = LoginField,
                        user_pasword = PasswordInField
                    };

                    db.user_close_information.Add(user);
                    id = user.id;

                    if (id == -1) return;

                    user_open_information user1 = new user_open_information
                    {
                        id = id,
                        last_name = LastNameField,
                        first_name = FirstNameField,
                        patronymic = FathertNameField,
                        city_id = testSomeSelector,
                        date_of_birth = testSomeDate.Date,
                        sex_id = optionsRadios,
                        user_quote = testSomeText1,
                        about_youself = testSomeText2,
                        avatar_path = "",
                        rating = 0,
                        profession_id = 1,
                        user_status_id = 1
                    };

                    db.user_open_information.Add(user1);
                    db.SaveChanges();

                }
            }
            catch (Exception ex) { var s = ex.Message; }

        }

        public bool Repeating(string LoginField)// если есть повторения то возвращаем false иначе true
        {
            using (db_a3cf84_akkara2Entities db = new db_a3cf84_akkara2Entities())
            {
                var log = db.user_close_information.AsNoTracking().ToList();
                foreach (user_close_information u in log)
                {
                    if (u.user_login == LoginField)
                    {
                        return false;
                    }
                }
            }
            return true;
        }
    }
}