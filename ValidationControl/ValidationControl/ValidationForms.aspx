<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidationForms.aspx.cs" Inherits="ValidationControl.ValidationForms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 82%;
            height: 129px;
        }
        .auto-style2 {
            width: 199px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            width: 199px;
            height: 30px;
        }
        .auto-style5 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>
                Student Registration Forms
&nbsp;</h2>
                <table class="auto-style1">
                    <tr>
                        <td colspan="2">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#999999" Font-Size="Large" ForeColor="#CC3300" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Student Name</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="203px" CssClass="auto-style3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Fill Student name" ForeColor="#CC3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Student Email</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Width="203px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Please Fill Student Email" ForeColor="#CC3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Email Is Invalid" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Confirm Email</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="TextBox3" runat="server" Width="203px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Re Enter Email" ForeColor="#CC3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Email is Not Identical" ForeColor="Red" SetFocusOnError="True">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Class</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="TextBox4" runat="server" Width="203px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Class Should be From 1 to 12" ForeColor="#CC3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Please Enter Class From 1 to 12" ForeColor="Red" MaximumValue="12" MinimumValue="1" SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Gender</td>
                        <td class="auto-style5">
                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="gender" Text="Male" />
                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="gender" Text="Female" />
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="Select Gender" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Height="35px" OnClick="Button1_Click" Text="Submit" Width="79px" />
                        </td>
                    </tr>
                </table>
        
        </div>
    </form>
</body>
</html>
