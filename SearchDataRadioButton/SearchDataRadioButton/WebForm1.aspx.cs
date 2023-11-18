using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SearchDataRadioButton
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();

            }
        }
        void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from employee";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        void SearchDataByMale()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from employee where gender=@male";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@male", MaleRadioButton1.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        void SearchDataByFemale()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from employee where gender=@female";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@female", FemaleRadioButton2.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (MaleRadioButton1.Checked == true)
            {
                SearchDataByMale();
            }
            else if (FemaleRadioButton2.Checked == true)
            {
                SearchDataByFemale();
            }
            else if (BothRadioButton3.Checked == true)
            {
                BindGridView();
            }
            else
            {
                Response.Write("<script>alert('Please Select Any Gender')</script>");
            }
        }

        protected void MaleRadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            SearchDataByMale();
        }

        protected void FemaleRadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            SearchDataByFemale();

        }

        protected void BothRadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            BindGridView();

        }
    }
}