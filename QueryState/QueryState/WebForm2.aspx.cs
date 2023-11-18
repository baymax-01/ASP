using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QueryState
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = Request.QueryString[0];
            TextBox2.Text = Request.QueryString[1];
            TextBox3.Text = Request.QueryString[2];
        }
    }
}