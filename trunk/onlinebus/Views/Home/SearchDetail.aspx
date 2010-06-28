<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="onlinebus.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SearchDetail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NewMainContent" runat="server">

<script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewData["DataRoute"] != null)
            {
                grdBusRoute.DataSource = ViewData["DataRoute"];
                grdBusRoute.DataBind();
            }


            //Lay thong tin dia diem di va dia diem den tu form gui len
            //if (ViewData["CityStart"] != null || ViewData["CityEnd"] != null)
            //{
            //    CityDeparture.Text = ViewData["CityStart"].ToString();
            //    CityDestination.Text = ViewData["CityStart"].ToString();
            //}
            //else
            //{
            //    CityDeparture.Text = "???";
            //    CityDestination.Text = "???";
            //}
            //--------------- Ket thuc lay du lieu tu form gui len -------------------------------------------
            
            //Lay thong tin dia diem di va dia diem den tren thanh Address
            if (Request.Params["Departure"] != null)
            {
                ////Hien thi Ten thanh Pho khoi hanh
                RepositoryOBTRS db = new RepositoryOBTRS();
                CityDeparture.Text = db.GetCityName(Convert.ToInt32(Request.Params["Departure"]));
                if (Request.Params["Destination"] != null)
                {
                    ////Hien thi ten thanh pho den
                    CityDestination.Text = db.GetCityName(Convert.ToInt32(Request.Params["Destination"]));
                }
                else if (Request.Params["CityDestination"] != null)
                {
                    CityDestination.Text = db.GetCityName(Convert.ToInt32(Request.Params["CityDestination"]));
                }
                else
                {
                    CityDestination.Text = "?";
                }
            }
            else if (ViewData["Title_Departure"] != null || ViewData["Title_Destination"] != null)
            {
                CityDeparture.Text = ViewData["Title_Departure"].ToString();
                CityDestination.Text = ViewData["Title_Destination"].ToString();
            }    
            else
            {
                CityDeparture.Text = "?????";
                CityDestination.Text = "?????";
            }
            //--------------- Ket thuc lay du lieu tren thanh Address -------------------------------------------
        }
        Int16 cnt = 1;
        public void count()
        {
            Response.Write(cnt);
            cnt++;
        }
    </script>

    <script type="text/javascript">
        function CityChanged(id) {
            document.location = "?Departure=" + $("#CityDeparture").val();
        }        
    </script>

    <form id="Form1" runat="server">
    <!-- Phan noi dung hien thi xe Buses tim duoc -->
    <div id="MainResult" style="width: 75%; border: solid 1px #36809d; float: left; padding: 10px;
        background-color: #64aeca">
        <!-- Phan Header -->
        <div id="TopHeaderResult" style="width: 100%; height: 30px; border: solid 1px #36809d;
            background-color: White;">
            <div style="padding: 5px; font-weight: bold">
                Your Way : From<span style="color: Blue">
                    <asp:Label ID="CityDeparture" runat="server" Text=""></asp:Label></span> to
                <span style="color: #ff8000">
                    <asp:Label ID="CityDestination" runat="server" Text=""></asp:Label></span> at
                : <span style="color: Red">
                    <%
                        if (ViewData["DateDepart"] != null)
                        {
                            Response.Write(ViewData["DateDepart"]);                            
                        }                                             
                    %>
                </span>
            </div>
        </div>
        <!-- Ket Thuc Phan Header -->
        <!-- Phan body -->
        <div id="BodyResult" style="width: 100%; min-height: 300px; border: solid 1px #36809d;
            background-color: White; margin-top: 3px;">
            <div style="margin: 10px">
                <asp:GridView ID="grdBusRoute" runat="server" AutoGenerateColumns="False" Width="100%"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:TemplateField HeaderText="No">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminID" Visible="false" runat="server" Text='<%# Eval("BusType_Name")%>'></asp:Label>
                                <% count(); %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Book">
                            <ItemTemplate>
                                <asp:HyperLink NavigateUrl='<%# "~/Home/BookingDetail?BeginID=" + Eval("BusRoute_CityStartID") + "&EndID=" + Eval("BusRoute_CityEndID") + "&BusTypeID=" + Eval("BusRoute_BusTypeID") + "&StartTime=" + Eval("BusRoute_StartTime") + "&Date=" + ViewData["DateDepart"]%>'
                                    ID="HyperLink1" runat="server">
                        <img alt="" src="../../Content/Navigator/48px-Crystal_Clear_action_apply.jpg"
                            style="width: 18px; height: 18px" title="Booking" />
                                </asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bus Type">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminName" runat="server" Text='<%# Eval("BusType_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Number of Seat" ItemStyle-Width="150px" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminBirthday" runat="server" Enabled="false" Text='<%# Eval("BusType_Seat") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Width="150px"></ItemStyle>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Departure (24h)">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminPassword" runat="server" Text='<%# Eval("BusRoute_StartTime") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estimate (h)">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminAddress" runat="server" Text='<%# Eval("BusRoute_EstimateTime") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Length (km)">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminEmail" runat="server" Text='<%# Eval("BusRoute_Length") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cost">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminEmail" runat="server" Text='<%# Eval("BusRoute_Cost") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
        <!-- Ket thuc phan body -->
    </div>
    <!-- Ket thuc Phan noi dung hien thi xe Buses tim duoc -->
    <form id="form2" method="post" action="">
    <!-- Phan hien thi Menu tim kiem -->
    <div style="width: 20%; float: right; padding: 5px;">
        <table id="tblMenuRight" style="width: 100%; float: right; border: solid 1px #b9b99d;
            margin-right: 5px;" cellspacing="2">
            <tr>
                <td>
                    <div id="MenuTitle" style="height: 30px; padding: 10px 15px 10px 15px; background-color: #347c95;
                        font-size: 15pt; color: White; font-weight: bold; text-align: center">
                        Search Buses</div>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Bus Search :</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>From:&nbsp;</b>
                </td>
            </tr>
            <tr>
                <td>
                    <%= Html.DropDownList("CityDeparture", (IEnumerable<SelectListItem>)ViewData["CityStart"], new { @class = "TextboxStandard", onchange = "CityChanged()" })%>
                </td>
            </tr>
            <tr>
                <td>
                    <b>To:</b>
                </td>
            </tr>
            <tr>
                <td>
                    <%= Html.DropDownList("CityDestination", (IEnumerable<SelectListItem>)ViewData["CityEnd"], new { @class = "TextboxStandard" })%>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Depart:&nbsp; </b>
                </td>
            </tr>
            <tr>
                <td>
                    <%--<input type="text" readonly="readonly" class="TextboxStandard" title="Departure Date"
                        id="txtDepartureDate" name="txtDepartureDate" />--%>
                    <%
                        if (ViewData["DateDepart"] != null)
                        {
                            Response.Write("<input type='text' readonly='readonly' class='TextboxStandard' title='Departure Date'"+
                                            "id='txtDepartureDate' name='txtDepartureDate' value='" + ViewData["DateDepart"] + "' />");
                        }
                        else {
                            Response.Write("<input type='text' readonly='readonly' class='TextboxStandard' title='Departure Date'" +
                                            "id='txtDepartureDate' name='txtDepartureDate' />");
                        }                            
                    %>    
                </td>
            </tr>
            <tr>
                <td>
                    <div class="button">                        
                        <input type="submit" value="Search Buses" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!-- Ket thuc Phan hien thi Menu tim kiem -->
    </form>
    <br class="spacer" />
    </form>
</asp:Content>
