<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CMS_MasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage<onlinebus.Models.Validation.ValidateAdmin>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AddNewAdmin
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../../Content/action-script.js" type="text/javascript"></script>

    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>

    <script src="../../Scripts/MicrosoftMvcValidation.js" type="text/javascript"></script>

    <% Html.EnableClientValidation(); %>
    <h2>
        Add New Admin</h2>
    <div style="width: auto; margin-left: 30px">
        <span class="error"><% Response.Write(ViewData["Error"]); %></span>
        <br />        
        Items marked (<span class="error">*</span>) are required
    </div>
    <% using (Html.BeginForm())
       { %>
    <table style="width: 65%;" align="center">
        <tr>
            <td>
                &nbsp;His/her name: (<span class="error">*</span>)
            </td>
            <td>
                <%= Html.TextBoxFor(model => model.AdminName, new { @class = "TextboxStandard", MaxLength = "50" })%>
                <span class="error"><%= Html.ValidationMessageFor(model => model.AdminName)%></span>
            </td>
        </tr>
        <tr>
            <td valign="top">
                &nbsp;DoB: (<span class="error">*</span>)
            </td>
            <td>
                <%= Html.EditorFor(model => model.DateOfBirth, new {@class="TextboxStandard", MaxLength="10" })%>
                <script type="text/javascript">
                    $(function() {
                        var currentDate = new Date();
                        var year = currentDate.getFullYear() - 50;
                        var month = currentDate.getMonth();
                        var day = currentDate.getDate();
                        $("#DateOfBirth").datepicker({ minDate: new Date(year, month, day) });
                    });
                </script>
                <span class="error"><%= Html.ValidationMessageFor(model => model.DateOfBirth)%></span>
                <br />(Press CTRL + pgUP/pgDOW are change year)
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Password:&nbsp; (<span class="error">*</span>)
            </td>
            <td>
                <%= Html.PasswordFor(model =>model.Password, new { @class = "TextboxStandard", MaxLength="20", MinLength="4" })%>
                <span class="error"><%= Html.ValidationMessageFor(model =>model.Password) %></span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Password confirm:&nbsp; (<span class="error">*</span>)
            </td>
            <td>
                <%= Html.Password("txtPasswordConfirm", "", new { @class = "TextboxStandard", MaxLength = "20", OnBlur="hehe()" })%>
                
                <script type="text/javascript">
                    function hehe() {
                        if ($("#Password").val() != $("#txtPasswordConfirm").val()) { 
                            alert("Password not compare Password confirm, please recheck!");
                        }                         
                    }
                </script>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Address:&nbsp; (<span class="error">*</span>)
            </td>
            <td>
                <%= Html.TextBoxFor(model =>model.Address, new { @class = "TextboxStandard", MaxLength = "250" })%>
                <span class="error"><%= Html.ValidationMessageFor(model => model.Address) %></span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Phone:&nbsp;
            </td>
            <td>
                <%= Html.TextBoxFor(model => model.Phone, new { @class = "TextboxStandard", MaxLength = "20" })%>
                <span class="error"><%= Html.ValidationMessageFor(model => model.Phone) %></span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Email:&nbsp; (<span class="error">*</span>)
            </td>
            <td>
                <%= Html.TextBoxFor(model => model.Email, new { @class = "TextboxStandard", MaxLength = "100" })%>
                <span class="error"><%= Html.ValidationMessageFor(model =>model.Email) %></span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Role:&nbsp; (<span class="error">*</span>)&nbsp;
            </td>
            <td>
                <%= Html.DropDownListFor(model => model.Role, (IEnumerable<SelectListItem>)ViewData["Role"], new { @class = "TextboxStandard" })%>
                <span class="error"><%= Html.ValidationMessageFor(model => model.Role) %></span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Description:&nbsp;
            </td>
            <td>
                <%= Html.TextAreaFor(model =>model.Description, new { @class = "TextboxStandard", MaxLength = "250" })%>
                <span class="error"><%= Html.ValidationMessageFor(model => model.Description) %></span>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Activation:</td>
            <td>
                <%= Html.CheckBox("Active",true) %></td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <div class="button">
                    <input type="submit" value="Add New" />
                    <input type="reset" value="Reset" />
                </div>
            </td>
        </tr>
    </table>
    <% } %>
</asp:Content>
