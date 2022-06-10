using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3
{
    public partial class KategoriSil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            odev4Entities db = new odev4Entities();
            int x = Convert.ToInt32(Request.QueryString["kategoriid"]);
            var p = db.tblkategori.Find(x);
            db.tblkategori.Remove(p);
            db.SaveChanges();
            Response.Redirect("Kategoriler.aspx");
        }
    }
}