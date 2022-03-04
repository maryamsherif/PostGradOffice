<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supervisor.aspx.cs" Inherits="PostGradOffice.Supervisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: "Microsoft JhengHei";
            font-size: xx-large;
            letter-spacing: 2pt;
        }
        .auto-style2 {
            color: #FF0000;
        }
        .auto-style4 {
            font-size: large;
            background-color: #CCFFFF;
        }
        .auto-style5 {
            text-align: center;
        }
        #TextArea1 {
            height: 41px;
            width: 510px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1" style="text-align: center">
            Supervisor Page</div>
    <div class="auto-style5">

        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="View Students & Thesis Years" Height="37px" OnClick="Button2_Click" Width="335px" />
        <br />
        <br />
        <span class="auto-style4">View Student Publication</span><br />Enter student id :
        <asp:TextBox ID="sid1" runat="server" Width="185px" ></asp:TextBox>
        <br />
        <asp:Button ID="sidp" runat="server" Text="View Student Publication" Width="337px" Height="35px" OnClick="sidp_Click" />
        <br />
        <br /><span class="auto-style4">Add a Defense</span><br />GUCian?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="gucianBox" runat="server"></asp:TextBox>
        <br /><span class="auto-style2">Type yes or no</span><br />Thesis Serial Number
        <asp:TextBox ID="th1" runat="server"></asp:TextBox>
        <br />Defense Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="dd1" runat="server"></asp:TextBox>
        <br />Defense Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="dl1" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="addDef" runat="server" Text="Add Defense" Width="341px" Height="34px" OnClick="addDef_Click" />
        <br />
        <br /><span class="auto-style4">Add Examiner</span><br />Thesis Serial Number<asp:TextBox ID="th2" runat="server"></asp:TextBox>
        <br />Defense Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="dd2" runat="server"></asp:TextBox>
        <br />Examiner Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="e2" runat="server"></asp:TextBox>
        <br />Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="pass2" runat="server"></asp:TextBox>
        <br />Egyptian?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="nat2" runat="server"></asp:TextBox>
        <br /><span class="auto-style2">Type yes or no</span><br />Field of work&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="f2" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="addExaminer2" runat="server" Text="Add Examiner" Width="341px" Height="35px" OnClick="addExaminer2_Click" />
        <br />
        <br /><span class="auto-style4">Evaluate progress report</span><br />Thesis serial Number&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="th3" runat="server"></asp:TextBox>
        <br />Progress Report Number<asp:TextBox ID="prog3" runat="server"></asp:TextBox>
        <br />Evaluation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="eval3" runat="server"></asp:TextBox>
        <br /><span class="auto-style2">Please enter values from 0 to 3</span><br />
        <asp:Button ID="evaluateProg" runat="server" Text="Evaluate Progress Report" Height="37px" Width="349px" OnClick="evaluateProg_Click" />
        <br />
        <br />
       
        <br /><span class="auto-style4">Cancel a thesis</span><br />Thesis Serial Number<asp:TextBox ID="th4" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="cancelThesis" runat="server" Text="Cancel Thesis" Height="38px" Width="352px" OnClick="cancelThesis_Click" />

    </div>
    </form>
    </body>
</html>
