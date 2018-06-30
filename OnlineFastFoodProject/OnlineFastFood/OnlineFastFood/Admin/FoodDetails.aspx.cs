using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace OnlineFastFood.Admin
{
    public partial class FoodDetails : System.Web.UI.Page
    {
        string filetitle1, filetitle2;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DropDown1();
                FillGridView();
            }
        }
        protected void DropDown1()
        {
            string strcon;
            strcon = ConfigurationManager.ConnectionStrings["OffCon"].ConnectionString;
            OleDbConnection con = new OleDbConnection(strcon);
            con.Open();
            OleDbDataAdapter da = new OleDbDataAdapter("Select * from FoodDetails", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "t1");
            ddfoodcategory.DataSource = ds.Tables["t1"];
            ddfoodcategory.DataTextField = "fdname";
            ddfoodcategory.DataValueField = "catid";
            ddfoodcategory.DataBind();
            con.Close();
        }



        protected void FillGridView()
        {
            //reading connection string from web.config file
            string strcon = ConfigurationManager.ConnectionStrings["OffCon"].ConnectionString;
            OleDbConnection con = new OleDbConnection(strcon);
            OleDbDataAdapter da = new OleDbDataAdapter("select * from FoodDetails", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "t1");
            GridView1.DataSource = ds.Tables["t1"];
            GridView1.DataBind();
            ViewState["v1"] = ds;

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            UploadFileFunction1();
            UploadFileFunction2();
            string strcon;
            strcon = ConfigurationManager.ConnectionStrings["OffCon"].ConnectionString;
            OleDbConnection Con = new OleDbConnection(strcon);
            Con.Open();

            OleDbCommand cmd = new OleDbCommand("insert into FoodDetails(catid,fdname,Fddetails,wasprice,nowprice,image1,image2)values(@catid,@fdname,@Fddetails,@wasprice,@nowprice,@image1,@image2)", Con);

            cmd.Parameters.AddWithValue("@catid", ddfoodcategory.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@fdname", txtfoodname.Text);
            cmd.Parameters.AddWithValue("@Fddetails", txtfooddetails.Text);
            cmd.Parameters.AddWithValue("@wasprice", txtwasprice.Text);
            cmd.Parameters.AddWithValue("@nowprice", txtnowprice.Text);
            cmd.Parameters.AddWithValue("@image1", "~/Styles/" + filetitle1);
            cmd.Parameters.AddWithValue("@image2", "~/Styles/" + filetitle2);
            cmd.ExecuteNonQuery();
            Con.Close();
            lblmsg.ForeColor = Color.White;
            lblmsg.BackColor = Color.Blue;
            lblmsg.Text = "FoodDetails added successfully";
            FillGridView();

        }
        protected void UploadFileFunction1()
        {
            string filename = FileUpload1.PostedFile.FileName;
            string fileExtension = System.IO.Path.GetExtension(filename);
            string fileMimeType = FileUpload1.PostedFile.ContentType;
            int fileSizeInkb = FileUpload1.PostedFile.ContentLength / 1024;
            filetitle1 = FileUpload1.FileName;


            string[] MatchExtension = { ".jpg", ".jpeg", ".png", ".gif" };
            string[] MatchMimeType = { "image/jpeg", "image/gif", "image/png" };


            if (FileUpload1.HasFile)
            {
                if (MatchExtension.Contains(fileExtension) || MatchMimeType.Contains(fileMimeType))
                {
                    if (fileSizeInkb <= 1024)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Styles/" + filetitle1));
                    }
                    else
                    {
                        Response.Write("File size greater than 1 MB");
                    }
                }
                else
                {
                    Response.Write("Please  Upload an .jpg, .jpeg, .gif or .png image");
                }
            }
            else
            {
                Response.Write("Please upload an image ");
            }
        }
        protected void UploadFileFunction2()
        {
            string filename = FileUpload2.PostedFile.FileName;
            string fileExtension = System.IO.Path.GetExtension(filename);
            string fileMimeType = FileUpload1.PostedFile.ContentType;
            int fileSizeInkb = FileUpload2.PostedFile.ContentLength / 1024;
            filetitle2 = FileUpload2.FileName;


            string[] MatchExtension = { ".jpg", ".jpeg", ".png", ".gif" };
            string[] MatchMimeType = { "image/jpeg", "image/gif", "image/png" };


            if (FileUpload2.HasFile)
            {
                if (MatchExtension.Contains(fileExtension) || MatchMimeType.Contains(fileMimeType))
                {
                    if (fileSizeInkb <= 1024)
                    {
                        FileUpload2.SaveAs(Server.MapPath("~/Styles/" + filetitle2));
                    }
                    else
                    {
                        Response.Write("File size greater than 1 MB");
                    }
                }
                else
                {
                    Response.Write("Please  Upload an .jpg, .jpeg, .gif or .png image");
                }
            }
            else
            {
                Response.Write("Please upload an image ");
            }
        }
    }
}