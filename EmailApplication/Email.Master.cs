using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmailApplication
{
    public partial class Email : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["user"] = " ";
            Response.Redirect("logInScreen.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("compose.aspx");
        }
    }
}