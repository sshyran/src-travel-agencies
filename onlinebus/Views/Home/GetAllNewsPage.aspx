﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="onlinebus.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    GetAllNewsPage</asp:Content>

<script runat="server">
    List<tbl_New> news;    
    protected void Page_Load(object sender, EventArgs e)
    {
        RepositoryOBTRS db = new RepositoryOBTRS();
        news = db.GetNews(0);
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
                    News List</div>
            </div>
            <!-- Ket Thuc Phan Header -->
            <!-- Phan body -->
            <!-- tao CSS can cho moi tag P cach nhau 5px -->
            <div id="BodyResult" style="width: 100%; min-height: 300px; border: solid 1px #36809d;
                background-color: White; margin-top: 3px;">
                <div style="margin: 20px">
                    <% 
                        for (int i = 0; i < news.Count; i++)
                        {
                            Response.Write("<a href='/Home/DetailNews/" + news[i].News_ID + "' style='color:#846969;cursor:pointer;text-decoration:none'>+ " + news[i].News_Title + " (" + news[i].News_Edit + ")</a>" + "<br/>");
                        }     
                    %></div>
            </div>
            <!-- Ket thuc phan body -->
        </div>
    </div>
    <br class="spacer" />
</asp:Content>