<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="ASP.NET_Calender.Employee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/CSS/StyleMain.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="Main">
        <h3>Stock Information</h3>
    </div>
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Content/Images/calendar_icon.png" OnClick="ImageButton1_Click" Height="30px" Width="20px"/>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />  
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
    </div>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
            <asp:ImageButton ID="ImageBtn1" runat="server" ImageUrl="Content/Images/calendar_icon.png" OnClick="ImageButton1_Click" Height="30px" Width="20px"/>
            <ajaxToolkit:CalendarExtender ID="CeDOB" runat="server" Enabled="true" TargetControlID="txtDOB" format="MM/ d/ yyyy" PopupButtonID="ImageBtn1" />
            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTxtDOB" TargetControlID="txtDOB" FilterMode="ValidChars" ValidChars="0123456789-/:" runat="server" />
        </div>
        
    </form>
</body>
</html>
