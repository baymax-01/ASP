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
    public partial class Default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from SignupTable where username=@user and password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@user", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@pass", TextBox2.Text.Trim());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                dr.Read();
                var dbusername = dr[6].ToString();
                var dbPassword = dr[7].ToString();
                dr.Close();
                if (dbusername == TextBox1.Text && dbPassword == TextBox2.Text)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script> alert('Login Successfull');</script>");
                    Session["user"] = TextBox1.Text;
                    con.Close();
                    Response.Redirect("~/Dashboard.aspx");

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script> alert('Login Faild');</script>");

                }
            }
            con.Close();

        }
    }
}