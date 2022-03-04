<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PostGradOffice.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 1242px; text-align: left">
            <asp:Label ID="sregister" runat="server" Text="Student Register" style="font-weight: 700; font-size: x-large; background-color: #CCFFFF;"></asp:Label>
            <br />
            <br />
            <asp:Label ID="fname" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="fnamet" runat="server" OnTextChanged="fnamet_TextChanged"></asp:TextBox>
            <br />
            <asp:Label ID="lname" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="lnamet" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="passw" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="passwt" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="fac" runat="server" Text="Faculty"></asp:Label>
            <asp:TextBox ID="fact" runat="server"></asp:TextBox>
            <br />
            GUCian<asp:TextBox ID="guct" runat="server"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">&nbsp;Please type 1 if you&#39;re GUCian</span><br class="auto-style1" />
            <span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or type 0 if you&#39;re not</span><br />
            <asp:Label ID="email" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="emailt" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="address" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="addresst" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="regist" runat="server" Text="Register" OnClick="regist_Click" style="font-size: large" Width="323px" Height="38px" />
            <br />
            <br />
        </div>
        <div style="width: 1244px">
            <asp:Label ID="Label1" runat="server" Text="Supervisor Register" style="font-size: x-large; font-weight: 700; background-color: #CCFFFF;"></asp:Label>
            <br />
            <br />
            <asp:Label ID="fnames" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="fnamest" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lnames" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="lnamest" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="pws" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="pwst" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="fs" runat="server" Text="Faculty"></asp:Label>
            <asp:TextBox ID="fst" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="emails" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="emailst" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="supregister" runat="server" Text="Supervisor Register" style="font-size: large" OnClick="supregister_Click" Height="39px" Width="323px" />
            <br />
        </div>
          <div style="width: 1249px">
            <asp:Label ID="Exam" runat="server" Text="Examiner Register" style="font-size: x-large; font-weight: 700; background-color: #CCFFFF;"></asp:Label>
            <br />
            <br />
              Name<asp:TextBox ID="fexam" runat="server"></asp:TextBox>
            <br />
              Field of work
            <asp:TextBox ID="fieldexam" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="passexam" runat="server"></asp:TextBox>
            <br />
              Are you Egyptian? <asp:TextBox ID="facexam" runat="server"></asp:TextBox>
              <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">&nbsp;Please type 1 if you&#39;re Egyptian</span><br class="auto-style1" />
              <span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or type 0 if you&#39;re not</span><br />
            <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="emailexam" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="examreg" runat="server" Text="Examiner Register" style="font-size: large" OnClick="examiner_reg" Height="37px" Width="323px" />
              <br />
        </div>
    </form>
</body>
</html>
