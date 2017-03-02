<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logInScreen.aspx.cs" Inherits="EmailApplication.logInScreen" %>

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
    <div>
        <h2 align="center">Welcome Please Sign-In or Create An Account</h2>

        <div align="center">
             <div style="border-style: ridge; border-color: inherit; border-width: medium; height: 254px; padding: 20px; width: 300px;"> 
                <label for="TextBox1" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Email Address: </label><asp:TextBox ID="TextBox1" runat="server" Width="140px"></asp:TextBox>
                    <br />
                <label for="TextBox2" style=" display:inline-block; width:115px; margin-right:30px; text-align:right;">Password: </label><asp:TextBox type="password" ID="TextBox2" runat="server" Width="140px"></asp:TextBox>
                    <br />
                    <br />
                <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Remember Me :)" />
                    <br />
                    <br />

                <asp:Button ID="Button1" runat="server" Text="Log In" OnClick="Button1_Click" />
                &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Create Account" Width="136px" />
                    <br />
                    <br />
                <asp:Button ID="Button3" runat="server" Text="Forgot Password" Width="122px" OnClick="Button3_Click" />
                    <br />
                    <br />
                 <i>Please Select a Colour Theme</i><br />

                    <asp:RadioButton ID="RadioButton1" runat="server" OnCheckedChanged="RadioButton1_CheckedChanged" Text="Red" GroupName="colours" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="Blue" OnCheckedChanged="RadioButton2_CheckedChanged" GroupName="colours" />
                    <asp:RadioButton ID="RadioButton3" runat="server" Text="Green" OnCheckedChanged="RadioButton3_CheckedChanged" GroupName="colours"/>
                        <br />
                        <br />
                 <asp:Label ID="Label1" runat="server" ForeColor= "red"></asp:Label>
             </div>
            <footer>
            <p>&copy; 2017 - Ivo & Tim Email Application</p>
        </footer>
         </div>
    </div>
    </form>
</body>
</html>
