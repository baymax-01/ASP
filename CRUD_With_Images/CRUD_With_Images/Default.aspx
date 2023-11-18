<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD_With_Images.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .table {
            width: 70%;
            margin: auto;
            border: 1px red groove;
        }

        .center {
            text-align: center;
        }

        .auto-style1 {
            width: 1px;
        }
        .flex{
            display:flex;
            justify-content:space-evenly;
            /*gap:20px;*/
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4" class="table">
                <tr>
                    <td colspan="2">
                        <h1 class="center">Employee CRUD APPLICATION</h1>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#CCCCCC" Font-Size="Larger" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">ID</td>
                    <td>
                        <asp:TextBox ID="IDTextBox1" runat="server" Width="180px" Height="25px" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="IDTextBox1" Display="Dynamic" ErrorMessage="ID is Mandatory" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Name</td>
                    <td>
                        <asp:TextBox ID="NameTextBox2" runat="server" Width="179px" Height="25px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NameTextBox2" Display="Dynamic" ErrorMessage="Name is Mandatory" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Age</td>
                    <td>
                        <asp:TextBox ID="AgeTextBox3" runat="server" Width="179px" Height="25px" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AgeTextBox3" Display="Dynamic" ErrorMessage="Age is Mandatory" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Gender</td>
                    <td>
                        <asp:DropDownList ID="GenderDropDownList1" runat="server" Width="179px" Height="25px">
                            <asp:ListItem>Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="GenderDropDownList1" Display="Dynamic" ErrorMessage="Please Select Gender" ForeColor="Red" InitialValue="Select Gender" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Designation</td>
                    <td>
                        <asp:DropDownList ID="DesignationDropDownList2" runat="server" Width="179px" Height="25px">
                            <asp:ListItem>Select Designation</asp:ListItem>
                            <asp:ListItem>Manager</asp:ListItem>
                            <asp:ListItem>Assistent Manager</asp:ListItem>
                            <asp:ListItem>Incharge</asp:ListItem>
                            <asp:ListItem>Operator</asp:ListItem>
                            <asp:ListItem>Director</asp:ListItem>
                            <asp:ListItem>PA</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DesignationDropDownList2" Display="Dynamic" ErrorMessage="Please Select Designation" ForeColor="Red" InitialValue="Select Designation" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Salary</td>
                    <td>
                        <asp:TextBox ID="SalaryTextBox5" runat="server" Width="179px" Height="25px" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="SalaryTextBox5" Display="Dynamic" ErrorMessage="Please Enter Salary" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Image</td>
                    <td>
                        <asp:Image ID="GetImage" Height="70" Width="70" runat="server" Visible="False" />
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="179px" />
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                        <div class="flex">
                        <asp:Button ID="btninsert" runat="server" Text="Insert" Width="57px" Height="30px" BackColor="#99FF66" OnClick="btninsert_Click" />
                        &nbsp;<asp:Button ID="btnupdate" runat="server" Text="Update" Width="63px" Height="30px" BackColor="#FFFF99" OnClick="btnupdate_Click" />
                        &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete" Width="61px" Height="30px" BackColor="#FF5050" OnClick="btndelete_Click" />
                        &nbsp;<asp:Button ID="btnreset" runat="server" Text="Reset" Width="53px" Height="30px" BackColor="#3399FF" OnClick="btnreset_Click" />
                            </div>
                    </td>
                </tr>
            </table>
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="LabelID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                          <ItemTemplate>
                            <asp:Label ID="LabelName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age">
                          <ItemTemplate>
                            <asp:Label ID="LabelAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                          <ItemTemplate>
                            <asp:Label ID="LabelGender" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Designation">
                         <ItemTemplate>
                            <asp:Label ID="LabelDesignation" runat="server" Text='<%# Eval("designation") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Salary">
                         <ItemTemplate>
                            <asp:Label ID="LabelSalary" runat="server" Text='<%# Eval("salary") %>'></asp:Label>
                        </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="100" Width="100" ImageUrl='<%# Eval("Image_path") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="Select Row" ShowSelectButton="True" />
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
        </div>
    </form>
</body>
</html>
