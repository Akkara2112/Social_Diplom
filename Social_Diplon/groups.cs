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
    
    public partial class groups
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public groups()
        {
            this.group_post = new HashSet<group_post>();
            this.user_open_information = new HashSet<user_open_information>();
        }
    
        public int id { get; set; }
        public string name_of { get; set; }
        public string about_group { get; set; }
        public int group_status_id { get; set; }
        public string date_of_creation { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<group_post> group_post { get; set; }
        public virtual group_status group_status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<user_open_information> user_open_information { get; set; }
    }
}
