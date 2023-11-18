using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImplementingBootstrapInAsp
{
    public partial class Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into Contact_tbl values(@name,@gender,@email,@subject,@comment)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@name", NameTextBox1.Text);
            cmd.Parameters.AddWithValue("@gender", GenderDropDownList1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@email", EMailTextBox2.Text);
            cmd.Parameters.AddWithValue("@subject", SubjectDropDownList2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@comment", CommentTextBox4.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                //Response.Write("<script>alert('Form Has Been Submitted') </script>");
                Label1.Text = "Form Has Been Submitted";
                Label1.Visible = true;
                Label1.ForeColor = Color.Green;
                SubjectDropDownList2.ClearSelection();
                GenderDropDownList1.ClearSelection();
                NameTextBox1.Text = CommentTextBox4.Text = EMailTextBox2.Text = "";
            }
            else
            {
                Label1.Text = "Form Has Not Been Submitted";
                Label1.Visible = true;
                Label1.ForeColor = Color.Green;
                //Response.Write("<script>alert('Form Has Not Been Submitted') </script>");
            }

            con.Close();
        }






    }
}
