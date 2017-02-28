<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logInScreen.aspx.cs" Inherits="EmailApplication.logInScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Welcome Please Sign-In or Create An Account</h2>

        E-mail Address: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Password: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />

        <asp:Button ID="Button1" runat="server" Text="Log In" OnClick="Button1_Click" />
        &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Create Account" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
