<%@ Page Title="" Language="C#" MasterPageFile="~/Email.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="EmailApplication.inbox1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Inbox" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

    <style>

        .datecss{
            text-decoration:none;
            color:black;
        }

        .subjectcss{
            text-decoration:none;
            color:black;
        }

        .fromcss{
            text-decoration:none;
            color:black;
        }
        
    </style>
</head>
    
    <body>
    <div style="height: 546px" align="center">
  
        
        <asp:Button ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" Style ="float: right; margin-top: -26px; Height: 26px; width: 63px;" />
    
        <br />

        <a href="Inbox.aspx?T=1">Inbox</a>&nbsp;<a href="Inbox.aspx?T=2">Deleted</a>&nbsp; <a href="Inbox.aspx?T=3">Sent</a>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
            <Columns>
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox ID="check" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID" SortExpression="eid" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("eid") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="HyperLink1" runat="server" 
                            PostBackUrl='<%# Eval("eid", @"view.aspx?T={0}") %>' 
                            Text='<%# Bind("eid") %>' CssClass ="fromcss" >
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField HeaderText="From" SortExpression="efrom">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("efrom") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="HyperLink2" runat="server" 
                            PostBackUrl='<%# Eval("eid", @"view.aspx?T={0}") %>' 
                            Text='<%# Bind("efrom") %>' CssClass ="fromcss" >
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Subject" SortExpression="esubject">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("esubject") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="HyperLink3" runat="server" 
                            PostBackUrl='<%# Eval("eid", @"view.aspx?T={0}") %>' 
                            Text='<%# Bind("esubject") %>' CssClass ="subjectcss" >
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="edate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("edate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="HyperLink4" runat="server" 
                            PostBackUrl='<%# Eval("eid", @"view.aspx?T={0}") %>' 
                            Text='<%# Bind("edate") %>' CssClass ="datecss">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Email_Id], [From_Email], [Subject], [Date] FROM [Emails]">
        </asp:SqlDataSource>

        <br />
        <br />

    </div>

    <script>


    </script>
</body>
</html>


</asp:Content>
