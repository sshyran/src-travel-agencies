using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
            return View();
        }
    }
}
