using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace DropDownList
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                SqlConnection con = new SqlConnection(cs);
                string query = "select * from Employee";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);


                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();

                ListItem l1 = new ListItem("Select name", "-1");
                l1.Selected = true;
                DropDownList1.Items.Insert(0, l1);
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (DropDownList1.SelectedIndex == 0)
            {
                Response.Write("Please select name" + "</br>");
                Label1.Text = "Rows not Found";
                Label1.ForeColor = Color.Red;

            }
            else
            {

                Response.Write(DropDownList1.SelectedItem.Text + "</br>");
                Response.Write(DropDownList1.SelectedItem.Value + "</br>");




                SqlConnection con = new SqlConnection(cs);
                string query = "select * from Employee where name=@name";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                sda.SelectCommand.Parameters.AddWithValue("@name",DropDownList1.SelectedItem.Text);
                DataTable dt = new DataTable();
                sda.Fill(dt);


                GridView1.DataSource = dt;
             
                GridView1.DataBind();

                Label1.Text = "Rows Found";
                Label1.Visible = true;

            }
        }
    }
}