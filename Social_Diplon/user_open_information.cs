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
    
    public partial class user_open_information
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public user_open_information()
        {
            this.group_post_сomment = new HashSet<group_post_сomment>();
            this.message = new HashSet<message>();
            this.complete_task = new HashSet<complete_task>();
            this.contact_information = new HashSet<contact_information>();
            this.user_post = new HashSet<user_post>();
            this.user_post_сomment = new HashSet<user_post_сomment>();
            this.user_open_information1 = new HashSet<user_open_information>();
            this.user_open_information2 = new HashSet<user_open_information>();
            this.talk = new HashSet<talk>();
            this.groups = new HashSet<groups>();
        }
    
        public int id { get; set; }
        public int sex_id { get; set; }
        public string about_youself { get; set; }
        public int profession_id { get; set; }
        public int rating { get; set; }
        public int user_status_id { get; set; }
        public Nullable<int> city_id { get; set; }
        public string avatar_path { get; set; }
        public string user_quote { get; set; }
        public Nullable<System.DateTime> date_of_birth { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string patronymic { get; set; }
    
        public virtual city city { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<group_post_сomment> group_post_сomment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<message> message { get; set; }
        public virtual profession profession { get; set; }
        public virtual sex sex { get; set; }
        public virtual user_close_information user_close_information { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<complete_task> complete_task { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<contact_information> contact_information { get; set; }
        public virtual user_status user_status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<user_post> user_post { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<user_post_сomment> user_post_сomment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<user_open_information> user_open_information1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<user_open_information> user_open_information2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<talk> talk { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<groups> groups { get; set; }
    }
}