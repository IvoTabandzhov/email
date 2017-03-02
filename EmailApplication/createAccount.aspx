<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createAccount.aspx.cs" Inherits="EmailApplication.createAccount" %>
<% @Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
     <%
        if (Request.Cookies["colour"] != null)
        {
            string color = Request.Cookies["colour"].Value.ToString();
            Response.Write("<body bgcolor='"+color+"'>'"); 
        }

         %>
    <form id="form1" runat="server">
    <div align="center">
        <h2>Please Fill The Registartion Form Below To Create An Account</h2>
        <div style="border-style: ridge; border-color: inherit; border-width: medium; width: 357px; height: 350px;">
                <br />
                <label for="TextBox1" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Email Address: </label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                <br />
                <label for="TextBox2" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Name: </label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                <br />
                <label for="TextBox3" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Address: </label><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <br />
                <br />
                <label for="TextBox4" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Password: </label><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <br />
                <br />
                <label for="TextBox5" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Re-Enter Password: </label><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <br />
                <br />
                <label for="TextBox6" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Security Question: </label><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    <br />
                <br />
                <label for="TextBox7" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Security Answer: </label><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <br />
                    <br />
            </div>

        <br />

        <asp:Button ID="Button1" runat="server" Text="Create Account" OnClick="Button1_Click" />

        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Sign In" />

        <br />

        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    </div>
        <div align = "center">
            <footer>
                <p>&copy; 2017 - Ivo & Tim Application</p>
            </footer>
        </div>
    </form>
</body>
</html>
