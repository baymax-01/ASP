using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QueryState
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/WebForm2.aspx?id="+TextBox1.Text+"&name="+TextBox2.Text+"&age="+TextBox3.Text);
            Response.Redirect("~/WebForm2.aspx?id="+Server.UrlEncode( TextBox1.Text)        +"&name="+ Server.UrlEncode(TextBox2.Text)
                +"&age="+ Server.UrlEncode(TextBox3.Text));
        }
    }
}