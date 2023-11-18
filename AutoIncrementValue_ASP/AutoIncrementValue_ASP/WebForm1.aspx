<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AutoIncrementValue_ASP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
        }
        .auto-style2 {
            width: 70px;
        }
        .auto-style3 {
            width: 70px;
            height: 40px;
        }
        .auto-style4 {
            height: 40px;
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
                        <asp:TextBox ID="IDTextBox1" runat="server" ReadOnly="True" Width="166px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name</td>
                    <td>
                        <asp:TextBox ID="NameTextBox2" runat="server" Width="166px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Age</td>
                    <td>
                        <asp:TextBox ID="AgeTextBox3" runat="server" Width="166px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style4">
                        <asp:Button ID="InsertButton1" runat="server" Height="28px" OnClick="InsertButton1_Click" Text="Insert" Width="65px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="UpdateButton2" runat="server" Height="28px" Text="Update" Width="65px" OnClick="UpdateButton2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="DeleteButton3" runat="server" Height="28px" Text="Delete" Width="65px" OnClick="DeleteButton3_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                     <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Age">
                                     <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
