using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmailApplication
{
    public partial class createAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='c:\\users\\administrator\\documents\\visual studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\EmailsDB.mdf';Integrated Security=True");
            SqlCommand cmd = new SqlCommand();

            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "SELECT EmailAddress FROM Users WHERE EmailAddress ='" + TextBox1.Text + "'";
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                Label1.Text = "Email Address Already Taken";
                resetTextBox();
            }
            else
            {
                rd.Close();
                con.Close();
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = "INSERT INTO Users VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "')";
                cmd.ExecuteNonQuery();
                con.Close();

                Label1.Visible = true;
                Label1.Text = "Record Saved! Please Sign-In To Your New Account";
                resetTextBox();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("logInScreen.aspx");
        }

        public void resetTextBox()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox1.Focus();
        }
    }
}