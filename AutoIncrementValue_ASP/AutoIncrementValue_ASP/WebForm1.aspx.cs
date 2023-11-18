using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace AutoIncrementValue_ASP
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetID();
                BindGridView();
            }
            if (IsPostBack)
            {
                //GetID();
                BindGridView();

            }
        }
        void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Employee";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
        void GetID()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select ID from Employee";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            if (data.Rows.Count < 1)
            {
                IDTextBox1.Text = "1";
            }
            else
            {
                string query1 = "select max(ID) from Employee";
                SqlCommand cmd = new SqlCommand(query1,con);
                con.Open();
                int i=(int)cmd.ExecuteScalar();
                i++;
                IDTextBox1.Text = i.ToString();
                con.Close();



            }

        }

        void ClearControl()
        {
            NameTextBox2.Text = AgeTextBox3.Text = string.Empty;
        }
        protected void InsertButton1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into employee values(@id,@name,@age)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id",IDTextBox1.Text);
            cmd.Parameters.AddWithValue("@name", NameTextBox2.Text);
            cmd.Parameters.AddWithValue("@age", AgeTextBox3.Text);
            con.Open();
            int a=cmd.ExecuteNonQuery();
            if (a>0)
            {
                Response.Write("<script>alert('Inserted Successfully') </script>");
                GetID();
                ClearControl();
                BindGridView();

            }
            else
            {
                Response.Write("<script>alert('Insertion Failed') </script>");

            }
            con.Close();


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lbl1 =(Label) row.FindControl("Label1");
            Label lbl2 =(Label) row.FindControl("Label2");
            Label lbl3 =(Label) row.FindControl("Label3");

            IDTextBox1.Text = lbl1.Text;
            NameTextBox2.Text = lbl2.Text;
            AgeTextBox3.Text = lbl3.Text;


        }

        protected void UpdateButton2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "update Employee set name=@name ,age=@age where ID=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", IDTextBox1.Text);
            cmd.Parameters.AddWithValue("@name", NameTextBox2.Text);
            cmd.Parameters.AddWithValue("@age", AgeTextBox3.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Updated Successfully') </script>");
                GetID();
                ClearControl();
                BindGridView();

            }
            else
            {
                Response.Write("<script>alert('Updation Failed') </script>");

            }
            con.Close();

        }

        protected void DeleteButton3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from Employee  where ID=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", IDTextBox1.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Deleted Successfully') </script>");
                GetID();
                ClearControl();
                BindGridView();

            }
            else
            {
                Response.Write("<script>alert('Deletion  Failed') </script>");

            }
            con.Close();
        }
    }
}