<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Web.UI" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NewMainContent" runat="server">
    <!-- LEFT CONTENT -->
    <div id="left">
        <div id="left2">
            <p class="pic2">
            </p>
            <p class="boxTxt2">
                <span>Time lower</span><b>Time is gold!</b>,Online Bus ticket booking help you saving
                your time</p>
            <br class="spacer" />
        </div>
        <div id="left3">
            <p class="pic3">
            </p>
            <p class="boxTxt3">                
                <span>How is different?</span> How is travel Book <strong>bus tickets</strong> "live".
                No request booking
                <br /><br />
                Largest bus ticket inventory for 5000+ bus routes.
                <br /><br />
                Pay only bus ticket price.
                <br /><br />
                No additional charge.
                <br /><br />
                Return bus ticket booking and cancellation facility</p>
            <br class="spacer" />
        </div>
        <br class="spacer" />
    </div>
    <!-- LEFT CONTENT -->
    <div id="right">
        <div id="homeleft">
            <div class="searchtop">
                <div id="bookformtitle">
                    <h2>
                        SEARCH BUSES</h2>
                </div>
            </div>
            <form id="form2" runat="server">
            <div class="searchmid">
                <table style="width: 100%" cellspacing="10">
                    <tr>
                        <td colspan="2">
                            Bus Search :
                            <input type="radio" checked="checked" value="V1" name="rblRoundTrip" id="rblRoundTrip_0"
                                title="Select if one way (no return journey) booking needed" />
                            One Way
                            <input type="radio" value="V1" name="rblRoundTrip" id="rblRoundTrip_1" title="Select if return journey booking needed" />
                            Round Trip
                        </td>
                    </tr>
                    <tr>
                        <td>
                            From:&nbsp;
                            </td>
                        <td>
                            To:&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select class="comboNC" style="width: 100%" name="D1">
                                <option value="48" selected="selected">Ha noi</option>
                                <option value="203">Hue</option>
                                <option value="203">Hai Phong</option>
                                <option value="203">Da Nang</option>
                                <option value="203">Tp.Ho Chi Minh</option>
                            </select>
                        </td>
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
                            Depart:&nbsp;
                        </td>
                        <td>
                            Return:&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" style="width: 100%;" readonly="readonly" class="textbox" title="Departure Date"
                                id="txtDepartureDate" name="txtDepartureDate" />
                        </td>
                        <td>
                            <input type="text" style="width: 100%;" readonly="readonly" class="textbox" title="Return Date"
                                id="txtReturnDate" name="txtReturnDate" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div class="button">
                                <a href="/Home/SearchDetail">Search Buses</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            </form>
            <div class="searchbot">
            </div>
        </div>
    </div>
    <br class="spacer" />
</asp:Content>
