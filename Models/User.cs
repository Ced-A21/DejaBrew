//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DejaBrew.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public User()
        {
            this.Customers = new HashSet<Customer>();
        }
    
        public string UserName { get; set; }
        public string UserEmail { get; set; }
        public string UserPw { get; set; }
        public string UserRole { get; set; }
    
        public virtual ICollection<Customer> Customers { get; set; }
    }
}
