using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RememberMeCheckboxAsp
{
    public partial class Default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.Cookies["username"] != null)
                {
                    username.Text = Request.Cookies["username"].Value.ToString();
                }
                if (Request.Cookies["password"] != null)
                {
                    string encryptedPassword = Request.Cookies["password"].Value.ToString();
                    byte[] b = Convert.FromBase64String(encryptedPassword);
                    string decrypePassword = ASCIIEncoding.ASCII.GetString(b);


                    //password.Text = decrypePassword;
                    password.Attributes["value"] = decrypePassword;               
                    //password.Attributes["type"] = "password";

                }
                if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
                {
                    checkbox.Checked = true;
                }
            }



        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Login_tbl where username=@user and password=@pass";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@user", username.Text);
            sda.SelectCommand.Parameters.AddWithValue("@pass", password.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (checkbox.Checked == true)
                {
                    Response.Cookies["username"].Value = username.Text;
                    byte[] b = ASCIIEncoding.ASCII.GetBytes(password.Text);
                    string encryptedPassword = Convert.ToBase64String(b);

                    Response.Cookies["password"].Value = encryptedPassword;
                    Response.Cookies["username"].Expires = DateTime.Now.AddDays(2);
                    Response.Cookies["password"].Expires = DateTime.Now.AddDays(2);



                }
                else
                {
                    Response.Cookies["username"].Expires = DateTime.Now.AddDays(-2);
                    Response.Cookies["password"].Expires = DateTime.Now.AddDays(-2);
                }
                Session["username"] = username.Text;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script> alert('Username or Password Is Incorrect');</script>");
            }


        }
    }
}