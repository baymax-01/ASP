using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ListBoxASP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable data = getdata();
                ListBox1.DataSource = data;
              
                ListBox1.DataTextField = "Name";
                ListBox1.DataValueField = "ID";
                ListBox1.DataBind();
                ListItem l1 = new ListItem("Select Country", "-1");
                ListBox1.Items.Insert(0, l1);
                l1.Selected = true;
                ListBox1.SelectedValue = "-1";
            }
        }
        DataTable getdata()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from employee";
            SqlDataAdapter sda = new SqlDataAdapter(query,con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedIndex == -1)
            {
                Response.Write("Please Select any Country " + "</br>");

            }
            else
            {
                foreach (ListItem item in ListBox1.Items)
                {
                    if (item.Selected)
                    {
                        Response.Write("Selected Item Text " + item.Text + "</br>");
                        Response.Write("Selected Item Value " + item.Value + "</br>");
                        Response.Write("Selected Item Index " + ListBox1.Items.IndexOf(item) + "</br>");

                    }
                }
            }
        }
    }
}