using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginFormASP
{
    public partial class register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into SignupTable values(@fname,@lname,@gender,@age,@username,@email,@password)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@fname", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@lname", TextBox2.Text.Trim());
            cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value.Trim());
            cmd.Parameters.AddWithValue("@age", TextBox3.Text.Trim());
            cmd.Parameters.AddWithValue("@username", TextBox4.Text.Trim());
            cmd.Parameters.AddWithValue("@email", TextBox5.Text.Trim());
            cmd.Parameters.AddWithValue("@password", TextBox7.Text.Trim());
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script> alert('Registration Successfull');</script>");
                con.Close();
                ClientScript.RegisterStartupScript(typeof(Page),"script","alert('Username is :"+TextBox6.Text+" and password is "+TextBox7.Text+"');",true);
                //Response.Redirect("~/Default.aspx");

            }

            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script> alert('Registration Failed');</script>");

            }
            con.Close();
        }
    }
}