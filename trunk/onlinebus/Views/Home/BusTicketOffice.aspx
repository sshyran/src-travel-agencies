<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    BusTicketOffice
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NewMainContent" runat="server">

    <script type="text/javascript">
        var DiscountCost = 0;
        function CalculateCost(id) {
            if (isNaN($("#Age" + id).val())) {
                $("#Age" + id).val('18');
                //Tinh toan Cost
                Discount($("#Age" + id).val(), $("#Cost" + id).attr("value"));
                $("#Cost" + id).attr("value", DiscountCost);
                $("#Cost" + id).html(DiscountCost);
            } else {
                if ($("#Age" + id).val() == "") {
                    $("#Age" + id).val('18');
                    //Tinh toan Cost
                    Discount($("#Age" + id).val(), $("#Cost" + id).attr("value"));
                    $("#Cost" + id).attr("value", DiscountCost);
                    $("#Cost" + id).html(DiscountCost);
                }
                //Tinh toan Cost
                Discount($("#Age" + id).val(), $("#Cost" + id).attr("value"));
                $("#Cost" + id).attr("value", DiscountCost);
                $("#Cost" + id).html(DiscountCost);
            }
        }
        function Discount(age, cost) {
            if (age < 5) {
                DiscountCost = (cost * 0);
            }
            else if (age >= 5 && age < 12) {
                DiscountCost = (cost * 0.7);
            }
            else if (age >= 12 && age < 50) {
                DiscountCost = (cost * 1);
            } else {
                DiscountCost = (cost * 0.7);
            }
            DiscountCost = Math.round(DiscountCost);
        }
    </script>

    <div style="width: 100%; float: left">
        <!-- Phan noi dung hien thi xe Buses tim duoc -->
        <div id="MainResult" style="width: 955px; border: solid 1px #36809d; float: left;
            padding: 10px; background-color: #64aeca">
            <!-- Phan Header -->
            <div id="TopHeaderResult" style="width: 100%; height: 30px; border: solid 1px #36809d;
                background-color: White;">
                <div style="padding: 5px; font-weight: bold">
                    Bus Ticket Office
                </div>
            </div>
            <!-- Ket Thuc Phan Header -->
            <!-- Phan body -->
            <!-- tao CSS can cho moi tag P cach nhau 5px -->
            <div id="BodyResult" style="width: 100%; min-height: 300px; border: solid 1px #36809d;
                background-color: White; margin-top: 3px;">
                <div style="margin: 20px; clear: both">
                    <h5>
                        Please enter NAME and AGE of tickets</h5>
                    <div style="width: 100%">
                        <% 
                            //Lay thong tin tuyen da chon cua khach hang
                            List<String> Routelist = (List<String>)Session["RouteDetail"];

                            //Lay thong tin ghe vua dat
                            ArrayList BookingSeats = new ArrayList();
                            BookingSeats = (ArrayList)ViewData.Model;
                            //Ket thuc lay        
                        %>
                        <form id="form1" method="post" action="/Home/Payment">
                        <table style="width: auto;" cellpadding="3" cellspacing="3">
                            <tr>
                                <th>
                                    Seat N<sub>o</sub>
                                </th>
                                <th>
                                    Name
                                </th>
                                <th>
                                    Age
                                </th>
                                <th>
                                    Cost($)
                                </th>
                            </tr>
                            <%                
                                //Hien thi du lieu
                                for (int i = 0; i < BookingSeats.Count; i++)
                                {
                                    Response.Write("<tr>");

                                    //So ghe da dang ky
                                    Response.Write("<td>");
                                    Response.Write("[" + BookingSeats[i].ToString() + "]");
                                    Response.Write("</td>");

                                    //Ghi ten
                                    Response.Write("<td>");
                                    Response.Write("<input id='NameCustomer" + i + "' name='NameCustomer" + i + "' type='text' class='TextboxStandard' maxlength='90'/>");
                                    Response.Write("</td>");

                                    //Ghi tuoi
                                    Response.Write("<td>");
                                    Response.Write("<input id='Age" + i + "' name='Age" + i + "' type='text' class='TextboxSmall' maxlength='2' onBlur = CalculateCost(" + i + ") />");
                                    Response.Write("</td>");

                                    //Gia ve
                                    Response.Write("<td>");
                                    Response.Write("<div id='Cost" + i + "' value='" + Double.Parse(Routelist[5]) + "'>" + Double.Parse(Routelist[5]) + "</div>");
                                    Response.Write("</td>");

                                    Response.Write("</tr>");
                                }                
                            %>
                            <tr>
                                <th>
                                    &nbsp;
                                </th>
                                <th>
                                    &nbsp;
                                </th>
                                <th>
                                    Total:
                                </th>
                                <th>
                                    <div id="TotalCost" align="left" class="error">
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <th colspan="2">
                                    <div id="Div1" class="button">
                                        <input id="SubmitPayment" type="submit" value="Go to Payment Page" onclick="return CheckInput();" />
                                    </div>
                                </th>
                                <th colspan="2">
                                    <div id="Cal" class="button">
                                        <input type="button" value="Calculate Cost" />
                                    </div>
                                </th>
                            </tr>
                        </table>
                        </form>
                    </div>
                    <%
                        //Chuyen tong so luong ghe dat toi Client
                        Response.Write("<script type='text/javascript'>");
                        Response.Write("var BookingSeats = " + BookingSeats.Count + ";");

                        //Tinh toan tong gia thanh cua Ticket tren client
                        Response.Write("$('#Cal').click(function() {");
                        Response.Write("var cost = 0;");
                        Response.Write("var i;");
                        Response.Write("for (i = 0; i < BookingSeats; i++) {");
                        Response.Write("var c = $('#Cost' + i).attr('value') * 1;");
                        Response.Write("cost = cost + c;");
                        Response.Write("}");
                        Response.Write("$('#TotalCost').html(cost);");
                        Response.Write("});");

                        //Kiem tra neu nhap thieu thong tin thi thong bao
                        //Response.Write("$('#SubmitPayment').click(function() {");
                        Response.Write("function CheckInput() {");
                        Response.Write("var i;");
                        Response.Write("for (i = 0; i < BookingSeats; i++) {");
                        Response.Write("if ($('#NameCustomer' + i).val() == '' || $('#Age' + i).val() == '') {");
                        Response.Write("alert('Please enter NAME and AGE!');");
                        Response.Write("$('#NameCustomer' + i ).focus();");
                        Response.Write("return false;");
                        Response.Write("break;");
                        Response.Write("}");
                        Response.Write("}");
                        Response.Write("};");
                        Response.Write("</script>");
                    %>
                </div>
                <br class="spacer" />
            </div>
            <!-- Ket thuc phan body -->
        </div>
    </div>
    <br class="spacer" />
</asp:Content>
