using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3.Urun
{
   
    public partial class UrunGuncelle : System.Web.UI.Page
    {
        odev4Entities db = new odev4Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                var kate = (from x in db.tblkategori select new { x.kategoriid, x.kategoriad }).ToList();
                DropDownList1.DataTextField = "kategoriad";
                DropDownList1.DataValueField = "kategoriid";
                DropDownList1.DataSource = kate;
                DropDownList1.DataBind();

                int id = Convert.ToInt32(Request.QueryString["urunid"]);   
                var p = db.tblurun.Find(id);
                Txtad.Text = p.urunad;
                Txtstok.Text = p.urunstok.ToString();
                Txtmarka.Text = p.urunmarka;
                Txtfiyat.Text = p.urunfiyat.ToString();
                DropDownList1.SelectedValue = p.urunkategori.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["urunid"]);
            var p = db.tblurun.Find(id);
            p.urunad = Txtad.Text;
            p.urunstok = short.Parse(Txtstok.Text);
            p.urunmarka = Txtmarka.Text;
            p.urunfiyat=decimal.Parse(Txtfiyat.Text);
            p.urunkategori =byte.Parse(DropDownList1.SelectedValue.ToString());
            db.SaveChanges();
            Response.Redirect("Urunler.Aspx");
        }
    }
}