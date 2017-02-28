<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createAccount.aspx.cs" Inherits="EmailApplication.createAccount" %>
<% @Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Please Fill The Registartion Form Below To Create An Account</h2>
        Email Address: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Name: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        Address: <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        Password: <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        Re-Enter Password: <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        Security Question:
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <br />
        Security Answer:
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <br />

        <asp:Button ID="Button1" runat="server" Text="Create Account" />

        <%
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='c:\\users\\administrator\\documents\\visual studio 2015\\Projects\\EmailApplication\\EmailApplication\\App_Data\\EmailsDB.mdf';Integrated Security=True");
            SqlCommand cmd = new SqlCommand();

            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "SELECT EmailAddress FROM Users WHERE EmailAddress ='" + TextBox1.Text + "'";
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                Label1.Text = "Email Address Already Taken";
            }
            else
            {
                rd.Close();
                con.Close();
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = "INSERT INTO Users VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Record Saved!";
            }

             %>

        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    </div>
    </form>
</body>
</html>
