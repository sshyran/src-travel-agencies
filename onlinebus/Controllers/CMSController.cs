using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using onlinebus.Models.Validation;
using onlinebus.Models;

namespace onlinebus.Controllers
{
    [HandleError]
    public class CMSController : Controller
    {
        //
        // GET: /CMS/        
        public ActionResult Index() {
            ValidateLogin valLogin = new ValidateLogin();
            ViewData["Result"] = "";
            return View(valLogin);
        }

        //Trang dang nhap CMS
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(ValidateLogin login,FormCollection form)
        {
            ViewData["Result"] = "";
            if (ModelState.IsValid)
            {                
                RepositoryOBTRS mOBTRS = new RepositoryOBTRS();
                List<tbl_Administrator> LogName = mOBTRS.Login(form.Get("email").Trim(), form.Get("password").Trim());
                if (LogName == null)
                {
                    //Khong the ket noi Database
                    ViewData["Result"] = "Can't connect to database server, please try again later!";
                    return View(login);
                }else if (LogName.Count == 1)
                {
                    if (LogName[0].Admin_Active != false)
                    {
                        if (form.Get("Remember").ToString().ToLower() != "false")
                        {
                            //Luu vao Cookie
                            //HttpCookie cookie = HttpContext.Response.Cookies.Get("cmsOBTRS");
                            HttpCookie cookie = new HttpCookie("cmsOBTRS");
                            cookie.Values["Username"] = LogName[0].Admin_Name;
                            cookie.Values["ID"] = LogName[0].Admin_ID.ToString();
                            cookie.Expires = DateTime.Now.AddDays(+14);
                            HttpContext.Response.Cookies.Set(cookie);
                        }                        

                        //Luu vào Session
                        Session["LogedName"] = LogName[0].Admin_Name;
                        Session["Admin_ID"] = LogName[0].Admin_ID;

                        //Lay Alias Role cua Admin dang nhap he thong
                        Session["Role"] = mOBTRS.CheckRole(LogName[0].Admin_RoleID);
                        string a = Session["Role"].ToString();

                        //Dang nhap thanh cong
                        if (!Response.IsRequestBeingRedirected) { 
                            Response.Redirect("/CMS/WelcomeAptech");
                        }                      
                    }
                    else
                    {
                        //Bi cam truy cap
                        ViewData["Result"] = "Access Denied!";
                        return View(login);
                    }
                }
                else
                {
                    //Login sai mat khau va ten dang nhap
                    ViewData["Result"] = "Username or password invalid.Login failure!";
                    return View(login);
                } 
            }  
          
            //Login unsuccessful            
            return View(login);
        }

        public ActionResult WelcomeAptech() {

            return View();
        }

        //About Us
        [ValidateInput(false)]
        public ActionResult AboutUs(FormCollection form)
        {            
            if (Session["Role"].ToString() == "N")
            {
                Response.Write("Access denied!");
                return null;
            }
            else
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                ViewData["Data"] = db.GetAboutUs();
                if (form.Get("RichTextEditor") != null)
                {
                    if (Session["Role"].ToString() == "R")
                    {
                        ViewData["Result"] = "Your role is readonly";
                    }
                    else { 
                        ViewData["Result"] = db.UpdateAboutUs(form.Get("RichTextEditor"));
                        ViewData["Data"] = db.GetAboutUs();
                    } 
                    return View();
                }
                else
                {
                    ViewData["Result"] = "";
                }
                return View();
            }
        }

