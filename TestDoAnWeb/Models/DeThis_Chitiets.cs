//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestDoAnWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DeThis_Chitiets
    {
        public int Id { get; set; }
        public int IdDeThi { get; set; }
        public int IdCauHoi { get; set; }
    
        public virtual CauHois CauHois { get; set; }
        public virtual DeThi DeThi { get; set; }
    }
}
