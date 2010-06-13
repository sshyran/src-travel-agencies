using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using onlinebus.Models;

namespace onlinebus.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    
    public class HomeController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            //ViewData["Message"] = "Welcome to Online Bus Ticket Reservation System!";
            
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult SearchDetail()
        {
            return View();
        }

        /// <summary>
        /// About Us
        /// </summary>
        /// <returns></returns>
        public ActionResult AboutUs() {
            RepositoryOBTRS db = new RepositoryOBTRS();
            ViewData["Data"] = db.GetAboutUs();
            return View();
        }

        /// <summary>
        /// Contact Us
        /// </summary>
        /// <returns></returns>
        public ActionResult ContactUs()
        {
            RepositoryOBTRS db = new RepositoryOBTRS();
            ViewData["Data"] = db.GetContactUs();
            return View();
        }

        /// <summary>
        /// Term & Condition
        /// </summary>
        /// <returns></returns>
        public ActionResult TermCondition()
        {
            RepositoryOBTRS db = new RepositoryOBTRS();
            ViewData["Data"] = db.GetTermCondition();
            return View();
        }

        /// <summary>
        /// Privacy Policy
        /// </summary>
        /// <returns></returns>
        public ActionResult PrivacyPolicy()
        {
            RepositoryOBTRS db = new RepositoryOBTRS();
            ViewData["Data"] = db.GetPrivacyPolicy();
            return View();
        }

        /// <summary>
        /// Hien thi chi tiet tin tuc
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult DetailNews(Guid id) {
            if (id != null)
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                List<tbl_New> news = db.GetNewsListByID(id);
                ViewData["Title"] = news[0].News_Title;
                ViewData["Content"] = news[0].News_Content;
            }
            else {
                ViewData["Title"] = "";
                ViewData["Content"] = "";
            }           
            return View();
        }

        /// <summary>
        /// Hien thi tat ca tin co trong CSDL
        /// </summary>
        /// <returns></returns>
        public ActionResult GetAllNewsPage() {
            
            return View();
        }
        
        /// <summary>
        /// Chi tiet dich vu
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult DetailService(Guid id)
        {
            if (id != null)
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                List<tbl_Service> service = db.GetServiceByID(id);
                ViewData["Title"] = service[0].Services_Title;
                ViewData["Content"] = service[0].Services_Content;
            }
            else
            {
                ViewData["Title"] = "";
                ViewData["Content"] = "";
            }
            return View();
        }

        /// <summary>
        /// Hien thi tat ca services co trong CSDL
        /// </summary>
        /// <returns></returns>
        public ActionResult GetAllServicesPage()
        {

            return View();
        }
    }
}
