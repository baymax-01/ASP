using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginFormASP
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"]!=null)
            {
                Response.Write("Welcome =>"+ Session["user"].ToString());
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}