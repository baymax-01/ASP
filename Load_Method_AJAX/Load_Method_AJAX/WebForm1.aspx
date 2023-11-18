<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Load_Method_AJAX.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="button" value="Click To Get Data " id="btn" />
            <br />
            <div id="result">
            </div>

        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(fuction () {
            $("#btn").click(fuction() {
                $("#result").load("pages\HtmlPage1.html", fuction(responsetxt, statustxt, xhr){
                    alert(responsetxt);
                    alert(statustxt);
                    alert(xhr);
                });

            });
        });
    </script>
</body>
</html>
