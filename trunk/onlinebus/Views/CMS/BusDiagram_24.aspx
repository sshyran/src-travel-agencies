<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CMS_MasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    BusDiagram_24
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../../Content/tiny_mce/tiny_mce.js" type="text/javascript"></script>

    <script src="../../Content/action-script.js" type="text/javascript"></script>

    <script src="../../Content/RichTextEditor.js" type="text/javascript"></script>

    <h2>
        BUS'S DIAGRAM MANAGEMENT</h2>
    <!-- So do xe bus 24 cho -->
    <div style="width: 100%; float: left">
        <h4>
            24 SEATS</h4>
        <span style="color: Red">
            <% Response.Write(ViewData["Result"]); %></span>
        <div style="width: 100%; float: left; clear: both">
            <textarea id="RichTextEditor" name="RichTextEditor" rows="20" cols="124" style="width: 100%;
                float: left; margin: 10px 0px 0px 10px">
		<% Response.Write(ViewData["Data"]); %>
	</textarea>
        </div>
        <div style="width: 20%; float: right; margin: 5px; text-align: right">
            <div class="button">
                <input type="submit" value="Save Content" />
            </div>
        </div>
    </div>
    <!-- Ket thuc ve So do xe bus 24 cho -->
</asp:Content>
