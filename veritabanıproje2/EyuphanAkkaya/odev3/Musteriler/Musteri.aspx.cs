using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3.Musteriler
{
    public partial class Musteri : System.Web.UI.Page
    {

        odev4Entities db = new odev4Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var degerler = db.tblmusteri.ToList();
            Repeater1.DataSource = degerler;
            Repeater1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            tblmusteri t = new tblmusteri();
            t.musteriad= TextBox1.Text;
            t.musterisoyad = TextBox2.Text;
            db.tblmusteri.Add(t);
            db.SaveChanges();
        }
    }
}