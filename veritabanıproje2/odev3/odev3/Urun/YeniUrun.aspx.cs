using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3.Urun
{
    public partial class YeniUrun : System.Web.UI.Page
    {

        odev3Entities3 db = new odev3Entities3();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                var kate = (from x in db.tblkategori select new { x.kategoriid, x.kategoriad }).ToList();
                DropDownList1.DataTextField = "kategoriad";
                DropDownList1.DataValueField = "kategoriid";
                DropDownList1.DataSource = kate;
                DropDownList1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            tblurun t = new tblurun();
            t.urunad= TxtUrunAd.Text;
            t.urunstok = short.Parse(TxtStok.Text);
            t.urunmarka = TxtMarka.Text;
            t.urunfiyat = decimal.Parse(TxtFiyat.Text);
            t.urunkategori = byte.Parse(DropDownList1.SelectedValue.ToString());
            TxtFiyat.Text = DropDownList1.SelectedValue;
            db.tblurun.Add(t);
            db.SaveChanges();
            Response.Redirect("Urunler.Aspx");
        }
    }
}