<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="PostGradOffice.Admin" %>

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
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            font-size: large;
            background-color: #CCFFCC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <span class="auto-style1">Admin Page</span><br />
        </div>
         <div class="auto-style3">

             <br />

             <asp:Button ID="Button1" runat="server" Text="View all Supervisors" Width="222px" Height="37px" OnClick="Button1_Click" />
             <br />
             <br />
             <asp:Button ID="Button2" runat="server" Text="View all Theses" Width="222px" Height="31px" OnClick="Button2_Click" />
             <br />
             <br />
             <asp:Button ID="Button3" runat="server" Text="View On Going Theses Count" Width="228px" Height="34px" OnClick="Button3_Click" />
             <br />
             <br />
             <br />
             <span class="auto-style4">Issue a thesis payment</span><br />
             Thesis serial Number&nbsp;
             <asp:TextBox ID="th1" runat="server"></asp:TextBox>
             <br />
             Amount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="amnt1" runat="server"></asp:TextBox>
             <br />
             Number of installment <asp:TextBox ID="noinst1" runat="server"></asp:TextBox>
             <br />
             Fund Percentage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="fund1" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="Button4" runat="server" Text="Issue Thesis Payment" Height="34px" OnClick="Button4_Click" Width="240px" />
             <br />
             <br />
             <br />
             <span class="auto-style4">Issue Installment</span><br />
             Payment ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="pid1" runat="server"></asp:TextBox>
             <br />
             Installment Start Date<asp:TextBox ID="idate1" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="Button5" runat="server" Text="Issue Intallment" Height="32px" Width="243px" OnClick="Button5_Click" />
             <br />
             <br />
             <br />
             <span class="auto-style4">Update thesis extension by 1</span><br />
             Thesis serial Number<asp:TextBox ID="th4" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="Button6" runat="server" Text="Update Number of Thesis Extension" Width="298px" OnClick="Button6_Click" />
             <br />

    </div>
    </form>
</body>
</html>
