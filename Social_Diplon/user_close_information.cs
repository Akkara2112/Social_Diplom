//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Social_Diplon
{
    using System;
    using System.Collections.Generic;
    
    public partial class user_close_information
    {
        public int id { get; set; }
        public string user_login { get; set; }
        public string user_pasword { get; set; }
    
        public virtual user_open_information user_open_information { get; set; }
    }
}
