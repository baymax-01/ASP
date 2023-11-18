using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CookiesInAsp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("User"); // create the cookie
            cookie["username"] = TextBox1.Text; // store our information in cookie
            Response.Cookies.Add(cookie); //store the cookie in our browsers
            cookie.Expires = DateTime.Now.AddDays(2); //Add Expirey Date to Cookie

            Response.Redirect("~/WebForm2.aspx");




        }
    }
}