﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CookiesInAsp
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user"];
            if (cookie!=null)
            {
                Response.Write("Welcome " + cookie["username"].ToString()) ;
            }
            else
            {
                Response.Redirect("~/WebForm1.aspx");
            }
        }
    }
}