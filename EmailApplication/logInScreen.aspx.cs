using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmailApplication
{
    public partial class logInScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='c:\\users\\administrator\\documents\\visual studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\EmailsDB.mdf';Integrated Security=True");
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "SELECT * FROM Users WHERE EmailAddress = '" + TextBox1.Text + "' AND Password = '" + TextBox2.Text + "'";
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                Session["email_Id"] = rd["EmailAddress"].ToString();
                Response.Redirect("inbox.aspx");
            }
            else
            {
                this.Label1.Text = "Invalid user info";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("createAccount.aspx");
        }
    }
}