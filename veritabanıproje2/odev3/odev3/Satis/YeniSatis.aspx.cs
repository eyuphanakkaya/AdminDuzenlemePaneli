using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3.Satis
{
    public partial class YeniSatis : System.Web.UI.Page
    {

        odev3Entities3 db = new odev3Entities3();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                var urun = (from x in db.tblurun select new { x.urunid, x.urunad }).ToList();
                DropDownList1.DataTextField = "URUNAD";
                DropDownList1.DataValueField = "URUNID";
                DropDownList1.DataSource = urun;
                DropDownList1.DataBind();

                var mus = (from x in db.tblmusteri
                           select new
                           {
                               x.musteriid,
                               ADSOYAD = x.musteriad + " " + x.musterisoyad
                           }).ToList();
                DropDownList2.DataTextField = "ADSOYAD";
                DropDownList2.DataValueField = "musteriid";
                DropDownList2.DataSource = mus;
                DropDownList2.DataBind();

                var per = (from x in db.tblpersonel select new { x.personelid, x.personeladsoyad }).ToList();
                DropDownList3.DataTextField = "personeladsoyad";
                DropDownList3.DataValueField = "personelid";
                DropDownList3.DataSource = per;
                DropDownList3.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            tblsatiss t = new tblsatiss();
            t.musteri= int.Parse(DropDownList2.SelectedValue);
            t.urun= int.Parse(DropDownList1.SelectedValue);
            t.personel = byte.Parse(DropDownList3.SelectedValue);
            t.fiyat = decimal.Parse(TxtFiyat.Text);
            db.tblsatiss.Add(t);
            db.SaveChanges();
            Response.Redirect("Satislar.Aspx");
        }
    }
}