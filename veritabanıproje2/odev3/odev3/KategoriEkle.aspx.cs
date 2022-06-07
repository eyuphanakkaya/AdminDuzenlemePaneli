using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3
{
    public partial class KategoriEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            odev3Entities3 db = new odev3Entities3();
            tblkategori t = new tblkategori();
            t.kategoriad = TextBox1.Text;
            db.tblkategori.Add(t);
            db.SaveChanges();
        }
    }
}