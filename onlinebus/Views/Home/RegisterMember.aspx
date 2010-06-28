<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="onlinebus.Models" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(ViewData.Model);
        onlinebus.Models.NorthwindDataContext dbNW = new onlinebus.Models.NorthwindDataContext();
        List<Category> cat = (from tbl in dbNW.Categories
                              where tbl.CategoryID == 1
                              select tbl).ToList();
        byte[] img = (byte[])cat[0].Picture.ToArray();
        //Response.Buffer = true;
        //Response.Clear();
        //Response.ContentType = "image/jpeg";
        //for (int i = 0; i < img.Length; i++)
        //{
        //    Response.Write(img[i]);
        //}
        //Response.BufferOutput = true;
        //Response.OutputStream.BeginWrite(img,0,img.Length,null,null);
        //Response.
        //System.IO.MemoryStream str = new System.IO.MemoryStream();
        //str.Write(img, 0, img.Length);
        //Response.BinaryWrite(img);
        //Response.End(); 
        
        
        //var img = (from tbl in dbNW.Categories
        //          //where tbl.CategoryID == 1
        //          select System.Drawing.Image.FromStream( new System.IO.MemoryStream(tbl.Picture.ToArray()))).ToArray();

        //foreach (Image pic in img)
        //{
        //    Image1.Controls.Add(pic);
        //}
        
        
        
        //byte[] img = (byte[])ViewData.Model;
        //byte[] img;
        //for (int i = 0; i < cat[0].Picture.Length; i++)
        //{
        //    img[i] = cat[0].Picture.;
        //}
        //byte[] img = (byte[])cat[0].Picture.ToArray();
        //Response.ContentType = "image/jpeg";
        //System.IO.MemoryStream str = new System.IO.MemoryStream();
        //str.Write(img, 0, img.Length);        
        //Response.BinaryWrite(img);
        
        //-----------------------
        //Response.Buffer = true;
        //Response.Clear();
        //Response.ContentType = "image/jpeg";
        //System.IO.MemoryStream str = new System.IO.MemoryStream();
        //str.Write(img, 0, img.Length);
        //long length = str.Length;        
        //Response.BinaryWrite(Image);
        //Response.Flush();
        //Response.Close();       
        
        //-----------------------
        
        //System.IO.MemoryStream str = new System.IO.MemoryStream();
        //str.Write(img, 0, img.Length);
        //System.Drawing.Bitmap bit = new System.Drawing.Bitmap(str);
        //Response.ContentType = "image/jpeg";
        //bit.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>RegisterMember</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
    <asp:Image ID="Image1" runat="server" />
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="CategoryID" DataSourceID="LinqDataSource1">
        <Columns>
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" 
                SortExpression="CategoryName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:ImageField DataAlternateTextFormatString="Picture" HeaderText="Picture" 
                SortExpression="Picture" >
            </asp:ImageField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="onlinebus.Models.NorthwindDataContext" TableName="Categories">
    </asp:LinqDataSource>
    </form>
</body>
</html>
