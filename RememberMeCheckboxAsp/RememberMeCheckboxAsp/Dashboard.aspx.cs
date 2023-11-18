using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RememberMeCheckboxAsp
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Write("Welcome " + Session["username"].ToString());
            }
            else
            {
                Response.Redirect("~/Default.aspx");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                //Session["username"] = null;
                Session.Abandon();
                Response.Redirect("~/Default.aspx");
            }
           
        }
    }
}