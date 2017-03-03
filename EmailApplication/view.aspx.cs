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
    public partial class view : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader r;
        string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='C:\\Users\\Administrator\\Documents\\Visual Studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\Email2.mdf';Integrated Security=True";
        string Text = " ";
        string From_Email = " ";
        string Subject = " ";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string id = Request["T"];

                con = new SqlConnection(connString);
                cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT * FROM Emails WHERE eid =" + id;

                r = cmd.ExecuteReader();
                while (r.Read())
                {
                    From_Email = r[1].ToString().TrimEnd(' ');
                    Subject = r[3].ToString().TrimEnd(' ');
                    Text = r[4].ToString().TrimEnd(' ');
                }
                TextBox1.Text = From_Email;
                Label1.Text = Subject;
                TextBox2.Text = Text;
            }
            catch (Exception ex) { TextBox2.Text = ex.ToString(); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inbox.aspx?T=1");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Subject"] = Subject;
            Session["From_Email"] = From_Email;
            Response.Redirect("compose.aspx?");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("logInScreen.aspx");
        }
    }
}