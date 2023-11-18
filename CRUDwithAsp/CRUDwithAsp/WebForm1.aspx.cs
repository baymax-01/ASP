using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDwithAsp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["name"].DefaultValue =
                ((TextBox)GridView1.FooterRow.FindControl("TextBox4")).Text;
            SqlDataSource1.InsertParameters["Gender"].DefaultValue =
                ((DropDownList)GridView1.FooterRow.FindControl("FooterDDLGender")).SelectedValue;
            SqlDataSource1.InsertParameters["Class"].DefaultValue =
             ((TextBox)GridView1.FooterRow.FindControl("TextBox5")).Text;

            int a=SqlDataSource1.Insert();
            if (a>0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Inseration SuccessFull')</script>");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Inseration FAiled')</script>");

            }
        }
    }
}