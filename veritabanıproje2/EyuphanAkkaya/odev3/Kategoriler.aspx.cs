using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using odev3.Entity;

namespace odev3
{
    public partial class Kategoriler : System.Web.UI.Page
    {
        odev4Entities db = new odev4Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var degerler = db.tblkategori.ToList();
            Repeater1.DataSource = degerler;
            Repeater1.DataBind();
        }
    }
}