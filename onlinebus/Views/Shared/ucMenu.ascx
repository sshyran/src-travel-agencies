<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<style type="text/css">
    .LeftMenu a
    {
        color: #353131;
    }
    .LeftMenu ul, li
    {
        /* chinh tong the  tat ca cac the ul,li,a */
        display: block;
        cursor: pointer;
        margin: 0;
        padding: 0;
    }
    .LeftMenu ul
    {
        /* chinh cu the tat ca cac the ul */
        width: 180px;
        list-style: none;
        border: solid 1px #1f5474;
    }
    .LeftMenu li
    {
        /* chinh cu the tat ca cac the li */
        position: relative;
        z-index: 9;
        height: 25px;
        border-bottom: dotted 1px #276a92;
        background-color: #99c8e3;
        padding: 10px 0 0 10px;
    }
    .LeftMenu .folder ul
    {
        /* chinh cu the tat cac cac the ul nam trong "folder"*/
        position: absolute;
        left: 180px;
        top: 0px;
        border: solid 1px #1f5474;
    }
    .LeftMenu li.folder.ul
    {
        left: 180px;
    }
    .LeftMenu li.folder ul
    {
        /* chinh tat ca cac the a cua ul nam trong"folder" */
        color: #1e3d51;
        border: solid 1px #1f5474;
    }
    .LeftMenu li:hover
    {
        background-color: #65abd6;
    }
    .LeftMenu li.folder:hover
    {
        z-index: 10;
    }
    .LeftMenu ul ul, li:hover ul ul, li:hover li:hover ul ul, li:hover li:hover li:hover ul ul
    {
        display: none;
    }
    .LeftMenu li:hover ul, li:hover li:hover ul, li:hover li:hover li:hover ul, li:hover li:hover li:hover li:hover ul
    {
        display: block;
    }
    .LeftMenu .MenuTitle
    {
        width: 175px;
        height: 30px;
        float: left;
        margin-top: 5px;
        padding-left: 5px;
        padding-top: 10px;
        font-weight: bold;
        border: solid 1px #1f5474;
        background-color: #67acd6;
        color: White;
        display: block;
    }
</style>
<div class="LeftMenu" style="width: 180px; float: left; margin: 5px 5px 0 0; min-height: 500px">
    <table cellpadding="0" cellspacing="1" border="0">
        <tr>
            <td>
                <div class="MenuTitle">
                    Website Management</div>
            </td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li class="folder"><a href="#">Infomation of Company</a>
                        <ul>
                            <li><a href="/CMS/AboutUs">About Us</a></li>
                            <li><a href="/CMS/ContactUs">Contact Us</a></li>
                            <li><a href="/CMS/TermCondition">Term & Condition</a></li>
                            <li><a href="/CMS/PrivacyPolicy">Privacy Policy</a></li>
                        </ul>
                    </li>
                    <li class="folder"><a href="#">News & Services</a>
                        <ul>
                            <li><a href="/CMS/NewsManagement">News Management</a></li>
                            <li><a href="/CMS/ServicesManagement">Services Management</a></li>                            
                        </ul>
                    </li>
                    <li class="folder"><a href="#">Tin tức</a>
                        <ul>
                            <li><a href="/CMS/AddNews">Thêm tin tức</a></li>
                            <li><a href="/CMS/News">Quản lý tin tức</a></li>
                        </ul>
                    </li>
                    <li><a href="/CMS/ViewManage">Quản lý hiển thị</a></li>
                    <li><a href="/CMS/MenuManage/0">Quản lý Menu</a></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <div class="MenuTitle">
                    User Management</div>
            </td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li class="folder"><a href="#">Manager</a>
                        <ul>
                            <li><a href="/CMS/AddNewAdmin">Add New Manager</a></li>
                            <li><a href="/CMS/ManagerList">Manager List</a></li>
                        </ul>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</div>
