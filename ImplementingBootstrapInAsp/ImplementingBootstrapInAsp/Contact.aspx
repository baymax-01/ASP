<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ImplementingBootstrapInAsp.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <table cellpadding="4" cellspacing="4" class="w-100 table table-bordered table-hover table-responsive table-striped">
                        <tr>
                            <td colspan="2">
                                <h2 class="text-center">Contact Form</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td>
                                <asp:TextBox ID="NameTextBox1" CssClass="form-control" runat="server" Width="179px" Height="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox1" Display="Dynamic" ErrorMessage="Name is Mandatory" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>
                                <asp:DropDownList ID="GenderDropDownList1" CssClass="form-control" runat="server" Height="40px" Width="182px">
                                    <asp:ListItem>Select Gender</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="GenderDropDownList1" Display="Dynamic" ErrorMessage="GEnder Is Mandatory" ForeColor="Red" InitialValue="Select Gender" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Email </td>
                            <td>
                                <asp:TextBox ID="EMailTextBox2" CssClass="form-control" runat="server" Width="174px" Height="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="EMailTextBox2" Display="Dynamic" ErrorMessage="Email Is Mandatory" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EMailTextBox2" Display="Dynamic" ErrorMessage="Invalid Email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Subject</td>
                            <td>
                                <asp:DropDownList ID="SubjectDropDownList2" CssClass="form-control" runat="server" Height="40px" Width="185px">
                                    <asp:ListItem>Select Subject</asp:ListItem>
                                    <asp:ListItem>Feedback</asp:ListItem>
                                    <asp:ListItem>Complaint</asp:ListItem>
                                    <asp:ListItem>Suggestion</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="SubjectDropDownList2" Display="Dynamic" ErrorMessage="Subject is Mandatory" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td>
                                <asp:TextBox ID="CommentTextBox4" CssClass="form-control" runat="server" Height="142px" TextMode="MultiLine" Width="291px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="CommentTextBox4" Display="Dynamic" ErrorMessage="Comment is Mandatory" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="Button1_Click" />
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>



            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>
