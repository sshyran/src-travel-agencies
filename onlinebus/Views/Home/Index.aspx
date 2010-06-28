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

<script type="text/javascript">
        function CityChanged(id) {
            document.location = "?Departure=" + $("#CityDeparture").val();
        }
    </script>

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
                <br />
                Largest bus ticket inventory for 5000+ bus routes.
                <br />
                Pay only bus ticket price.
                <br />
                No additional charge.
                <br />
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
            <form id="form2" method="post">
            <div class="searchmid">
                <!-- Bang Search  -->
                <table style="width: auto;" align="center" cellspacing="5">
                    <tr>
                        <td colspan="2">
                            ONLINE BUS BOOKING
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
                            <%= Html.DropDownList("CityDeparture", (IEnumerable<SelectListItem>)ViewData["CityStart"], new { @class = "TextboxStandard", onchange = "CityChanged()" })%>
                        </td>
                        <td>
                            <%= Html.DropDownList("CityDestination",(IEnumerable<SelectListItem>)ViewData["CityEnd"], new { @class = "TextboxStandard" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Depart:&nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top">
                            <input type="text" readonly="readonly" class="TextboxStandard" title="Departure Date"
                                id="txtDepartureDate" name="txtDepartureDate" />
                        </td>
                        <td>
                            <div class="button">
                                <input id="SearchBuses" name="SearchBuses" type="submit" value="Search Buses" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                <!--  Ket thuc bang Seatch -->
            </div>
            </form>
            <div class="searchbot">
            </div>
        </div>
    </div>
    <br class="spacer" />
</asp:Content>
