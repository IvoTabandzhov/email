using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication5
{
    public partial class compose : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader r;
        string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='C:\\Users\\Administrator\\Documents\\Visual Studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\Email2.mdf';Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["From_Email"].ToString() == " ")
                {

                }
                else
                {
                    TextBox1.Text = Session["From_Email"].ToString();
                    TextBox4.Text = Session["Subject"].ToString();
                }
            }
            catch (Exception ex) { }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime date = new DateTime();
                date = DateTime.Now;
                con = new SqlConnection(connString);
                cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO Emails VALUES('" + Session["user"].ToString() + "','" + TextBox1.Text + "','" + TextBox4.Text + "','" + TextBox2.Text + "', DEFAULT, DEFAULT, DEFAULT)";
                cmd.ExecuteNonQuery();

                if (TextBox3.Text != "")
                {
                    con = new SqlConnection(connString);
                    cmd = new SqlCommand();
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = "INSERT INTO Emails VALUES('" + Session["user"].ToString() + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox2.Text + "', DEFAULT, DEFAULT, DEFAULT)";
                    cmd.ExecuteNonQuery();
                }
                Session["From_Email"] = " ";
                Session["Subject"] = " ";
                Response.Redirect("Inbox.aspx");

            }
            catch (Exception ex) { TextBox2.Text = ex.ToString(); }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["From_Email"] = " ";
            Session["Subject"] = " ";
            Response.Redirect("Inbox.aspx?T=1");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("logInScreen.aspx");
        }
    }
}