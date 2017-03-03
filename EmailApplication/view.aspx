<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="WebApplication5.view" %>
<%@Import Namespace = "System.Data"%> 
<%@Import Namespace = "System.Data.SqlClient"%>
<%@Import Namespace = "System.Configuration"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <%
        if (Request.Cookies["colour"] != null)
        {
            string color = Request.Cookies["colour"].Value.ToString();
            Response.Write("<body bgcolor='"+color+"'>"); 
        }

         %>
    <form id="form1" runat="server">
        <h2 align="center">Email Selected </h2>
       <div  align="center">
           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Return To Inbox"  Height="26px"/>
           <asp:Button ID="Button4" runat="server" Text="Log-out" Height="26px" OnClick="Button4_Click"/>
            <br />
           <br />
           <div style="border-style: ridge; border-color: inherit; border-width: medium; height: 258px; padding: 20px; width: 435px;">
        
        <label for="TextBox1" style=" display:inline; width:128px; margin-right:12px; text-align:right;">From: </label><asp:TextBox ID="TextBox1" runat="server" Width="215px"></asp:TextBox>
               <br />
        <br />
               <div style="width: 279px; text-align:left">
        <label for="Label1" style=" display:inline; width:128px; margin-right:12px; text-align:right;">Subject: </label><asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <br />
        <asp:TextBox ID="TextBox2" disabled TextMode="MultiLine" runat="server" Height="119px" Width="396px"></asp:TextBox>
               <br />
        <br />
        <%
            string id = Request["T"].ToString();
            string From_Email = "";
            string Text = "";
            SqlConnection con;
            SqlCommand cmd;
            SqlDataReader r;
            string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='C:\\Users\\Administrator\\Documents\\Visual Studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\Email2.mdf';Integrated Security=True";

            try
            {
                con = new SqlConnection(connString);
                cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT * FROM Emails WHERE eid = " + id;
                r = cmd.ExecuteReader();
                while (r.Read())
                {
                    id = r[0].ToString();
                    From_Email = r[1].ToString().TrimEnd(' ');
                    Text = r[4].ToString().TrimEnd(' ');  
                }
                

                con = new SqlConnection(connString);
                cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "UPDATE Emails SET estatus = 'O' WHERE eid = " + id;
                r = cmd.ExecuteReader();
            } catch (Exception ex) { }
             %>

        <asp:Button ID="Button2" runat="server" Text="Reply" OnClick="Button2_Click" Height="26px" />

        <br />
               </div>
           <footer>
                <p>&copy; 2017 - Ivo & Tim Application</p>
            </footer>
    </div>
    </form>
</body>
</html>
