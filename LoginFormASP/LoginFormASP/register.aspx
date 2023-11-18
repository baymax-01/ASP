<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="LoginFormASP.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 171px;
        }
        .auto-style3 {
            width: 171px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td><h1>Sign Up Form</h1></td>
                </tr>
                <tr>
                    <td class="auto-style2">First Name</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="161px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Enter First Name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="159px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Enter Last Name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Gender</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="18px" Width="111px">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="Select" ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Select Gender" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Email</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="159px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Enter Email" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Email Is Invalid" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Address</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox4" runat="server" Width="159px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Enter Addesss" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Username</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Width="159px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Enter Username" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" Width="159px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Enter Password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Password Must Be Strong" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+*!=]).*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Confirm Password</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" Width="159px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Enter Confirm Password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Password Is not Identical" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Sign up" Height="35px" Width="70px" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
