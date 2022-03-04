<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PostGradOffice.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: x-large;
        }
        .auto-style5 {
            text-align: center;
            font-size: xx-large;
            font-family: "Microsoft JhengHei Light";
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style5">

            <strong style="text-align: center">Post Graduate Office<br />
            </strong>

        </div>
        <div class="auto-style1">
            <strong><span class="auto-style2">
            <br />
            Please Log In</span></strong><br />
            <br />
            Email<br />
            <asp:TextBox ID="username" runat="server" ></asp:TextBox>
            <br />
            <br />
            Password<br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="signin" runat="server" OnClick="login" Text="Log in" Height="26px" Width="135px" />
           
        </div>
    </form>
</body>
</html>
