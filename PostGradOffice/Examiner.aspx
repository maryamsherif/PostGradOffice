<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner.aspx.cs" Inherits="PostGradOffice.Examiner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: "Microsoft JhengHei UI";
            font-weight: bold;
            font-size: xx-large;
            letter-spacing: 2pt;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            
            <span class="auto-style1">Examiner Page</span><br />
        </div>
         <div class="auto-style2">

             To Edit my profile:
             <br />

             Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
             <br />
             Field Of Work<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             <br />
             Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
             <br />
             Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="Button1" runat="server" Text="Edit my profile" Width="288px" Height="40px" OnClick="Button1_Click" />

             <br />
             <br />
             List all theses titles, supervisors, and students names:<br />
             <asp:Button ID="Button5" runat="server" Text="List All" Height="40px" Width="289px" OnClick="Button5_Click" />

             <br />
             <br />
             To add comments for a defense:<br />
             Thesis serial Number<asp:TextBox ID="th1" runat="server"></asp:TextBox>
             <br />
             Defense Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="dd1" runat="server"></asp:TextBox>
             <br />
             Comments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="cmt1" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="Button2" runat="server" Text="Add comment for Defense" Height="38px" OnClick="Button2_Click" />

             <br />
             <br />
             To add grade for a defense:<br />
             Thesis Serial Number&nbsp; <asp:TextBox ID="th2" runat="server"></asp:TextBox>
             <br />
             Defense Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="dd2" runat="server"></asp:TextBox>
             <br />
             Grade&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="grd2" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="Button3" runat="server" Text="Add Grade For Defense" Height="38px" Width="283px" OnClick="Button3_Click" />

             <br />
             <br />
             Search thesis:<br />
             Enter Keyword:<asp:TextBox ID="key1" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="Button4" runat="server" Text="Search For Thesis" Height="31px" OnClick="Button4_Click" />

    </div>
    </form>
</body>
</html>
