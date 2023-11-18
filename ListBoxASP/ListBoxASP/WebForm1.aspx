<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ListBoxASP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
                <%--<asp:ListItem Value="1">Pakistan</asp:ListItem>
                <asp:ListItem Value="2">India</asp:ListItem>
                <asp:ListItem Value="3">China</asp:ListItem>
                <asp:ListItem Value="4">Srilanka</asp:ListItem>
                <asp:ListItem Value="5">Canada</asp:ListItem>
                <asp:ListItem Value="6">Afghanistan</asp:ListItem>--%>
            </asp:ListBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        </div>
    </form>
</body>
</html>
