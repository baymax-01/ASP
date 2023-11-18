using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Data_Sending
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TextBox1.Text = Request.QueryString[0];
            //TextBox2.Text = Request.QueryString["name"];
            //TextBox3.Text = Request.QueryString["age"];
            if (Session["id"]!=null && Session["name"]!=null && Session["age"]!=null && Session["img"]!=null)
            {
                TextBox1.Text = Session["id"].ToString() ;
                TextBox2.Text = Session["name"].ToString() ;
                TextBox3.Text = Session["age"].ToString() ;
                Image1.ImageUrl = Session["img"].ToString();
            }
            else
            {
                Response.Redirect("~/WebForm1.aspx");

            }
        }
    }
}