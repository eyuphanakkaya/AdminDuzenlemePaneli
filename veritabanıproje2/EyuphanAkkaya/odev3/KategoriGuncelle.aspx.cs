using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3
{
    public partial class KategoriGuncelle : System.Web.UI.Page
    {
        odev4Entities db = new odev4Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack==false)
            {
                int id = Convert.ToInt32(Request.QueryString["kategoriid"]);
                Txtid.Text = id.ToString();
                var ktgr = db.tblkategori.Find(id);
                Txtad.Text = ktgr.kategoriad;
            }
           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            int id = Convert.ToInt32(Request.QueryString["kategoriid"]);
            var ktgr = db.tblkategori.Find(id);
            ktgr.kategoriad = Txtad.Text;
            db.SaveChanges();
            Response.Redirect("Kategoriler.Aspx");
        }
    }
}