<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gucian.aspx.cs" Inherits="PostGradOffice.Gucian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #TextArea1 {
            height: 115px;
            width: 612px;
        }
        .auto-style1 {
            text-align: center;
            font-family: "Microsoft JhengHei UI";
            font-size: xx-large;
            letter-spacing: 2pt;
            font-weight: bold;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            color: #FF0000;
        }
        .auto-style4 {
            color: #000000;
            font-size: large;
            background-color: #CCFFFF;
        }
        .auto-style5 {
            color: #000000;
            font-size: large;
            background-color: #CCFFCC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="auto-style1">
           
           GUCian Student Page</div>
        <div class="auto-style2">
            <br />
            <asp:Button ID="P" runat="server"  OnClick="gucianp" Text="View my Profile" Height="40px" Width="238px" />
            <br />
            <br />
            <asp:Button ID="viewthesis" runat="server" Text="View my Theses" OnClick="viewthesis_Click" Height="43px" Width="239px" />
            <br />
            <br />
            <asp:TextBox ID="Atele" runat="server" Width="231px"></asp:TextBox>
            <br />
            <asp:Button ID="Addtele" runat="server" OnClick="gucian" Text="Add telephone number" style="margin-top: 1px" Height="40px" Width="236px" />
            <br />
            <br />
            <span class="auto-style4">Add Progress Report</span><br />
            Thesis Serial Number&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="th1" runat="server"></asp:TextBox>
            <br />
            Progress Report Date&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="prep1" runat="server"></asp:TextBox>
            <br />
            Progress Report Number<asp:TextBox ID="prno1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add Progress Report" Height="36px" OnClick="Button1_Click" Width="261px" />
            <br />
            <br />
            <span class="auto-style4">Fill Progress Report</span><br />
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
            <span class="auto-style3">Type yes or no</span><br />
            <asp:Button ID="Button3" runat="server" Text="Add Publication" Height="34px" Width="268px" OnClick="Button3_Click" />
            <br />
            <br />
            <span class="auto-style5">Link Publication With Thesis</span><br />
            Thesis Serial Number<asp:TextBox ID="th4" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button4" runat="server" Text="Link Publication" Height="35px" Width="277px" OnClick="Button4_Click" />
            <br />

        </div>
    <div>
        </div>
    </form>
    </body>
</html>
