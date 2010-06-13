<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="onlinebus.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    GetAllServicesPage</asp:Content>

<script runat="server">    
    List<tbl_Service> services;
    protected void Page_Load(object sender, EventArgs e)
    {
        RepositoryOBTRS db = new RepositoryOBTRS();
        services = db.GetServices(0);
    }
</script>
<asp:Content ID="Content2" ContentPlaceHolderID="NewMainContent" runat="server">
    <style type="text/css">
        #BodyResult p
        {
            margin-top: 5px;
        }
    </style>
    <div style="width: 100%; float: left">
        <!-- Phan noi dung hien thi xe Buses tim duoc -->
        <div id="MainResult" style="width: 955px; border: solid 1px #36809d; float: left;
            padding: 10px; background-color: #64aeca">
            <!-- Phan Header -->
            <div id="TopHeaderResult" style="width: 100%; height: 30px; border: solid 1px #36809d;
                background-color: White;">
                <div style="padding: 5px; font-weight: bold">
                    Services List</div>
            </div>
            <!-- Ket Thuc Phan Header -->
            <!-- Phan body -->
            <!-- tao CSS can cho moi tag P cach nhau 5px -->
            <div id="BodyResult" style="width: 100%; min-height: 300px; border: solid 1px #36809d;
                background-color: White; margin-top: 3px;">
                <div style="margin: 20px">
                    <% 
                        for (int i = 0; i < services.Count; i++)
                        {
                            Response.Write("<a href='/Home/DetailService/" + services[i].Services_ID + "' style='color:#846969;cursor:pointer;text-decoration:none'>+ " + services[i].Services_Title + " (" + services[i].Services_Edit + ")</a>" + "<br/>");
                        }     
                    %></div>
            </div>
            <!-- Ket thuc phan body -->
        </div>
    </div>
    <br class="spacer" />
</asp:Content>
