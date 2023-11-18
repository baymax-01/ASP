<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="RememberMeCheckboxAsp.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .btn{
            display:flex;
            align-items:center;
            justify-content:center;
            height:100vh;

        }
        .btndetails{
height: 43px;
    background-color: #67c7c7;
    border: none;
    font-size: larger;
    border-radius: 40px;
    width: 18%;

        }
            .btndetails:hover {
    background-color: #116d6d;
    color:white;
            }
            .btndetails:active{
                transform:scale(0.95);
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btn">
            <asp:Button ID="Button1" runat="server" Text="Logout" CssClass="btndetails" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
