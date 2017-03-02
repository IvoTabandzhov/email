using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmailApplication
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='c:\\users\\administrator\\documents\\visual studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\EmailsDB.mdf';Integrated Security=True");
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = "SELECT * FROM Users WHERE EmailAddress = '" + TextBox1.Text.TrimEnd(' ') + "'";
                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.Read())
                {
                    string id = rd["EmailAddress"].ToString();
                    Response.Redirect("securityQuestion.aspx?emailAddress='" + id + "'");
                }

                else {
                    Label1.Visible = true;
                    this.Label1.Text = "Invalid Email Address";
                }
            }
            catch (Exception ex){
                Response.Write(ex);
            } 
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("logInScreen.aspx");
        }
    }
}