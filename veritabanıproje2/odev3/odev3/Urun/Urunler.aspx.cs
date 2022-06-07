using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3.Urunler
{
    public partial class Urunler : System.Web.UI.Page
    {
        odev3Entities3 db = new odev3Entities3();
        protected void Page_Load(object sender, EventArgs e)
        {
            //var urunler = db.tblurun.Where(x=>x.durum==true).ToList();
            var urunler = (from x in db.tblurun
                           where x.durum==true
                           select new
                           {
                               x.urunid,
                               x.urunad,
                               x.urunmarka,
                               x.tblkategori.kategoriad,
                               x.urunfiyat,
                               x.urunstok
                           }).ToList();
            Repeater1.DataSource = urunler;
            Repeater1.DataBind();

        }
    }
}