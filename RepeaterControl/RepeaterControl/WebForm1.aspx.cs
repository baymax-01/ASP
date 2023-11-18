using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RepeaterControl
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = getdate();
            GridView1.DataBind();

            Repeater1.DataSource = getdate();
            Repeater1.DataBind();


        }

            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        DataTable getdate()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Employee";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }


    }


}