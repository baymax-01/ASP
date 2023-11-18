<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BindingDDL.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 85px;
            
        }
        .btn{
            color:black;
            background-color:bisque;
            border:none;
            border-radius:10px;
        }
        .btn:hover {
            color:bisque;
            background-color:black;
        }
        .btn:active{
            transform:scale(0.95);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">Country</td>
                    <td>
                        <asp:DropDownList ID="CountryDropDownList1" runat="server" AutoPostBack="True" Height="32px" OnSelectedIndexChanged="CountryDropDownList1_SelectedIndexChanged" Width="164px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CountryDropDownList1" Display="Dynamic" ErrorMessage="Please Select Country" ForeColor="Red" InitialValue="Select Country" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">City</td>
                    <td>
                        <asp:DropDownList ID="CityDropDownList2" runat="server" Height="32px" Width="164px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CityDropDownList2" Display="Dynamic" ErrorMessage="Please Select City" ForeColor="Red" InitialValue="Select City" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="SubmitButton" runat="server" Height="25px" Text="Submit" Width="78px" CssClass="btn" OnClick="SubmitButton_Click" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
