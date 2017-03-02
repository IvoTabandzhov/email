using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmailApplication
{
    public partial class securityQuestion : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='c:\\users\\administrator\\documents\\visual studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\EmailsDB.mdf';Integrated Security=True");
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            labelDisable();

            try
            {
                con.Open();
                cmd.Connection = con;

                string emailID = (Request["emailAddress"]);
                cmd.CommandText = "SELECT * FROM Users WHERE EmailAddress =" + emailID;
                SqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    Label2.Text = rd[4].ToString();
                }
                con.Close();
            }
            catch (Exception ex){
                Response.Write(ex);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "SELECT * FROM Users WHERE Security_Answer = '" + TextBox1.Text + "' AND EmailAddress =" 
                + Request["emailAddress"].TrimEnd(' ');
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                Label3.Visible = true;
                Label3.ForeColor = System.Drawing.Color.Black;
                Label3.Text = "Your Password Is: ' ";

                Label4.Visible = true;
                Label4.ForeColor = System.Drawing.Color.Green;
                Label4.Text = rd[3].ToString();

                Label5.Visible = true;
                Label3.ForeColor = System.Drawing.Color.Black;
                Label5.Text = " '";
            }
            else
            {
                Label3.Visible = true;
                Label3.ForeColor = System.Drawing.Color.Red;
                this.Label3.Text = "Wrong Answer! Try Again";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("logInScreen.aspx");
        }

        public void labelDisable()
        {
            Label1.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
        }
    }
}