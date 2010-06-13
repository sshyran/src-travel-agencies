<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CMS_MasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add Service
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../../Content/tiny_mce/tiny_mce.js" type="text/javascript"></script>

    <script src="../../Content/action-script.js" type="text/javascript"></script>

    <script src="../../Content/RichTextEditor.js" type="text/javascript"></script>

    <h2>
        Add News</h2>
    <p>
        <table style="width: 100%;">
            <tr>
                <td style="width: 120px" valign="top">
                    &nbsp; Title&nbsp;:
                </td>
                <td>
                    <%= Html.TextBox("Title", "", new { @class = "TextboxSearch", MaxLength = "250" })%>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp; Content :
                </td>
                <td>
                    <textarea id="RichTextEditor" name="RichTextEditor" rows="35" cols="124" style="width: 100%;
                        float: left; margin: 10px 0px 0px 10px">		                
	                </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;Activation :
                </td>
                <td>
                    <%= Html.CheckBox("Active") %>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <div class="button">
                        <input type="submit" value="Submit" />
                    </div>
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
