<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LoginFormASP.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 194px;
        }
    </style>
    <script type="text/javascript">
        function showPassword(checkbox) {
            var passwordtextbox = document.getElementById('TextBox2')
            if (checkbox.checked == true) {
                passwordtextbox.setAttribute('type', 'text');
            } else {
                passwordtextbox.setAttribute('type', 'Password');

            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">Username</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="144px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="PLease Enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="16px" TextMode="Password" Width="144px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="PLease Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <%--<td><input type="checkbox" name="ShowPassword" value="ShowPassword" onchange="document.getElementById(TextBox2).type = this.checked ? 'text':'password'" />ShowPassword</td>--%>
                    <td>
                        <input type="checkbox" onclick="showPassword(this)" />ShowPassword</td>

                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Height="33px" OnClick="Button1_Click" Text="Login" Width="70px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <a href="register.aspx"> Not Register | Click Here</a></td>
                </tr>
            </table>
        </div>
    </form>
    <p>
        &nbsp;
    </p>
</body>
</html>
