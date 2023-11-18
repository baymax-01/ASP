using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BindingDDL
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountryDDL();
            }
        }

        void BindCountryDDL()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from country_tbl";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            CountryDropDownList1.DataSource = dt;
            CountryDropDownList1.DataTextField = "country_name";
            CountryDropDownList1.DataValueField = "country_id";
            CountryDropDownList1.DataBind();
            ListItem li = new ListItem("Select Country", "Select Country", true);
            CountryDropDownList1.Items.Insert(0, li);
        }
        void BindCityDDL(int country_id)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from city_tbl where country_id=@id";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@id", country_id);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            CityDropDownList2.DataSource = dt;
            CityDropDownList2.DataTextField = "city_name";
            CityDropDownList2.DataValueField = "city_id";
            CityDropDownList2.DataBind();

            ListItem li = new ListItem("Select City", "Select City", true);
            CityDropDownList2.Items.Insert(0, li);
        }

        protected void CountryDropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                int countryID = Convert.ToInt32(CountryDropDownList1.SelectedValue);
                BindCityDDL(countryID);
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Country Is Required')</script>");
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Response.Write("Selected Country is " + CountryDropDownList1.SelectedItem.ToString() +"<br>") ;
            Response.Write("Selected Country ID is " + CountryDropDownList1.SelectedValue.ToString() + "<br>") ;
            Response.Write("Selected City is "+CityDropDownList2.SelectedItem.ToString() + "<br>");
            Response.Write("Selected City ID is "+CityDropDownList2.SelectedValue.ToString() + "<br>");

        }
    }
}