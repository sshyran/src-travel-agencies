<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CMS_MasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="onlinebus.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    NewsManagement</asp:Content>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetNews();
        }
        if (Request.QueryString["del"] != null)
        {
            if (Session["Role"].ToString() == "N" || Session["Role"].ToString() == "R")
            {
                ResultDelete.Text = "You can't delete because you no permission!";
            }
            else
            {
                string id = Request.QueryString["del"].ToString();
                RepositoryOBTRS data = new RepositoryOBTRS();
                data.DeleteNews(id);
                Response.Redirect("/CMS/NewsManagement");
            }
        }
    }

    Int16 cnt = 1;
    public void count()
    {
        Response.Write(cnt);
        cnt++;
    }

    private void GetNews()
    {
        db_OBTRSDataContext db = new db_OBTRSDataContext();
        GridView1.DataSource = db.sp_SearchNews(ViewData["Data"].ToString());
        GridView1.DataBind();
    }
    
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        News Management</h2>
    <table style="float: left; margin-top: 5px; margin-bottom: 10px">
        <tr>
            <td>
                &nbsp;Title:
            </td>
            <td>
                <%= Html.TextBox("TitleSearch", "", new { @class = "TextboxSearch", MaxLength = "50" })%>
            </td>
            <td>
                <div class="button">
                    <input type="submit" id="search" value="Search" /></div>                
            </td>
            <td>
                <asp:Label ID="ResultDelete" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>
    <div style="width: 100%; float: left; margin-bottom: 5px; margin-top: 5px">
        <a href="/CMS/AddService">Add new News</a>
    </div>
    <div style="width: 100%; float: left">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="3">
            <RowStyle ForeColor="#000066" />
            <Columns>
                <asp:TemplateField HeaderText="No">
                    <ItemTemplate>
                        <% count(); %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <a href="javascript:DeleteNews('<%# Eval("News_ID")%>','' )">
                            <img alt="" src="../../Content/Navigator/48px-Crystal_Clear_action_button_cancel.jpg"
                                style="width: 18px; height: 18px" title="Xóa" />
                        </a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:HyperLink NavigateUrl='<%# "~/CMS/EditNews/" + Eval("News_ID") %>' ID="HyperLink1"
                            runat="server">
                        <img alt="" src="../../Content/Navigator/48px-Crystal_Clear_action_configure.jpg"
                            style="width: 18px; height: 18px" title="Sửa" />
                        </asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("News_Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Release">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("News_Release", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of Edit">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("News_Edit", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Number of View">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("News_ReadCount") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Active">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("News_Active") %>'
                            Enabled='false' />
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

    <script type="text/javascript">
        function DeleteNews(menuid, title) {
            if (confirm("System going to delete this News \n" + title + " \n Are you sure?")) {
                document.location = "?del=" + menuid;
            }
        }
    </script>

</asp:Content>
