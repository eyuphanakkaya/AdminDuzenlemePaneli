//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace odev3.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblurun
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblurun()
        {
            this.tblsatiss = new HashSet<tblsatiss>();
        }
    
        public int urunid { get; set; }
        public string urunad { get; set; }
        public string urunmarka { get; set; }
        public Nullable<int> urunkategori { get; set; }
        public Nullable<decimal> urunfiyat { get; set; }
        public Nullable<short> urunstok { get; set; }
        public Nullable<bool> durum { get; set; }
    
        public virtual tblkategori tblkategori { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblsatiss> tblsatiss { get; set; }
    }
}
