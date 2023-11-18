using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace InsertAndRetrevingImages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();

            }
            if (IsPostBack)
            {
                FillGrid();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string path = Server.MapPath("images/");
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(filename).ToLower();
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                int lenght = postedFile.ContentLength; // bytes me ayae ga size

                if (extension == ".jpg" || extension == ".png" || extension == ".jpeg")
                {
                    if (lenght <= 1000000)
                    {
                        FileUpload1.SaveAs(path + filename);
                        string name = "images/" + filename;
                        string query = "insert into images values(@img)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@img", name);
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Label1.Text = "Inserted Successfully";
                            Label1.ForeColor = Color.Green;
                            Label1.Visible = true;
                            FillGrid();
                        }
                        else
                        {
                            Label1.Text = "Inserted Failed";
                            Label1.ForeColor = Color.Red;
                            Label1.Visible = true;
                        }
                        con.Close();


                    }
                    else
                    {
                        Label1.Text = "Image File Should not be Greater tha 1MB";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                    }


                }
                else
                {
                    Label1.Text = "Image Format is Not Supported";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                }

            }
            else
            {
                Label1.Text = "Please Upload an Image";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;

            }
        }
        void FillGrid()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select *  from images";
            SqlDataAdapter cmd = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}
