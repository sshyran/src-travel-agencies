using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace onlinebus.Models
{
    public class RepositoryOBTRS
    {
        db_OBTRSDataContext db_OBTRS;

        public RepositoryOBTRS() {
            db_OBTRS = new db_OBTRSDataContext();
        }

        //Kiem tra phan quyen Role
        public String CheckRole(Object id) {
            List<string> role = (from tbl in db_OBTRS.tbl_Roles
                                where tbl.Role_ID.Equals(id)
                                select tbl.Role_Alias).ToList();
            return role[0];
        }

        //Kiem tra Login
        public List<tbl_Administrator> Login(string email, string password) {

            List<tbl_Administrator> tblAdmin;
            try
            {
                tblAdmin = (from tbl in db_OBTRS.tbl_Administrators
                            where tbl.Admin_Email == email &&
                                  tbl.Admin_Password == password
                            select tbl).ToList();
            }
            catch (Exception)
            {
                tblAdmin = null;
            }
            
            return tblAdmin;
        }

        //Kiem tra Login nguoi dung
        public List<tbl_AccountCustomer> LoginUser(string email, string password)
        {
            List<tbl_AccountCustomer> tblUser;
            try
            {
                tblUser = (from tbl in db_OBTRS.tbl_AccountCustomers
                            where tbl.AccountCustomer_Email == email &&
                                  tbl.AccountCustomer_Password == password
                            select tbl).ToList();
            }
            catch (Exception)
            {
                tblUser = null;
            }

            return tblUser;
        }

        //Lay thong tin About Us
        public string GetAboutUs()
        {
            List<string> getPolicy;
            try
            {
                getPolicy = (from tbl in db_OBTRS.tbl_CompanyInfos
                             where tbl.id == 1
                             select tbl.AboutUs).ToList();
                return getPolicy[0];
            }
            catch (Exception)
            {
                return "";
            }
        }

        //Lay thong tin Contact Us
        public string GetContactUs()
        {
            List<string> getPolicy;
            try
            {
                getPolicy = (from tbl in db_OBTRS.tbl_CompanyInfos
                             where tbl.id == 1
                             select tbl.ContactUs).ToList();
                return getPolicy[0];
            }
            catch (Exception)
            {
                return "";
            }
        }

        //Lay thong tin Term and Condition
        public string GetTermCondition()
        {
            List<string> getPolicy;
            try
            {
                getPolicy = (from tbl in db_OBTRS.tbl_CompanyInfos
                             where tbl.id == 1
                             select tbl.TermAndCondition).ToList();
                return getPolicy[0];
            }
            catch (Exception)
            {
                return "";
            }
        }

        //Lay thong tin Policy
        public string GetPrivacyPolicy() {
            List<string> getPolicy;
            try
            {
                getPolicy = (from tbl in db_OBTRS.tbl_CompanyInfos
                             where tbl.id == 1
                             select tbl.PrivacyPolicy).ToList();
                return getPolicy[0];
            }
            catch (Exception)
            {                
                return "";
            }            
        }

        //Cap nhat thong tin About Us
        public string UpdateAboutUs(string aboutus)
        {
            try
            {
                tbl_CompanyInfo infopolicy = db_OBTRS.tbl_CompanyInfos.Single(udt => udt.id == 1);
                infopolicy.AboutUs = aboutus;
                db_OBTRS.SubmitChanges();
                return "Update Successful!";
            }
            catch (Exception)
            {
                return "Update Unsuccessful!";
            }
        }

        //Cap nhat thong tin Contact Us
        public string UpdateContactUs(string contact)
        {
            try
            {
                tbl_CompanyInfo infopolicy = db_OBTRS.tbl_CompanyInfos.Single(udt => udt.id == 1);
                infopolicy.ContactUs = contact;
                db_OBTRS.SubmitChanges();
                return "Update Successful!";
            }
            catch (Exception)
            {
                return "Update Unsuccessful!";
            }
        }

        //Cap nhat thong tin Term and Condition
        public string UpdateTermCondititon(string term)
        {
            try
            {
                tbl_CompanyInfo infopolicy = db_OBTRS.tbl_CompanyInfos.Single(udt => udt.id == 1);
                infopolicy.TermAndCondition = term;
                db_OBTRS.SubmitChanges();
                return "Update Successful!";
            }
            catch (Exception)
            {
                return "Update Unsuccessful!";
            }
        }

        //Cap nhat thong tin Policy
        public string UpdatePrivacyPolicy(string policy) {
            try
            {
                tbl_CompanyInfo infopolicy = db_OBTRS.tbl_CompanyInfos.Single(udt => udt.id == 1);
                infopolicy.PrivacyPolicy = policy;
                db_OBTRS.SubmitChanges();
                return "Update Successful!";
            }
            catch (Exception)
            {
                return "Update Unsuccessful!";
            }            
        }

        //Lay tin tuc
        public List<tbl_New> GetNews(int max)
        {
            List<tbl_New> news;
            if (max == 0)
            {
                news = (from tbl in db_OBTRS.tbl_News
                                      where tbl.News_Active == true
                                      orderby tbl.News_Edit descending
                                      select tbl).ToList();
            }
            else { 
                news = (from tbl in db_OBTRS.tbl_News
                            where tbl.News_Active == true
                            orderby tbl.News_Edit descending
                            select tbl).Skip(0).Take(max).ToList();
            }            
            return news;
        }

        //Lay danh muc tin theo ID
        public List<tbl_New> GetNewsListByID(Guid id)
        {
            List<tbl_New> content = (from tbl in db_OBTRS.tbl_News
                                     where tbl.News_ID.Equals((Object)id)
                                     select tbl).ToList();
            return content;
        }

        //Xoa tin
        public void DeleteNews(string id)
        {
            var delItem = from dt in db_OBTRS.tbl_News
                          where dt.News_ID.Equals((Object)id)
                          select dt;

            db_OBTRS.tbl_News.DeleteAllOnSubmit(delItem);
            db_OBTRS.SubmitChanges();
        }

        //Them tin tuc moi
        public void AddNews(String tittle, String content, Boolean active)
        {
            tbl_New news = new tbl_New();
            news.News_Title = tittle;
            news.News_Content = content;            
            news.News_Active = active;
            //Thong tin khac
            news.News_Release = DateTime.Now;
            news.News_Edit = DateTime.Now;
            news.News_ID = Guid.NewGuid();
            db_OBTRS.tbl_News.InsertOnSubmit(news);
            db_OBTRS.SubmitChanges();
        }
        //-------------------

        //Update News
        public void UpdateNews(string id, string title, string content, Boolean active)
        {
            tbl_New news = db_OBTRS.tbl_News.Single(udt => udt.News_ID.Equals((Object)id));
            news.News_Title = title;
            news.News_Content = content;           
            news.News_Active = active;
            news.News_Edit = DateTime.Now;
            db_OBTRS.SubmitChanges();
        }

        //Lay thong tin dich vu moi nhat
        public List<tbl_Service> GetServices(int max)
        {
            List<tbl_Service> services;
            if (max != 0)
            {
                services = (from tbl in db_OBTRS.tbl_Services
                            where tbl.Services_Active == true
                            orderby tbl.Services_Edit descending
                            select tbl).Skip(0).Take(max).ToList();
            }
            else {
                services = (from tbl in db_OBTRS.tbl_Services
                            where tbl.Services_Active == true
                            orderby tbl.Services_Edit descending
                            select tbl).ToList();
            }            
            return services;
        }

        /// <summary>
        /// Lay chi tiet thong tin dich vu theo ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<tbl_Service> GetServiceByID(Guid id)
        {
            List<tbl_Service> content = (from tbl in db_OBTRS.tbl_Services
                                     where tbl.Services_ID.Equals((Object)id)
                                     select tbl).ToList();
            return content;
        }

        //Xoa dich vu
        public void DeleteService(string id)
        {
            var delItem = from dt in db_OBTRS.tbl_Services
                          where dt.Services_ID.Equals((Object)id)
                          select dt;

            db_OBTRS.tbl_Services.DeleteAllOnSubmit(delItem);
            db_OBTRS.SubmitChanges();
        }

        //Update Service
        public void UpdateService(string id, string title, string content, Boolean active)
        {
            tbl_Service service = db_OBTRS.tbl_Services.Single(udt => udt.Services_ID.Equals((Object)id));
            service.Services_Title = title;
            service.Services_Content = content;
            service.Services_Active = active;
            service.Services_Edit = DateTime.Now;
            db_OBTRS.SubmitChanges();
        }

        //Them tin dich vu moi
        public void AddService(String tittle, String content, Boolean active)
        {
            tbl_Service service = new tbl_Service();
            service.Services_Title = tittle;
            service.Services_Content = content;
            service.Services_Active = active;
            //Thong tin khac
            service.Services_Release = DateTime.Now;
            service.Services_Edit = DateTime.Now;
            service.Services_ID = Guid.NewGuid();
            db_OBTRS.tbl_Services.InsertOnSubmit(service);
            db_OBTRS.SubmitChanges();
        }
        //-------------------

        //Lay thong tin tu bang Role
        public List<tbl_Role> GetRole() {
            List<tbl_Role> role = (from tbl in db_OBTRS.tbl_Roles
                                   select tbl).ToList();
            return role;
        }

        //Them Admin moi
        public String AddNewAdmin(Object Roleid,String name, DateTime dob, String password, String address, String phone, String email, String desc, Boolean active)
        {
            String result = "";
            try
            {
                tbl_Administrator admin = new tbl_Administrator();
                    admin.Admin_ID = Guid.NewGuid();
                    admin.Admin_RoleID = new Guid(Roleid.ToString());
                    admin.Admin_Name = name;
                    admin.Admin_Birthday = dob;
                    admin.Admin_Password = password;
                    admin.Admin_CreateDate = DateTime.Now;
                    admin.Admin_Address = address;
                    admin.Admin_Phone = phone;
                    admin.Admin_Email = email;
                    admin.Admin_Comment = desc;
                    admin.Admin_Active = active; 
                db_OBTRS.tbl_Administrators.InsertOnSubmit(admin);
                db_OBTRS.SubmitChanges();                
            }
            catch (System.Data.SqlClient.SqlException){
                result = "Maybe,parameters you input invalid or duplicate this your email is existed in system, please input other email.";
            }
            catch (Exception)
            {
                result = "If this error duplicate one more, that mean system are maintenance, please contact to administrator.";                
            }
            return result;
        }
        //-------------------

        //Xoa tin
        public void DeleteAdmin(string id)
        {
            var delItem = from dt in db_OBTRS.tbl_Administrators
                          where dt.Admin_ID.Equals((Object)id)
                          select dt;

            db_OBTRS.tbl_Administrators.DeleteAllOnSubmit(delItem);
            db_OBTRS.SubmitChanges();
        }

        //Sua chua thong tin Admin
        public String UpdateAdmin(Object AdminID, Object Roleid, String name, DateTime dob, String password, String address, String phone, String email, String desc, Boolean active)
        {            
            String result = "";
            try
            {
                tbl_Administrator admin = db_OBTRS.tbl_Administrators.Single(udt => udt.Admin_ID.Equals((Object)AdminID));                
                    admin.Admin_RoleID = new Guid(Roleid.ToString());
                    admin.Admin_Name = name;
                    admin.Admin_Birthday = dob;
                    admin.Admin_Password = password;
                    admin.Admin_CreateDate = DateTime.Now;
                    admin.Admin_Address = address;
                    admin.Admin_Phone = phone;
                    admin.Admin_Email = email;
                    admin.Admin_Comment = desc;
                    admin.Admin_Active = active;                
                db_OBTRS.SubmitChanges();
            }
            catch (System.Data.SqlClient.SqlException)
            {
                result = "Maybe,parameters you input invalid or duplicate this your email is existed in system, please input other email.";
            }
            catch (Exception)
            {
                result = "If this error duplicate one more, that mean system are maintenance, please contact to administrator.";
            }
            return result;
        }

        //Lay toan bo thong tin Admin theo ID
        public List<tbl_Administrator> GetAdminByID(String id) {
            List<tbl_Administrator> admin = (from tbl in db_OBTRS.tbl_Administrators
                                             where tbl.Admin_ID.Equals((Object)id)
                                             select tbl).ToList();
            return admin;
        }

    }
}
