using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3.Satis
{
    public partial class Satis : System.Web.UI.Page
    {
        odev4Entities db = new odev4Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            //var satislar = db.TBLSATIS.ToList();
            var satislar = (from x in db.tblsatiss
                            select new
                            {
                                x.satisid,
                                x.tblurun.urunad,
                                x.tblpersonel.personeladsoyad,
                                MUSTERI = x.tblmusteri.musteriad+ " " + x.tblmusteri.musterisoyad,
                                x.fiyat
                            }).ToList();
            Repeater1.DataSource = satislar;
            Repeater1.DataBind();
        }
    }
}