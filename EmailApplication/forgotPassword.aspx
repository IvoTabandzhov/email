<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="EmailApplication.forgotPassword" %>

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
        <h3 align="center">Forgot Your Password? </h3>
    <div align="center">
        <div style="border-style: ridge; border-color: inherit; border-width: medium; height: 111px; padding: 20px; width: 406px;">
            <p align="center" style="width: 355px">Enter you Email Address to retrive your password.</p>

            <asp:TextBox ID="TextBox1" runat="server" Width="279px"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Submit" Width="84px" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor= "red"></asp:Label>
        </div>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Sign-In" style="align:center" OnClick="Button2_Click"/>
    </div>
        <div align = "center">
            <footer>
                <p>&copy; 2017 - Ivo & Tim Email Application</p>
            </footer>
        </div>
    </form>
</body>
</html>
