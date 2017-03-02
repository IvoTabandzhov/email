<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="securityQuestion.aspx.cs" Inherits="EmailApplication.securityQuestion" %>

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
        <h3 align="center">Identity Confirmation</h3>
    <div align="center">
        <div style="border-style: ridge; border-color: inherit; border-width: medium; height: 151px; padding: 20px; width: 406px;&gt;
            &lt;"> 
            <p>Answer the following question to retrive your password.</p>
            <asp:Label ID="Label2" runat="server" Text="Label" ForeColor= "Black" style = "font-weight: bold"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="279px"></asp:TextBox>
        
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
       
            <br />
      
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor= "red"></asp:Label>
         </div>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Sign-In" style="align:center" OnClick="Button2_Click"/>
    </div>
        <div align = "center">
            <footer>
                <p>&copy; 2017 - Ivo & Tim Application</p>
            </footer>
        </div>
    </form>
</body>
</html>
