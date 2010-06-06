﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SearchDetail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NewMainContent" runat="server">
    <form id="form1" runat="server">
    <!-- Phan noi dung hien thi xe Buses tim duoc -->
    <div id="s_MainResult">
        <!-- Phan Header -->
        <div id="s_TopHeaderResult">
            <div id="s_depart">Depart Way : <span style="color:Blue">ahmedabad</span> to <span style="color:#ff8000">aanjar</span>  on : <span style="color:Red">06-Jun-2010</span></div>
        </div>
        <!-- Ket Thuc Phan Header -->
        <!-- Phan body -->
        <div id="s_BodyResult"></div>
        <!-- Ket thuc phan body -->
    </div>
    <!-- Ket thuc Phan noi dung hien thi xe Buses tim duoc --> 
    <!-- Phan hien thi Menu tim kiem -->  
    <div id="s_title1">
        <table id = "s_tblMenuRight" cellspacing="2">
            <tr>
                <td>
                    <div id="s_MenuTitle">
                        Search Buses</div>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Bus Search :</b><br />
                    <input type="radio" checked="checked" value="V2" name="rblRoundTrip" id="rblRoundTrip_0"
                        title="Select if one way (no return journey) booking needed" />
                    One Way
                    <input type="radio" value="V3" name="rblRoundTrip" id="rblRoundTrip_1" title="Select if return journey booking needed" />
                    Round Trip
                </td>
            </tr>
            <tr>
                <td>
                    <b>From:&nbsp;</b>
                </td>
            </tr>
            <tr>
                <td style="height: 36px">
                    <select class="comboNC" style="width: 100%" name="D1">
                        <option value="48" selected="selected">Ha noi</option>
                        <option value="203">Hue</option>
                        <option value="203">Hai Phong</option>
                        <option value="203">Da Nang</option>
                        <option value="203">Tp.Ho Chi Minh</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <b>To:</b>
                </td>
            </tr>
            <tr>
                <td>
                    <select class="comboNC" style="width: 100%" name="D2">
                        <option value="48">Ha noi</option>
                        <option value="203">Hue</option>
                        <option value="203">Hai Phong</option>
                        <option value="203" selected="selected">Da Nang</option>
                        <option value="203">Quang Ninh</option>
                        <option value="203">Tp.Ho Chi Minh</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Depart:&nbsp; </b>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" style="width: 100%;" readonly="readonly" class="textbox" title="Departure Date"
                        id="txtDepartureDate" name="txtDepartureDate" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Return:&nbsp;</b>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" style="width: 100%;" readonly="readonly" class="textbox" title="Return Date"
                        id="txtReturnDate" name="txtReturnDate" />
                </td>
            </tr>
            <tr>
                <td>
                    <div class="button">
                        <a href="/Home/SearchDetail">Search Buses</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!-- Ket thuc Phan hien thi Menu tim kiem --> 
    </form>
    <br class="spacer" />
</asp:Content>
