<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="InsertAndRetrevingImages.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 139px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">Image Upload</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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

                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ID") %>'></asp:Label> 

                                                </td>
                                                /<td> <asp:Image Height="150" Width="150" ImageUrl='<%# Eval("Image_Name") %>' ID="Image1" runat="server" /> </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>







                        </asp:GridView>
                    </td>
                </tr>
            </table>
           
        </div>
    </form>
</body>
</html>
