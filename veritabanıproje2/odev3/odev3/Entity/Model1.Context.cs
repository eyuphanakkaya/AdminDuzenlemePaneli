﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class odev3Entities3 : DbContext
    {
        public odev3Entities3()
            : base("name=odev3Entities3")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblkategori> tblkategori { get; set; }
        public virtual DbSet<tblmusteri> tblmusteri { get; set; }
        public virtual DbSet<tblpersonel> tblpersonel { get; set; }
        public virtual DbSet<tblsatiss> tblsatiss { get; set; }
        public virtual DbSet<tblurun> tblurun { get; set; }
        public virtual DbSet<TBLADMIN> TBLADMIN { get; set; }
    }
}
