using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_With_Images
{
    public partial class Default : System.Web.UI.Page
    {
        readonly string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
            if (IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("images/");
            string fileName = Path.GetFileName(FileUpload1.FileName);
            string extension = Path.GetExtension(fileName).ToLower();

            HttpPostedFile postedfile = FileUpload1.PostedFile;
            int size = postedfile.ContentLength;
            SqlConnection con = new SqlConnection(cs);

            if (FileUpload1.HasFile == true)
            {
                if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                {
                    if (size <= 1000000)
                    {
                        string query2 = "select * from employee_tbl where id=@id";
                        SqlCommand cmd2 = new SqlCommand(query2, con);
                        cmd2.Parameters.AddWithValue("@id", IDTextBox1.Text);
                        con.Open();
                        SqlDataReader dr = cmd2.ExecuteReader();
                        if (dr.HasRows == true)
                        {
                            Response.Write("<script> alert('ID Has Already Exists In Database') </script>");
                            con.Close();

                        }
                        else
                        {
                            con.Close();

                            FileUpload1.SaveAs(path + fileName);
                            string path2 = "images/" + fileName;
                            string query = "insert into Employee_tbl values (@id,@name,@age,@gender,@designation,@salary,@image)";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@id", IDTextBox1.Text);
                            cmd.Parameters.AddWithValue("@name", NameTextBox2.Text);
                            cmd.Parameters.AddWithValue("@age", AgeTextBox3.Text);
                            cmd.Parameters.AddWithValue("@gender", GenderDropDownList1.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@designation", DesignationDropDownList2.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@salary", SalaryTextBox5.Text);
                            cmd.Parameters.AddWithValue("@image", path2);

                            con.Open();
                            int a = cmd.ExecuteNonQuery();
                            if (a > 0)
                            {
                                Label1.Visible = false;
                                Response.Write("<script> alert('Form Has Been Submitted') </script>");
                                ControlReset();
                                BindGridView();

                            }
                            else
                            {
                                Response.Write("<script> alert('Form Has Not Been Submitted') </script>");

                            }
                            con.Close();

                        }


                    }
                    else
                    {
                        Label1.Text = "Length Should Be Less Than 1MB";
                        Label1.Visible = true;
                        Label1.ForeColor = Color.Red;
                    }
                }
                else
                {
                    Label1.Text = "Format Not Supported";
                    Label1.Visible = true;
                    Label1.ForeColor = Color.Red;
                }
            }
            else
            {
                Label1.Text = "Please Upload an Image";
                Label1.Visible = true;
                Label1.ForeColor = Color.Red;
            }
        }
        void ControlReset()
        {
            IDTextBox1.Text = NameTextBox2.Text = AgeTextBox3.Text = SalaryTextBox5.Text = "";
            GenderDropDownList1.ClearSelection();
            DesignationDropDownList2.ClearSelection();
            Label1.Visible = false;
            GetImage.Visible = false;
            GridView1.SelectedIndex = -1;
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            ControlReset();

        }
        void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from employee_tbl";

            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lblid = (Label)row.FindControl("LabelID");
            Label lblname = (Label)row.FindControl("LabelName");
            Label lblage = (Label)row.FindControl("LabelAge");
            Label lblgender = (Label)row.FindControl("LabelGender");
            Label lbldesignation = (Label)row.FindControl("LabelDesignation");
            Label lblsalary = (Label)row.FindControl("LabelSalary");
            System.Web.UI.WebControls.Image image = (System.Web.UI.WebControls.Image)row.FindControl("Image1");

            IDTextBox1.Text = lblid.Text;
            NameTextBox2.Text = lblname.Text;
            AgeTextBox3.Text = lblage.Text;
            GenderDropDownList1.Text = lblgender.Text;
            DesignationDropDownList2.Text = lbldesignation.Text;
            SalaryTextBox5.Text = lblsalary.Text;
            GetImage.ImageUrl = image.ImageUrl;
            GetImage.Visible = true;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string path = Server.MapPath("images/");
            string fileName = Path.GetFileName(FileUpload1.FileName);
            string extension = Path.GetExtension(fileName).ToLower();

            HttpPostedFile postedfile = FileUpload1.PostedFile;
            int size = postedfile.ContentLength;
            String UpdatePath = "images/";
            if (FileUpload1.HasFile == true)
            {

                if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                {

                    if (size <= 1000000)
                    {
                        UpdatePath = UpdatePath + fileName;
                        FileUpload1.SaveAs(Server.MapPath(UpdatePath));
                        string query = "update employee_tbl set name=@name,age=@age,gender=@gender,designation=@designation,salary=@salary,Image_path=@image where id=@id";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@name", NameTextBox2.Text);
                        cmd.Parameters.AddWithValue("@age", AgeTextBox3.Text);
                        cmd.Parameters.AddWithValue("@gender", GenderDropDownList1.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@designation", DesignationDropDownList2.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@salary", SalaryTextBox5.Text);
                        cmd.Parameters.AddWithValue("@image", UpdatePath);

                        cmd.Parameters.AddWithValue("@id", IDTextBox1.Text);
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Label1.Visible = false;
                            Response.Write("<script> alert('Form Has Been Updated') </script>");
                            ControlReset();
                            BindGridView();
                            GetImage.Visible = false;
                            string deletePath = Server.MapPath(GetImage.ImageUrl.ToString());
                            if (File.Exists(deletePath) == true)
                            {
                                File.Delete(deletePath);
                            }
                        }
                        else
                        {
                            Response.Write("<script> alert('Form Has Not  Updated') </script>");

                        }
                        con.Close();


                    }
                    else
                    {
                        Label1.Text = "Length Should Be Less Than 1MB";
                        Label1.Visible = true;
                        Label1.ForeColor = Color.Red;
                    }
                }
                else
                {
                    Label1.Text = "Format Not Supported";
                    Label1.Visible = true;
                    Label1.ForeColor = Color.Red;
                }
            }
            else
            {
                UpdatePath = GetImage.ImageUrl.ToString();
                string query = "update employee_tbl set name=@name,age=@age,gender=@gender,designation=@designation,salary=@salary,Image_path=@image where id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", NameTextBox2.Text);
                cmd.Parameters.AddWithValue("@age", AgeTextBox3.Text);
                cmd.Parameters.AddWithValue("@gender", GenderDropDownList1.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@designation", DesignationDropDownList2.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@salary", SalaryTextBox5.Text);
                cmd.Parameters.AddWithValue("@image", UpdatePath);
                cmd.Parameters.AddWithValue("@id", IDTextBox1.Text);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                   
                    Label1.Visible = false;
                    Response.Write("<script> alert('Form Has Been Updated') </script>");
                    ControlReset();
                    BindGridView();
                    GetImage.Visible = false;

                }
                else
                {
                    Response.Write("<script> alert('Form Has Not  Updated') </script>");

                }
                con.Close();

            }

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from employee_tbl where id=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", IDTextBox1.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Label1.Visible = false;
                Response.Write("<script> alert('Data IS Deleted') </script>");
                ControlReset();
                BindGridView();
                GetImage.Visible = false;
                string deletePath = Server.MapPath(GetImage.ImageUrl.ToString());
                if (File.Exists(deletePath) == true)
                {
                    File.Delete(deletePath);
                }
            }
            else
            {
                Response.Write("<script> alert('Data IS Not Deleted') </script>");

            }
            con.Close();
        }
    }
}