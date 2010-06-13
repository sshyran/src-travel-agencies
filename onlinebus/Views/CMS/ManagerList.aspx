<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CMS_MasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="onlinebus.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ManagerList
</asp:Content>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        grdAdmin.DataSource = ViewData.Model;
        grdAdmin.DataBind();
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
                data.DeleteAdmin(id);
                Response.Redirect("/CMS/ManagerList");
            }
        }
    }
    Int16 cnt = 1;
    public void count()
    {
        Response.Write(cnt);
        cnt++;
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Manager List</h2>
    <asp:Label ID="ResultDelete" runat="server" ForeColor="Red"></asp:Label>
    <asp:GridView ID="grdAdmin" runat="server" AutoGenerateColumns="False" Width="100%"
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
        CellPadding="3">
        <RowStyle ForeColor="#000066" />
        <Columns>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <a href="javascript:DeleteAdmin('<%# Eval("Admin_ID")%>','' )">
                        <img alt="" src="../../Content/Navigator/48px-Crystal_Clear_action_button_cancel.jpg"
                            style="width: 18px; height: 18px" title="Xóa" />
                    </a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:HyperLink NavigateUrl='<%# "~/CMS/EditAdmin?adminID=" + Eval("Admin_ID") %>'
                        ID="HyperLink1" runat="server">
                        <img alt="" src="../../Content/Navigator/48px-Crystal_Clear_action_configure.jpg"
                            style="width: 18px; height: 18px" title="Sửa" />
                    </asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No">
                <ItemTemplate>
                    <asp:Label ID="lblAdminID" Visible="false" runat="server" Text='<%# Eval("Admin_ID")%>'></asp:Label>
                    <% count(); %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fullname">
                <ItemTemplate>
                    <asp:Label ID="lblAdminName" runat="server" Text='<%# Eval("Admin_Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date of Birth" ItemStyle-Width="150px" ItemStyle-VerticalAlign="Top">
                <ItemTemplate>
                    <asp:Label ID="lblAdminBirthday" runat="server" Enabled="false" Text='<%# Eval("Admin_Birthday", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle VerticalAlign="Top" Width="150px"></ItemStyle>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label ID="lblAdminPassword" runat="server" Text='<%# Eval("Role_Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <asp:Label ID="lblAdminAddress" runat="server" Text='<%# Eval("Admin_Address") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="lblAdminEmail" runat="server" Text='<%# Eval("Admin_Email") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activation">
                <ItemTemplate>
                    <asp:CheckBox ID="chbAdminActive" Enabled="false" runat="server" Checked='<%# Eval("Admin_Active") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>

    <script type="text/javascript">
        function DeleteAdmin(menuid, title) {
            if (confirm("System going to delete this person in list \n" + title + " \n Are you sure?")) {
                document.location = "?del=" + menuid;
            }
        }
    </script>

</asp:Content>
