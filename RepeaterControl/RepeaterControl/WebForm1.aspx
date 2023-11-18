<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RepeaterControl.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 298px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:GridView AutoGenerateColumns="false" ID="GridView1" runat="server" GridLines="None" ShowHeader="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                           <table border="1" >
                                    <tr>
                                        <td> ID</td>
                                        <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label> </td>
                                    </tr>
                                     <tr>
                                        <td>Employee Name </td>
                                        <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("Employee Name") %>'></asp:Label> </td>
                                    </tr>
                                      <tr>
                                        <td> Designation </td>
                                        <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("Designation ") %>'></asp:Label> </td>
                                    </tr>
                                      <tr>
                                        <td> City </td>
                                        <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("City ") %>'></asp:Label> </td>
                                    </tr>
                                </table>
                                        <br /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </td>
                    <td>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <table border="1" >
                                    <tr>
                                        <td> ID</td>
                                        <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label> </td>
                                    </tr>
                                     <tr>
                                        <td>Employee Name </td>
                                        <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("Employee Name") %>'></asp:Label> </td>
                                    </tr>
                                      <tr>
                                        <td> Designation </td>
                                        <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("Designation ") %>'></asp:Label> </td>
                                    </tr>
                                      <tr>
                                        <td> City </td>
                                        <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("City ") %>'></asp:Label> </td>
                                    </tr>
                                </table>


                            </ItemTemplate>
                            <SeparatorTemplate>
                                <br />
                            </SeparatorTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