        //Contact Us
        [ValidateInput(false)]
        public ActionResult ContactUs(FormCollection form)
        {
            if (Session["Role"].ToString() == "N")
            {
                Response.Write("Access denied!");
                return null;
            }
            else
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                ViewData["Data"] = db.GetContactUs();
                if (form.Get("RichTextEditor") != null)
                {
                    if (Session["Role"].ToString() == "R")
                    {
                        ViewData["Result"] = "Your role is readonly";
                    }
                    else
                    {
                        ViewData["Result"] = db.UpdateContactUs(form.Get("RichTextEditor"));
                        ViewData["Data"] = db.GetContactUs();
                    }
                    return View();
                }
                else
                {
                    ViewData["Result"] = "";
                }
                return View();
            }
        }

        //Term and Condition
        [ValidateInput(false)]
        public ActionResult TermCondition(FormCollection form)
        {
            if (Session["Role"].ToString() == "N")
            {
                Response.Write("Access denied!");
                return null;
            }
            else
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                ViewData["Data"] = db.GetTermCondition();
                if (form.Get("RichTextEditor") != null)
                {
                    if (Session["Role"].ToString() == "R")
                    {
                        ViewData["Result"] = "Your role is readonly";
                    }
                    else
                    {
                        ViewData["Result"] = db.UpdateTermCondititon(form.Get("RichTextEditor"));
                        ViewData["Data"] = db.GetTermCondition();
                    }
                    return View();
                }
                else
                {
                    ViewData["Result"] = "";
                }
                return View();
            }
        }

        //Privacy Policy
        [ValidateInput(false)]
        public ActionResult PrivacyPolicy(FormCollection form)
        {
            if (Session["Role"].ToString() == "N")
            {
                Response.Write("Access denied!");
                return null;
            }
            else
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                ViewData["Data"] = db.GetPrivacyPolicy();
                if (form.Get("RichTextEditor") != null)
                {
                    if (Session["Role"].ToString() == "R")
                    {
                        ViewData["Result"] = "Your role is readonly";
                    }
                    else
                    {
                        ViewData["Result"] = db.UpdatePrivacyPolicy(form.Get("RichTextEditor"));
                        ViewData["Data"] = db.GetPrivacyPolicy();
                    }
                    return View();
                }
                else
                {
                    ViewData["Result"] = "";
                }
                return View();
            }
        }

        //News Management
        //|-------------------
        public ActionResult NewsManagement()
        {            
            ViewData["Data"] = "%%";
            return View();
        }

        //News Management with params
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult NewsManagement(FormCollection form) {                      
            ViewData["Data"] = "%" + form.Get("TitleSearch") + "%";
            return View();
        }
        //|___________________

        //Edit News
        [ValidateInput(false)]
        [HttpGet]
        public ActionResult EditNews(Guid id)
        {
            if (Session["Role"].ToString() == "N" || Session["Role"].ToString() == "R")
            {
                Response.Write("Access denied!");
                return null;
            }
            else
            {
                RepositoryOBTRS repData = new RepositoryOBTRS();
                ViewData["NewsID"] = id;
                List<tbl_New> news = repData.GetNewsListByID(id);
                ViewData["Title"] = news[0].News_Title;
                ViewData["Data"] = news[0].News_Content;
                ViewData["Active"] = news[0].News_Active;
                return View();
            }
        }

        //Edit News
        [ValidateInput(false)]
        [HttpPost]        
        public ActionResult EditNews(Guid id,FormCollection form) {
            RepositoryOBTRS db = new RepositoryOBTRS();
            Boolean active = false;
            if (form.Get("Active") != "false")
            {
                active = true;
            }
            db.UpdateNews(id.ToString(), form.Get("Title"), form.Get("RichTextEditor"), active);            
            return Redirect("/CMS/EditNews/"+id);
        }

        //Add News        
        public ActionResult AddNews()
        {
            if (Session["Role"].ToString() == "N" || Session["Role"].ToString() == "R")
            {
                Response.Write("Access denied!");
                return null;
            }
            else
            {
                return View();
            }
        }

        //Add News
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddNews(FormCollection form) {
            RepositoryOBTRS db = new RepositoryOBTRS();
            Boolean active = false;
            if (form.Get("Active") != "false")
            {
                active = true;
            }
            db.AddNews(form.Get("Title"), form.Get("RichTextEditor"), active);
            return Redirect("/CMS/NewsManagement/");
        }

        //Services Management 
        //|-------------------       
        public ActionResult ServicesManagement()
        {            
            ViewData["Data"] = "%%";
            return View();            
        }
       
        //Services Management with params
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult ServicesManagement(FormCollection form)
        {
            ViewData["Data"] = "%" + form.Get("TitleSearch") + "%";
            return View();
        }
        //|___________________

        //Edit News
        [ValidateInput(false)]
        [HttpGet]
        public ActionResult EditService(Guid id)
        {
            if (Session["Role"].ToString() == "N" || Session["Role"].ToString() == "R")
            {
                Response.Write("Access denied!");
                return null;
            }
            else
            {
                RepositoryOBTRS repData = new RepositoryOBTRS();
                ViewData["NewsID"] = id;
                List<tbl_Service> service = repData.GetServiceByID(id);
                ViewData["Title"] = service[0].Services_Title;
                ViewData["Data"] = service[0].Services_Content;
                ViewData["Active"] = service[0].Services_Active;
                return View();
            }
        }

        //Edit News
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult EditService(Guid id, FormCollection form)
        {
            RepositoryOBTRS db = new RepositoryOBTRS();
            Boolean active = false;
            if (form.Get("Active") != "false")
            {
                active = true;
            }
            db.UpdateService(id.ToString(), form.Get("Title"), form.Get("RichTextEditor"), active);
            return Redirect("/CMS/EditService/" + id);
        }

        //Add Service        
        public ActionResult AddService()
        {
            if (Session["Role"].ToString() == "N" || Session["Role"].ToString() == "R")
            {
                Response.Write("Access denied!");
                return null;
            }
            else
            {
                return View();
            }
        }

        //Add Service
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddService(FormCollection form)
        {
            RepositoryOBTRS db = new RepositoryOBTRS();
            Boolean active = false;
            if (form.Get("Active") != "false")
            {
                active = true;
            }
            db.AddService(form.Get("Title"), form.Get("RichTextEditor"), active);
            return Redirect("/CMS/ServicesManagement/");
        }

        //Danh sach ValidateAdmin
        public ActionResult ManagerList() {
            db_OBTRSDataContext db = new db_OBTRSDataContext();
            var tbl = db.sp_GetAdmin();
            return View(tbl);
        }

        //Ham lay danh sach Role
        private List<SelectListItem> GetRoleForView() {
            List<SelectListItem> items = new List<SelectListItem>();
            RepositoryOBTRS db = new RepositoryOBTRS();
            List<tbl_Role> role = db.GetRole();
            for (int i = 0; i < role.Count; i++)
            {
                items.Add(new SelectListItem { Text = role[i].Role_Name, Value = role[i].Role_ID.ToString() });
            }
            return items;
        }

        //Them moi Adminnistrator
        public ActionResult AddNewAdmin() 
        {
            try
            {            
                if (Session["Role"].ToString() != "F")
                {
                    Response.Write("Access denied!");
                    return null;
                }
                else
                {
                    ViewData["Role"] = GetRoleForView();
                    return View();
                }
            }
            catch (Exception)
            {
                return Redirect("/CMS/");
            }
        }

        //Them moi Adminnistrator
        [HttpPost]
        public ActionResult AddNewAdmin(ValidateAdmin vAdmin, FormCollection form) {
            ViewData["Role"] = GetRoleForView();            

            if (ModelState.IsValid)
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                Boolean active = true;
                if (form.Get("Active") == "false")
                {
                    active = false;
                }
                String result = db.AddNewAdmin(
                                    form.Get("Role"),
                                    form.Get("AdminName"),
                                    DateTime.Parse(form.Get("DateOfBirth")),
                                    form.Get("Password"),
                                    form.Get("Address"),
                                    form.Get("Phone"),
                                    form.Get("Email"),                                    
                                    form.Get("Description"),
                                    active
                                    );
                if (result == "")
                {
                    //Neu them admin thanh cong                    
                    return Redirect("/CMS/ManagerList");
                }
                else {
                    //Neu gap truc trac ko the them Admin
                    ViewData["Error"] = result;
                    return View(vAdmin);
                } 
            }

            //Neu gia tri nhap vao ko dung
            return View(vAdmin);
        }


        //-----------------
        //Sua chua thong tin Adminnistrator
        [HttpGet]
        public ActionResult EditAdmin()
        {
            try
            {                        
                if (Convert.ToString(Session["Role"]) != "F")
                {
                    Response.Write("Access denied!");
                    return null;
                }
                else {
                    ViewData["Role"] = GetRoleForView();
                    return View();
                }
            }
            catch (Exception)
            {
                return Redirect("/CMS/");
            }                      
        }

        //Sua chua thong tin Adminnistrator
        [HttpPost]
        //[HttpGet]
        public ActionResult EditAdmin(String adminID, ValidateAdmin vAdmin, FormCollection form)
        {
            try
            {            
                ViewData["Role"] = GetRoleForView();

                if (ModelState.IsValid)
                {
                    RepositoryOBTRS db = new RepositoryOBTRS();
                    Boolean active = true;
                    if (form.Get("Active") == "false")
                    {
                        active = false;
                    }
                    String result = db.UpdateAdmin(
                                        adminID,
                                        form.Get("Role"),
                                        form.Get("AdminName"),
                                        DateTime.Parse(form.Get("DateOfBirth")),
                                        form.Get("Password"),
                                        form.Get("Address"),
                                        form.Get("Phone"),
                                        form.Get("Email"),
                                        form.Get("Description"),
                                        active
                                        );
                    if (result == "")
                    {
                        //Neu cap nhat admin thanh cong                    
                        return Redirect("/CMS/ManagerList");
                    }
                    else
                    {
                        //Neu gap truc trac ko the cap nhat Admin
                        ViewData["Error"] = result;
                        return View(vAdmin);
                    }
                }
            }
            catch (Exception)
            {
                return Redirect("/CMS/");
            }
            //Neu gia tri nhap vao ko dung
            return View(vAdmin);
        }

        //Ve so do xe Bus 12 seats
        [ValidateInput(false)]
        public ActionResult BusDiagram_12(FormCollection form)
        {
            try
            {
                if (Session["Role"].ToString() == "N")
                {
                    Response.Write("Access denied!");
                    return null;
                }
                else
                {
                    RepositoryOBTRS db = new RepositoryOBTRS(); 
                   
                    //----------------- 12 Seats ------------------
                    //Lay du lieu diagram tu Database
                    ViewData["Data"] = db.GetBusDiagram(1);

                    //Cap nhat du lieu vao Database
                    if (form.Get("RichTextEditor") != null)
                    {
                        if (Session["Role"].ToString() == "R")
                        {
                            ViewData["Result"] = "Your role is readonly";
                        }
                        else
                        {
                            ViewData["Result"] = db.UpdateBusDiagram(form.Get("RichTextEditor"), 1);
                            //Lay du lieu diagram tu Database
                            ViewData["Data"] = db.GetBusDiagram(1);
                        }
                        return View();
                    }
                    else
                    {
                        ViewData["Result"] = "";
                    }
                    //----------------------------------------------

                    return View();
                }
            }
            catch (Exception)
            {                
                //Chuyen ve trang dang nhap
                return Redirect("/CMS/WelcomeAptech?logout=true");
            }
        }

        //Ve so do xe Bus 24 seats
        [ValidateInput(false)]
        public ActionResult BusDiagram_24(FormCollection form) 
        {
            try
            {
                if (Session["Role"].ToString() == "N")
                {
                    Response.Write("Access denied!");
                    return null;
                }
                else
                {
                    RepositoryOBTRS db = new RepositoryOBTRS();

                    //----------------- 24 Seats ------------------
                    //Lay du lieu diagram tu Database
                    ViewData["Data"] = db.GetBusDiagram(2);

                    //Cap nhat du lieu vao Database
                    if (form.Get("RichTextEditor") != null)
                    {
                        if (Session["Role"].ToString() == "R")
                        {
                            ViewData["Result"] = "Your role is readonly";
                        }
                        else
                        {
                            ViewData["Result"] = db.UpdateBusDiagram(form.Get("RichTextEditor"), 2);
                            //Lay du lieu diagram tu Database
                            ViewData["Data"] = db.GetBusDiagram(2);
                        }
                        return View();
                    }
                    else
                    {
                        ViewData["Result"] = "";
                    }
                    //----------------------------------------------

                    return View();
                }
            }
            catch (Exception)
            {
                //Chuyen ve trang dang nhap
                return Redirect("/CMS/WelcomeAptech?logout=true");
            }        
        }

        //Ve so do xe Bus 24 seats
        [ValidateInput(false)]
        public ActionResult BusDiagram_45(FormCollection form)
        {
            try
            {
                if (Session["Role"].ToString() == "N")
                {
                    Response.Write("Access denied!");
                    return null;
                }
                else
                {
                    RepositoryOBTRS db = new RepositoryOBTRS();

                    //----------------- 45 Seats ------------------
                    //Lay du lieu diagram tu Database
                    ViewData["Data"] = db.GetBusDiagram(3);

                    //Cap nhat du lieu vao Database
                    if (form.Get("RichTextEditor") != null)
                    {
                        if (Session["Role"].ToString() == "R")
                        {
                            ViewData["Result"] = "Your role is readonly";
                        }
                        else
                        {
                            ViewData["Result"] = db.UpdateBusDiagram(form.Get("RichTextEditor"), 3);
                            //Lay du lieu diagram tu Database
                            ViewData["Data"] = db.GetBusDiagram(3);
                        }
                        return View();
                    }
                    else
                    {
                        ViewData["Result"] = "";
                    }
                    //----------------------------------------------

                    return View();
                }
            }
            catch (Exception)
            {
                //Chuyen ve trang dang nhap
                return Redirect("/CMS/WelcomeAptech?logout=true");
            }
        }


        //
        //--------------------------------------------------------------------------------------------
    }
}
