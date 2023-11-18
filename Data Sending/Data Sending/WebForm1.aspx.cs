using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Data_Sending
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGridView();

            }
        }
        void bindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from employee";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            Label id =(Label) row.FindControl("Label1");
            Label name =(Label) row.FindControl("Label2");
            Label age =(Label) row.FindControl("Label3");
            Image image =(Image) row.FindControl("Image1");

            //Response.Redirect("~/WebForm2.aspx?id="+Server.UrlEncode( id.Text)+"&name="
            //    + Server.UrlEncode(name.Text)+"&age="+ Server.UrlEncode(age.Text)+"&img="+ Server.UrlEncode();

            Session["id"] = id.Text.ToString();
            Session["name"] = name.Text.ToString();
            Session["age"] = age.Text.ToString();
            Session["img"] = image.ImageUrl.ToString();
            Response.Redirect("~/WebForm2.aspx");

        }
    }
}