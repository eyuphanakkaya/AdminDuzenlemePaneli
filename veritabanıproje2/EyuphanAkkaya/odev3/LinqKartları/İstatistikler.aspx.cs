using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3.LinqKartları
{
    public partial class İstatistikler : System.Web.UI.Page
    {
        odev4Entities db = new odev4Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = db.tblurun.Count().ToString();
            Label2.Text = db.tblmusteri.Count().ToString();
            Label3.Text = db.tblsatiss.Sum(x => x.fiyat).ToString();
            Label4.Text = db.tblkategori.Count().ToString();
            Label5.Text = db.tblurun.Count(x => x.durum == true).ToString();
            Label6.Text = db.tblurun.Count(x => x.durum == false).ToString();
            Label7.Text = (from x in db.tblurun orderby x.urunstok descending select x.urunad).FirstOrDefault();
        }
    }
}