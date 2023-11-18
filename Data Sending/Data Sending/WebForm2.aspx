<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Data_Sending.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
        }
        .auto-style2 {
            width: 52px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">ID</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="18px" Width="147px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="18px" Width="147px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Age</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Height="18px" Width="147px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Image</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
