<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AboutUs
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NewMainContent" runat="server">
<div style="width:100%;float:left">   
    <!-- Phan noi dung hien thi xe Buses tim duoc -->
    <div id="MainResult" style="width: 955px; border: solid 1px #36809d; float: left; padding: 10px;
        background-color: #64aeca">
        <!-- Phan Header -->
        <div id="TopHeaderResult" style="width: 100%; height: 30px; border: solid 1px #36809d;
            background-color: White;">
            <div style="padding: 5px; font-weight: bold">
                About Us</div>
        </div>
        <!-- Ket Thuc Phan Header -->
        <!-- Phan body -->
        <div id="BodyResult" style="width: 100%; height: 300px; border: solid 1px #36809d;
            background-color: White; margin-top: 3px">
        </div>
        <!-- Ket thuc phan body -->
    </div>   
</div> 
 <br class="spacer" />
</asp:Content>
