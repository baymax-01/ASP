<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RememberMeCheckboxAsp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons'><link rel="stylesheet" href="./style.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
<%--            // Form--%>
<div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    <div class="form-header">
      <h1>Account Login</h1>
    </div>
    <div class="form-content">
      <form>
        <div class="form-group">
          <label for="username">Username</label>
            <asp:TextBox ID="username" runat="server" ></asp:TextBox>
          <%--<input type="text" id="username" name="username" required="required"/>--%>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <%--<input type="password" id="password" name="password" required="required"/>--%>
            <asp:TextBox ID="password" runat="server" TextMode="Password" ></asp:TextBox>
        </div>
        <div class="form-group">
          <label class="form-remember">
            <%--<input type="checkbox"/>Remember Me--%>
              <asp:CheckBox ID="checkbox" runat="server" Text=" Remember Me" />
          </label>
            <a class="form-recovery" href="#">Forgot Password?</a>
        </div>
        <div class="form-group">
          <%--<button type="submit">Log In</button>--%>
            <asp:Button ID="btnLogin"  runat="server" Text="Log In"  CssClass="button" OnClick="btnLogin_Click" />
        </div>
      </form>
    </div>
  </div>
  <div class="form-panel two">
    <div class="form-header">
      <h1>Register Account</h1>
    </div>
    <div class="form-content">
      <form>
        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" id="username" name="username" required="required"/>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="password" name="password" required="required"/>
        </div>
        <div class="form-group">
          <label for="cpassword">Confirm Password</label>
          <%--<input type="password" id="cpassword" name="cpassword" required="required"/>--%>
            <asp:TextBox ID="cpassword" runat="server" ></asp:TextBox>
        </div>
        <div class="form-group">
          <label for="email">Email Address</label>

          <%--<input type="email" id="email" name="email" required="required"/>--%>
            <asp:TextBox ID="email" runat="server" ></asp:TextBox>

        </div>
        <div class="form-group">
          <%--<button type="submit">Register</button>--%>
            <asp:Button ID="btnRegister"  runat="server" Text="Register"  CssClass="button" />
        </div>
      </form>
    </div>
  </div>
</div>
        </div>
    </form>
    <%--<script src="JavaScript.js"></script>--%>
      <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='https://codepen.io/andytran/pen/vLmRVp.js'></script>
    <script type="text/javascript">
        $(document).ready(function() {
  var panelOne = $('.form-panel.two').height(),
    panelTwo = $('.form-panel.two')[0].scrollHeight;
  $('.form-panel.two').not('.form-panel.two.active').on('click', function(e) {
    e.preventDefault();

    $('.form-toggle').addClass('visible');
    $('.form-panel.one').addClass('hidden');
    $('.form-panel.two').addClass('active');
    $('.form').animate({
      'height': panelTwo
    }, 200);
  });
  $('.form-toggle').on('click', function(e) {
    e.preventDefault();
    $(this).removeClass('visible');
    $('.form-panel.one').removeClass('hidden');
    $('.form-panel.two').removeClass('active');
    $('.form').animate({
      'height': panelOne
    }, 200);
  });
});
    </script>
</body>
</html>
