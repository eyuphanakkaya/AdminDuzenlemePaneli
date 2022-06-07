using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;


namespace odev3
{
    public partial class Login : System.Web.UI.Page
    {
        odev3Entities3 db = new odev3Entities3();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            var sorgu = from x in db.TBLADMIN where x.KULLANICI == TxtKullaniciAd.Text && x.SIFRE == TxtSifre.Text select x;
            if (sorgu.Any())
            {
                Response.Redirect("Kategoriler.Aspx");
            }
            else
            {
                Response.Write("Hatalı Bilgi Girişi");
            }
        }
    }
}