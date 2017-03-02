using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmailApplication
{
    public partial class logInScreen : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='c:\\users\\administrator\\documents\\visual studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\EmailsDB.mdf';Integrated Security=True");
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["EmailAddress"] != null)
                {
                    TextBox1.Text = Request.Cookies["EmailAddress"].Value;
                }

                if (Request.Cookies["Password"] != null)
                {
                    TextBox2.Attributes.Add("value", Request.Cookies["password"].Value);
                }

                if (Request.Cookies["EmailAddress"] != null && Request.Cookies["Password"] != null)
                {
                    CheckBox1.Checked = true; 
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "SELECT * FROM Users WHERE EmailAddress = '" + TextBox1.Text + "' AND Password = '" + TextBox2.Text + "'";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {

                if (CheckBox1.Checked == true)
                {
                    Response.Cookies["EmailAddress"].Value = TextBox1.Text;
                    Response.Cookies["Password"].Value = TextBox2.Text;

                    Response.Cookies["EmailAddress"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(15);  
                }
                else
                {
                    Response.Cookies["EmailAddress"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("inbox.aspx");
            }
            else
            {
                if (TextBox1.Text == "" && TextBox2.Text == "")
                {
                    this.Label1.Text = "Please Enter Your Email Address & Password";
                }
                else{
                    this.Label1.Text = "Invalid user info";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("createAccount.aspx");
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Response.Cookies["colour"].Value = "#cea9a9";
            Response.Cookies["colour"].Expires = DateTime.MaxValue;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgotPassword.aspx");
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Response.Cookies["colour"].Value = "#a9ccce";
            Response.Cookies["colour"].Expires = DateTime.MaxValue;
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            Response.Cookies["colour"].Value = "#a9ceac";
            Response.Cookies["colour"].Expires = DateTime.MaxValue;
        }
    }
}