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
    
    public partial class DeThi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DeThi()
        {
            this.CauHois = new HashSet<CauHois>();
            this.DeThis_Chitiets = new HashSet<DeThis_Chitiets>();
        }
    
        public int MaDeThi { get; set; }
        public string TenMonThi { get; set; }
        public System.DateTime NgayThi { get; set; }
        public Nullable<int> SoCauHoi { get; set; }
        public Nullable<int> MaKhoaHoc { get; set; }
        public System.DateTime ThoiHanDeThi { get; set; }
        public int ThoiGianLamBai { get; set; }
        public Nullable<int> MaCauHoi { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CauHois> CauHois { get; set; }
        public virtual KhoaHoc KhoaHoc { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeThis_Chitiets> DeThis_Chitiets { get; set; }
        public virtual CauHois CauHois1 { get; set; }
    }
}
