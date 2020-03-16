<%@ Page Title="" Language="C#" MasterPageFile="~/PatientMaster.Master" AutoEventWireup="true" CodeBehind="PatientData.aspx.cs" Inherits="ASP.NET_Calender.PatientData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
         <asp:Label ID="lblFilterText" AssociatedControlID="txtFilterText" runat="server" Text="Filter the Gridview:"></asp:Label>
         <asp:TextBox ID="txtFilterText" runat="server"></asp:TextBox>
         <br />
         <asp:Button ID="btnFilter" runat="server" Text="Filter the Text" />
         <br />
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="StockDataSource" GridLines="None">
             <Columns>
                 <asp:BoundField DataField="St_ID" HeaderText="St_ID" SortExpression="St_ID" />
                 <asp:BoundField DataField="St_Name" HeaderText="St_Name" SortExpression="St_Name" />
                 <asp:BoundField DataField="St_Price" HeaderText="St_Price" SortExpression="St_Price" />
             </Columns>
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333"/>
             <EditRowStyle BackColor="#999999" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         </asp:GridView>
         <asp:SqlDataSource ID="StockDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockPricesConnectionString %>" SelectCommand="SELECT * FROM [St_TBL] WHERE ([St_Name] = @St_Name)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="txtFilterText"
                     Name="St_Name" PropertyName="Text" Type="String" />
              </SelectParameters>
         </asp:SqlDataSource>
         <br />

     </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>
 
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .auto-style1 {
        margin-left: 40px;
    }
</style>
</asp:Content>

 
