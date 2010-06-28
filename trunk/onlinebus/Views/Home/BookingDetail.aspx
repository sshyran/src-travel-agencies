<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="onlinebus.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    BookingDetail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NewMainContent" runat="server">
    <style type="text/css">
        #BodyResult p
        {
            margin-top: 5px;
        }
    </style>
    <div style="width: 100%; float: left">
        <!-- Phan noi dung hien thi xe Buses tim duoc -->
        <div id="MainResult" style="width: 955px; border: solid 1px #36809d; float: left;
            padding: 10px; background-color: #64aeca">
            <!-- Phan Header -->
            <div id="TopHeaderResult" style="width: 100%; height: 30px; border: solid 1px #36809d;
                background-color: White;">
                <div style="padding: 5px; font-weight: bold">
                    Booking Detail</div>
            </div>
            <!-- Ket Thuc Phan Header -->
            <!-- Phan body -->
            <!-- tao CSS can cho moi tag P cach nhau 5px -->
            <div id="BodyResult" style="width: 100%; min-height: 300px; border: solid 1px #36809d;
                background-color: White; margin-top: 3px;">
                <div style="margin: 20px; clear: both">
                    <%
                        RepositoryOBTRS db = new RepositoryOBTRS();
                        List<String> RouteDetail = (List<String>)ViewData["RouteDetail"];                        
                    %><table id="Detail" style="width:100%">
                        <tr>
                            <td>
                                &nbsp;<strong>Route: </strong>
                            </td>
                            <td>
                                &nbsp;<% Response.Write(db.GetCityName(Convert.ToInt32(Request.Params["BeginID"])) + " to " + db.GetCityName(Convert.ToInt32(Request.Params["EndID"]))); %>
                            </td>
                            <td rowspan="9" style="width:520px" valign="top">
                                <img width="520px" height="200px" src="../../Content/Pictures/buses_2.png" />
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<strong>Date Depart: </strong>
                            </td>
                            <td>
                                &nbsp;<% Response.Write(Request.Params["Date"]); %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<strong>Bus Type: </strong>
                            </td>
                            <td>
                                &nbsp;<% Response.Write(RouteDetail[0]); %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<strong>Seat: </strong>
                            </td>
                            <td>
                                &nbsp;<% Response.Write(RouteDetail[1]); %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<strong>Seat Available: </strong>
                            </td>
                            <td style="color: Red; font-weight: bold">
                                &nbsp;<% 
                                          ArrayList SeatList = (ArrayList)ViewData["BookedSeat"];
                                          Response.Write("<script type='text/javascript'>");
                                          Response.Write("$(document).ready(function() {");
                                          for (int i = 0; i < SeatList.Count; i++)
                                          {
                                              Response.Write("$('#Checkbox" + SeatList[i] + "').attr('disabled', 'disabled');");
                                              Response.Write("$('#Checkbox" + SeatList[i] + "').attr('checked', 'checked');");
                                          }
                                          Response.Write("});");
                                          Response.Write("</script>");
                                          Response.Write(Convert.ToInt16(RouteDetail[1]) - SeatList.Count);                                          
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<strong>Start Time (24h): </strong>
                            </td>
                            <td>
                                &nbsp;<% Response.Write(RouteDetail[2] + ":00"); %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<strong>Estimate Time : </strong>
                            </td>
                            <td>
                                &nbsp;<% Response.Write(RouteDetail[3] + "(hour)"); %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<strong>Length : </strong>
                            </td>
                            <td>
                                &nbsp;<% Response.Write(RouteDetail[4] + "(km)"); %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<strong>Cost/ticket: </strong>
                            </td>
                            <td>
                                &nbsp;<% Response.Write(Double.Parse(RouteDetail[5]) + " $"); %>
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Please choose seats position which you like!<table style="width:100%;">
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="Unavailable">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </h4>
                    <form id="form1" method="post" action="/Home/BusTicketOffice">
                    <p>
                        <!-- So do cua xe bus  -->
                        <% Response.Write(ViewData["BusDiagram"]); %>
                        <!--  Ket thuc so do -->
                    </p>
                    <div class="button">
                        <input type="submit" value="Go To Ticket Office" />
                    </div>
                    </form>
                </div>
                <br class="spacer" />
            </div>
            <!-- Ket thuc phan body -->
        </div>
    </div>
    <br class="spacer" />
</asp:Content>
