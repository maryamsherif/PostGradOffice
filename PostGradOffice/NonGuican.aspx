<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NonGuican.aspx.cs" Inherits="PostGradOffice.NonGuican" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            font-size: xx-large;
            font-family: "Microsoft JhengHei";
            letter-spacing: 2pt;
            vertical-align: top;
            font-weight: bold;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style5 {
            color: #000000;
            font-size: large;
            background-color: #CCFFCC;
        }
        .auto-style6 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="auto-style2">
           
           Non-GUCian Student Page</div>
        <div class="auto-style3">
            <br />
            <br />
            <asp:Button ID="nonProfile" runat="server" Text="View my profile" OnClick="nonProfile_Click" style="margin-bottom: 0px" Width="264px" Height="34px" />
            <br />
            <br />
            <asp:Button ID="viewNonThesis" runat="server" Text="View my Theses" OnClick="viewNonThesis_Click" Width="266px" Height="36px" />
            <br />
            <br />
            <asp:Button ID="viewNonCourses" runat="server" Text="View my Courses" OnClick="viewCourses_Click" Width="265px" Height="34px" />
            <br />
            <br />
            <asp:TextBox ID="Atele" runat="server" Height="20px" Width="244px"></asp:TextBox>
            <br />
            <asp:Button ID="Addtele" runat="server" OnClick="nonGucian" Text="Add Telephone number" Height="34px" Width="252px" />
            <br />
            <br />
            <span class="auto-style5">Add Progress Report</span><br />
            Thesis Serial Number&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="th1" runat="server"></asp:TextBox>
            <br />
            Progress Report Date&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="prep1" runat="server"></asp:TextBox>
            <br />
            Progress Report Number<asp:TextBox ID="prno1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add Progress Report" Height="36px" Width="261px" OnClick="Button1_Click" />
            <br />
            <br />
            <span class="auto-style5">Fill Progress Report</span><br />
            Thesis Serial Number&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="th2" runat="server"></asp:TextBox>
            <br />
            Progress Report Number<asp:TextBox ID="prno2" runat="server"></asp:TextBox>
            <br />
            State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="state2" runat="server"></asp:TextBox>
            <br />
            Description&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="desc2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Fill Progress Report" Height="33px" Width="266px" OnClick="Button2_Click" />
            <br />
            <br />
            <span class="auto-style5">Add Publication</span><br />
            Title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="title3" runat="server"></asp:TextBox>
            <br />
            Publication Date<asp:TextBox ID="pubD3" runat="server"></asp:TextBox>
            <br />
            Host&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="host3" runat="server"></asp:TextBox>
            <br />
            Place&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="place3" runat="server"></asp:TextBox>
            <br />
            Accepted&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="acc3" runat="server"></asp:TextBox>
            <br />
            <span class="auto-style6">Type yes or no</span><br />
            <asp:Button ID="Button3" runat="server" Text="Add Publication" Height="34px" OnClick="Button3_Click" Width="268px" />
            <br />
            <br />
            <span class="auto-style5">Link Publication With Thesis</span><br />
            Thesis Serial Number<asp:TextBox ID="th4" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button4" runat="server" Text="Link Publication" Height="35px" Width="268px" OnClick="Button4_Click" />
            <br />

        </div>
    </form>
</body>
</html>
