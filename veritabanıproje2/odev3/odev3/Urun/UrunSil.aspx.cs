using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3.Urunler
{
    public partial class UrunSil : System.Web.UI.Page
    {

        odev3Entities3 db = new odev3Entities3();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["urunid"]);
            var urun = db.tblurun.Find(id);
            urun.durum = false;
            db.SaveChanges();
            Response.Redirect("Urunler.aspx");
        }
    }
}