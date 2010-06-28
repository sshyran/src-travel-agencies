<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Payment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NewMainContent" runat="server">
    <div style="width: 100%; float: left">
        <!-- Phan noi dung hien thi xe Buses tim duoc -->
        <div id="MainResult" style="width: 955px; border: solid 1px #36809d; float: left;
            padding: 10px; background-color: #64aeca">
            <!-- Phan Header -->
            <div id="TopHeaderResult" style="width: 100%; height: 30px; border: solid 1px #36809d;
                background-color: White;">
                <div style="padding: 5px; font-weight: bold">
                    Payment Your Bill
                </div>
            </div>
            <!-- Ket Thuc Phan Header -->
            <!-- Phan body -->
            <!-- tao CSS can cho moi tag P cach nhau 5px -->
            <div id="BodyResult" style="width: 100%; min-height: 300px; border: solid 1px #36809d;
                background-color: White; margin-top: 3px;">
                <div style="margin: 20px; clear: both">
                    <h4>
                        Result booking:
                    </h4>
                    <%
                        ArrayList result = (ArrayList)ViewData.Model;
                        for (int i = 0; i < result.Count; i++)
                        {
                            Response.Write((i + 1) + ". " + result[i] + "<br />");
                        }
                        Response.Write("<br /><span class='error'>");
                        Response.Write("Attention: <br />1. You must contact admin and give money to us account at banks such as VietcomBank, Agribank, TeckcomBank, DeutscheBank or TienPhongBank.");
                        Response.Write("<br />2. After we receive money, we active your ticket, then your booking ticket has value.");
                        Response.Write("</span>"); 
                    %>
                </div>
                <br class="spacer" />
            </div>
            <!-- Ket thuc phan body -->
        </div>
    </div>
    <br class="spacer" />
</asp:Content>
