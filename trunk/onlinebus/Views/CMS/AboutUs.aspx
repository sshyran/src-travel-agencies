<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CMS_MasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AboutUs
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../../Content/tiny_mce/tiny_mce.js" type="text/javascript"></script>

    <script src="../../Content/action-script.js" type="text/javascript"></script>

    <script src="../../Content/RichTextEditor.js" type="text/javascript"></script>

    <h2>
        About Us</h2>
    <span style="color: Red">
        <% Response.Write(ViewData["Result"]); %></span>
    <div style="width: 100%; float: left; clear: both">
        <textarea id="RichTextEditor" name="RichTextEditor" rows="35" cols="124" style="width: 100%;
            float: left; margin: 10px 0px 0px 10px">
		<% Response.Write(ViewData["Data"]); %>
	</textarea>
    </div>
    <div style="width: 20%; float: right; margin: 5px; text-align: right">
        <div class="button">
            <input type="submit" value="Save Content" />
        </div>
    </div>
</asp:Content>
