<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="compose.aspx.cs" Inherits="WebApplication5.compose" %>

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
        <h2 align="center">Compose An Email </h2>
       <div  align="center">
           <asp:Button ID="Button1" runat="server" OnClick="Button3_Click" Text="Return To Inbox"  Height="26px"/>
           <asp:Button ID="Button4" runat="server" Text="Log-out" Height="26px" OnClick="Button4_Click"/>
            <br />
           <br />
            <div style="border-style: ridge; border-color: inherit; border-width: medium; height: 312px; padding: 20px; width: 663px;">
                <div style="float:left; width: 663px;">
                    <label for="TextBox1" style=" display:inline; width:128px; margin-right:12px; text-align:right;">To: </label><asp:TextBox ID="TextBox1" runat="server" Width="285px"></asp:TextBox>
                    <br />
                    <br />
                    <label for="TextBox3" style=" display:inline; width:128px; margin-right:10px; text-align:right;">CC: </label><asp:TextBox ID="TextBox3" runat="server" Width="285px"></asp:TextBox>
                    <br />
                    <br />
                    <label for="TextBox4" style=" display:inline; width:128px; margin-right:10px; text-align:right;">Subject: </label><asp:TextBox ID="TextBox4" runat="server" Width="260px"></asp:TextBox>
                    <br />
                    <br />
                    Body:<br />
                    <asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server" Height="119px" Width="396px"></asp:TextBox>
                    <br />
                    <br />
                    </div>
                    <asp:Button ID="Button2" runat="server" Text="Send" OnClick="Button2_Click" style="float:right"  Height="26px"/>
        </div>
           <footer>
                <p>&copy; 2017 - Ivo & Tim Application</p>
            </footer>
    </div>
    </form>
</body>
</html>
