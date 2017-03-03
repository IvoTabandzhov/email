using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Globalization;

namespace EmailApplication
{
	public partial class inbox1 : System.Web.UI.Page
	{
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader r;
        string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='C:\\Users\\Administrator\\Documents\\Visual Studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\Email2.mdf';Integrated Security=True";
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                showData();
                loadData();
                setFont();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                //Searching CheckBox("chkDel") in an individual row of Grid  
                CheckBox chkdel = (CheckBox)row.FindControl("check");
                //If CheckBox is checked than delete the record with particular empid  
                if (row.RowType == DataControlRowType.DataRow)
                {
                    if (chkdel.Checked)
                    {

                        int id = Convert.ToInt32(((LinkButton)row.Cells[1].FindControl("HyperLink1")).Text);
                        DeleteRecord(id);
                    }
                }
            }
            //Displaying the Data in GridView  
            showData();
        }

        protected void loadData()
        {

            String page = "1";

            try
            {
                if (Request["T"] != null)
                {
                    page = Request["T"];
                }

                if (page == "1")
                {
                    con = new SqlConnection(connString);
                    cmd = new SqlCommand();
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = "SELECT * FROM Emails WHERE eto = '" + Session["user"].ToString() + "'";
                    r = cmd.ExecuteReader();
                    dt = new DataTable();
                    dt.Load(r);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else if (page == "2")
                {
                    con = new SqlConnection(connString);
                    cmd = new SqlCommand();
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = "SELECT * FROM Emails WHERE edeleted = 'true' AND eto = '" + Session["user"].ToString() + "'";
                    r = cmd.ExecuteReader();
                    dt = new DataTable();
                    dt.Load(r);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else if (page == "3")
                {
                    con = new SqlConnection(connString);
                    cmd = new SqlCommand();
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = "SELECT * FROM Emails WHERE efrom = '" + Session["user"].ToString() + "'";
                    r = cmd.ExecuteReader();
                    dt = new DataTable();
                    dt.Load(r);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex) { Response.Write(ex.ToString()); }
        }

        protected void DeleteRecord(int id)
        {
            try
            {
                con = new SqlConnection(connString);
                cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = ("UPDATE Emails SET eDeleted = 'True' WHERE eid='" + id + "'");
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex) { Response.Write(ex.ToString()); }
        }

        protected void showData()
        {
            con = new SqlConnection(connString);
            cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * FROM Emails";
            r = cmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(r);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void setFont()
        {
            try
            {
                string Status = " ";
                foreach (GridViewRow row in GridView1.Rows)
                {
                    con = new SqlConnection(connString);
                    cmd = new SqlCommand();
                    con.Open();
                    cmd.Connection = con;
                    int id = Convert.ToInt32(((LinkButton)row.Cells[1].FindControl("HyperLink1")).Text);
                    cmd.CommandText = "SELECT estatus FROM Emails WHERE eid = '" + id + "'";

                    Status = cmd.ExecuteScalar().ToString();

                    if (Status == "N")
                    {
                        row.Style.Add(HtmlTextWriterStyle.FontWeight, "Bold");
                    }
                }
            }
            catch (Exception ex) { }
        }

    }
}