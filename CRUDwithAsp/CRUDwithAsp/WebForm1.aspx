﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CRUDwithAsp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton OnClick="LinkButton1_Click" ValidationGroup="Insert" ID="LinkButton1" runat="server">Insert</asp:LinkButton>

                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="name" SortExpression="name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" ControlToValidate="TextBox1" ForeColor="Red" Text="*" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidator2" ControlToValidate="TextBox4" ForeColor="Red" Text="*" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>

                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" Text='<%# Bind("Gender") %>'>
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator  InitialValue="Select Gender" ID="RequiredFieldValidator3" ControlToValidate="DropDownList1" ForeColor="Red" Text="*" SetFocusOnError="true" runat="server" ErrorMessage="Please Select Gender"></asp:RequiredFieldValidator>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="FooterDDLGender" runat="server">
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ValidationGroup="Insert" InitialValue="Select Gender" ID="RequiredFieldValidator4" ControlToValidate="FooterDDLGender" ForeColor="Red" Text="*" SetFocusOnError="true" runat="server" ErrorMessage="Please Select Gender"></asp:RequiredFieldValidator>

                        </FooterTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class" SortExpression="Class">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Class") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBox3" ForeColor="Red" Text="*" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter Class"></asp:RequiredFieldValidator>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Class") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidator5" ControlToValidate="TextBox5" ForeColor="Red" Text="*" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter Class"></asp:RequiredFieldValidator>

                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Insert" BackColor="#999999" Font-Size="Larger" ForeColor="#FF3300" />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server"  BackColor="#999999" Font-Size="Larger" ForeColor="#FF3300" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Student] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Student] ([name], [Gender], [Class]) VALUES (@name, @Gender, @Class)" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE [Student] SET [name] = @name, [Gender] = @Gender, [Class] = @Class WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Class" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Class" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>