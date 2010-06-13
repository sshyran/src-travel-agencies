<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<onlinebus.Models.Validation.ValidateLogin>"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>www.onlinebus.dev CMS</title>
    <link href="../../Content/StylesCMS.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/style.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/jquery-ui-1.8.2.custom/css/cupertino/jquery-ui-1.8.2.custom.css"
        rel="stylesheet" type="text/css" />

    <script src="../../Content/jquery-1.4.2.js" type="text/javascript"></script>

    <script src="../../Content/jquery-ui-1.8.2.custom/js/jquery-ui-1.8.2.custom.min.js"
        type="text/javascript"></script>

    <script src="../../Content/action-script.js" type="text/javascript"></script>

    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>

    <script src="../../Scripts/MicrosoftMvcValidation.js" type="text/javascript"></script>

    <% Html.EnableClientValidation(); %>
</head>

<script runat="server">
    public void Page_Load(object sender, System.EventArgs e)
    {
        //Kiem tra neu co ton tai Cookie cmsOBTRS thi gan gia tri 
        //cho sesssion va chuyen toi trang WelcomeAptech
        HttpCookie cookie = HttpContext.Current.Request.Cookies.Get("cmsOBTRS");
        if (cookie != null)
        {
            Session["LogedName"] = cookie.Values["Username"];
            Session["Admin_ID"] = cookie.Values["ID"];
            if (!Response.IsRequestBeingRedirected)
            {
                Response.Redirect("/CMS/WelcomeAptech");
            }
        }
    }
</script>

<body style="background-image: url('../../Content/images/background.jpg'); background-repeat: repeat-x;">
    <form id="form1" runat="server">
    <% using (Html.BeginForm())
       { %>
    <center>
        <div id="LoginForm" class="LoginForm">
            <div id="InnerForm" class="InnerForm">
                <!-- Logo -->
                <div class="FormLoginLogo">
                    SRC Travel Agencies</div>
                <div style="width: 100%; height: 159px; margin-top: 8px; float: left;">
                    <table style="width: 100%; margin-top: 25px; text-align: left">
                        <tr>
                            <td>
                            </td>
                            <td style="font-weight: bold; color: #ff5a00; font-size: 14pt">
                                Login
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-weight: bold">
                                Email:&nbsp;
                            </td>
                            <td style="color: #ebebeb">
                                <%= Html.TextBoxFor(model => model.Email, new { @class = "TextboxStandard", MaxLength = "100", TabIndex = 1 })%>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; font-weight: bold">
                                Password:&nbsp;
                            </td>
                            <td style="color: #ebebeb">
                                <%= Html.PasswordFor(Model => Model.Password, new { @class = "TextboxStandard", Maxlength = "50"})%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="vertical-align: middle">
                                <%= Html.CheckBox("Remember", false)%>
                                Remember me.
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="LoginFoot" style="width: 100%; height: 50px; float: left; background-color: #7eb7da">
                    <div style="width: auto; float: left; margin-top: 15px; margin-left: 10px">
                        <a href="/CMS/Home">www.onlinebus.</a>dev
                    </div>
                    <div style="width: 80px; margin-top: 8px; float: right; margin-right: 40px;">
                        <div class="button">
                            <input type="submit" value="Login" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div style="width: 30%; text-align: left; color: Red;">
            <noscript>
                <h4 class="error">
                    Your browser no support javascript or turn off, please recheck. Maybe system shall
                    occur serious error because some elements no work</h4>
            </noscript>
            <!-- Thong bao loi -->
            <% Response.Write(ViewData["Result"].ToString()); %>
            <br />
            <%= Html.ValidationMessageFor(model => model.Email) %>
            <br />
            <%= Html.ValidationMessageFor(model => model.Password) %>
            <br />
        </div>
    </center>
    <%} %>
    </form>
</body>
</html>
