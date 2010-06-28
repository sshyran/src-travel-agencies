using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using onlinebus.Models;
using System.Collections;

namespace onlinebus.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    
    public class HomeController : Controller
    {
        //Ham lay danh sach cac tinh thanh lam diem di       
        private List<SelectListItem> GetCityDeparture()
        {
            List<SelectListItem> items = new List<SelectListItem>();
            RepositoryOBTRS db = new RepositoryOBTRS();
            List<int> city = db.GetCityStart();            
            for (int i = 0; i < city.Count; i++)
            {
                items.Add(new SelectListItem { Text = db.GetCityName(city[i]), Value = city[i].ToString() });
            }
            return items;
        }

        private List<SelectListItem> GetCityDeparture(int CityDepartureID)
        {
            List<SelectListItem> items = new List<SelectListItem>();
            RepositoryOBTRS db = new RepositoryOBTRS();
            List<int> city = db.GetCityStart();
            for (int i = 0; i < city.Count; i++)
            {
                if (Convert.ToInt32(city[i]) == CityDepartureID)
                {
                    items.Add(new SelectListItem { Text = db.GetCityName(city[i]), Value = city[i].ToString(), Selected = true });
                }
                else { 
                    items.Add(new SelectListItem { Text = db.GetCityName(city[i]), Value = city[i].ToString() });
                }                
            }
            return items;
        }

        //Danh sach cac tinh thanh la diem den
        private List<SelectListItem> GetCityDestination(int StartID)
        {
            List<SelectListItem> items = new List<SelectListItem>();
            RepositoryOBTRS db = new RepositoryOBTRS();
            List<int> city = db.GetCityEnd(StartID);
            for (int i = 0; i < city.Count; i++)
            {
                items.Add(new SelectListItem { Text = db.GetCityName(city[i]), Value = city[i].ToString() });
            }
            return items;
        }

        //Danh sach cac tinh thanh la diem den
        private List<SelectListItem> GetCityDestination(int StartID, int SelectedID)
        {
            List<SelectListItem> items = new List<SelectListItem>();
            RepositoryOBTRS db = new RepositoryOBTRS();
            List<int> city = db.GetCityEnd(StartID);
            for (int i = 0; i < city.Count; i++)
            {
                if (Convert.ToInt32(city[i]) == SelectedID)
                {
                    items.Add(new SelectListItem { Text = db.GetCityName(city[i]), Value = city[i].ToString(), Selected = true });
                }
                else {
                    items.Add(new SelectListItem { Text = db.GetCityName(city[i]), Value = city[i].ToString() });
                }                
            }
            return items;
        }
        
        /// <summary>
        /// Trang chu
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {   
            try
            {
                //Response.Write("DayOfWeek: "+ DateTime.Now.DayOfWeek.ToString());
                            
                //Kiem tra va lay ID cua dia diem khoi hanh
                if (Request.Params["Departure"] != null)
                {
                    int id = Convert.ToInt16(Request.Params["Departure"]);
                    ViewData["CityStart"] = GetCityDeparture(id);
                    ViewData["CityEnd"] = GetCityDestination(id);
                }
                else {
                    ViewData["CityStart"] = GetCityDeparture();
                    ViewData["CityEnd"] = GetCityDestination(1);
                }
                
            }catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
            }

            return View();
        }

        [HttpPost]
        public ActionResult Index(FormCollection form)
        {
            try
            {
                if (form["SearchBuses"] != null)
                {
                    if (form["txtDepartureDate"] == null || form["txtDepartureDate"] == "")
                    {
                        form["txtDepartureDate"] = DateTime.Now.ToShortDateString();
                    }
                    DateTime dt = DateTime.Parse(form["txtDepartureDate"]);
                    String date = dt.ToShortDateString();
                    String depart = dt.DayOfWeek.ToString().Substring(0,2).ToUpper();
                    return Redirect("/Home/SearchDetail?Departure=" + form["CityDeparture"] + "&Destination=" + form["CityDestination"] + "&Depart=" + depart + "&Date=" + date);
                }

                //Kiem tra va lay ID cua dia diem khoi hanh
                if (Request.Params["Departure"] != null)
                {
                    int id = Convert.ToInt16(Request.Params["Departure"]);
                    ViewData["CityStart"] = GetCityDeparture(id);
                    ViewData["CityEnd"] = GetCityDestination(id);
                }
                else
                {
                    ViewData["CityStart"] = GetCityDeparture();
                    ViewData["CityEnd"] = GetCityDestination(1);
                }

            }catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
            }

            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>        
        [HttpPost]
        public ActionResult SearchDetail(FormCollection form)
        {
            try
            {                
                //Kiem tra va lay ID cua dia diem khoi hanh
                if (form["CityDeparture"] != null)
                {
                    //Lay thong tin dia diem di va den truyen cho Title
                    RepositoryOBTRS dbrep = new RepositoryOBTRS();
                    int cityDepart = Convert.ToInt16(form["CityDeparture"]);
                    ViewData["Title_Departure"] = dbrep.GetCityName(cityDepart);
                    int cityDesti = Convert.ToInt16(form["CityDestination"]);
                    ViewData["Title_Destination"] = dbrep.GetCityName(cityDesti);
                    //Ket thuc lay thong tin

                    int id = Convert.ToInt16(form["CityDeparture"]);
                    ViewData["CityStart"] = GetCityDeparture(id);
                    if (form["CityDestination"] != null)
                    {
                        int DestinationID = Convert.ToInt16(form["CityDestination"]);
                        ViewData["CityEnd"] = GetCityDestination(id, DestinationID);
                    }
                    else
                    {
                        ViewData["CityEnd"] = GetCityDestination(id);
                        //ViewData["CityDestination"] = "?";
                    }
                }
                else
                {
                    ViewData["CityStart"] = GetCityDeparture();
                    ViewData["CityEnd"] = GetCityDestination(1);
                }

                if (form["CityDeparture"] != null && form["CityDestination"] != null)
                {
                    db_OBTRSDataContext db = new db_OBTRSDataContext();
                    int Departure = Convert.ToInt32(form["CityDeparture"]);
                    int Destination = Convert.ToInt32(form["CityDestination"]);
                    
                    string Depart = "%%";
                    if (form["txtDepartureDate"] != null && form["txtDepartureDate"] != "")
                    {
                        DateTime dt = DateTime.Parse(form["txtDepartureDate"].ToString());                    
                        Depart = "%" + dt.DayOfWeek.ToString().Substring(0, 2).ToUpper() + "%";
                    }
                    var tblRoute = db.sp_GetRouteMatch(Departure, Destination, Depart);
                    ViewData["DataRoute"] = tblRoute;
                }
                else
                {
                    ViewData["DataRoute"] = null;
                }
                if (form["txtDepartureDate"] == null)
                {
                    String currentDate = DateTime.Now.ToShortDateString();
                    ViewData["DateDepart"] = currentDate;
                    //Setup session date ngay ma khach hang chon khoi hanh
                    Session["DateDeparture"] = currentDate;
                }
                else { 
                    ViewData["DateDepart"] = form["txtDepartureDate"];
                    Session["DateDeparture"] = form["txtDepartureDate"];
                }
            }catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
            }

            return View();
        }
        
        public ActionResult SearchDetail()
        {
            try
            {
                //Kiem tra va lay ID cua dia diem khoi hanh
                if (Request.Params["Departure"] != null)
                {
                    int id = Convert.ToInt16(Request.Params["Departure"]);
                    ViewData["CityStart"] = GetCityDeparture(id);                
                    if (Request.Params["Destination"] != null)
                    {
                        int DestinationID = Convert.ToInt16(Request.Params["Destination"]);
                        ViewData["CityEnd"] = GetCityDestination(id, DestinationID);                    
                    }
                    else
                    {
                        ViewData["CityEnd"] = GetCityDestination(id);
                        ViewData["CityDestination"] = "?";
                    }
                }
                else
                {                
                    ViewData["CityStart"] = GetCityDeparture();
                    ViewData["CityEnd"] = GetCityDestination(1);
                }

                if (Request.Params["Departure"] != null && Request.Params["Destination"] != null)
                {
                    db_OBTRSDataContext db = new db_OBTRSDataContext();
                    int Departure = Convert.ToInt32(Request.Params["Departure"]);
                    int Destination = Convert.ToInt32(Request.Params["Destination"]);
                    string Depart = "%%";
                    if (Request.Params["Depart"] != null)
                    {                    
                        Depart = "%" + Request.Params["Depart"] + "%";
                    }
                    var tblRoute = db.sp_GetRouteMatch(Departure, Destination, Depart);
                    ViewData["DataRoute"] = tblRoute;
                }
                else {
                    ViewData["DataRoute"] = null;
                }
                if (Request.Params["Date"] != null)
                {
                    ViewData["DateDepart"] = Request.Params["Date"];
                    Session["DateDeparture"] = Request.Params["Date"].ToString();
                }
                else {
                    String currentDate = DateTime.Now.ToShortDateString();
                    ViewData["DateDepart"] = currentDate;
                    Session["DateDeparture"] = currentDate;
                }
            }catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
            }

            return View();
        }
                
        
        //Hien thi chi tiet viec dat ve
        public ActionResult BookingDetail() {
            //Kiem tra neu nguoi dung chua dang nhap thi hien thi thong bao yeu cau dang nhap
            if (Session["UserID"] == null)
            {
                Response.Write("You can only find book ticket detail if you login!<br />");
                Response.Write("Please <a href='/Home/SearchDetail'>back</a> home page to login or <a href='/Home/Register/'>register</a> is member of us");
                return null;
            }
            //Ket thuc kiem tra

            try
            {
                int beginID = Convert.ToInt32(Request.Params["BeginID"]);
                int endID = Convert.ToInt32(Request.Params["EndID"]);
                int bustypeID = Convert.ToInt32(Request.Params["BusTypeID"]);
                int startTime = Convert.ToInt32(Request.Params["StartTime"]);
                RepositoryOBTRS db = new RepositoryOBTRS();
                List<String> list = db.GetRouteDetail(beginID,endID,bustypeID,startTime);
                ViewData["RouteDetail"] = list;
                //Setup Session RouteDetail - danh sach chi tiet tuyen xe ma khach hang chon
                Session["RouteDetail"] = list;

                if (list[1].ToString() == "12")
                {
                    ViewData["BusDiagram"] = db.GetBusDiagram(1);                    
                }
                else if (list[1].ToString() == "24")
                {
                    ViewData["BusDiagram"] = db.GetBusDiagram(2);                    
                }
                else {
                    ViewData["BusDiagram"] = db.GetBusDiagram(3);                   
                }

                //Lay tong so ghe da dc dat
                db_OBTRSDataContext tbl = new db_OBTRSDataContext();
                DateTime date = DateTime.Parse(Request.Params["Date"]);
                var sumSeat = tbl.sp_GetSelectedSeat(beginID, endID, bustypeID, startTime, date);

                //Luu tru danh sach ghe ngoi
                ArrayList BookedSeatList = new ArrayList();                
                foreach (sp_GetSelectedSeatResult name in sumSeat)
                {
                    BookedSeatList.Add(name.Seat);
                }

                //Lay danh sach cac ghe da dat cho
                //Session["BookedSeatList"] = BookedSeatList;
                //Tam thoi ko su dung--------

                ViewData["BookedSeat"] = BookedSeatList;                
            }
            catch (Exception e)
            {               
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
            }

            return View();
        }

        [HttpPost]
        public ActionResult BusTicketOffice(FormCollection form) {
            try
            {
                if (form == null)
                {
                    return Redirect("/Home/BookingDetail");
                }
                else {             
                    //Kiem tra neu nguoi dung chua dang nhap thi hien thi thong bao yeu cau dang nhap
                    if (Session["UserID"] == null)
                    {
                        Response.Write("You can only find book ticket detail if you login!<br />");
                        Response.Write("Please <a href='/Home/SearchDetail'>back</a> home page to login or <a href='/Home/Register/'>register</a> is member of us");
                        return null;
                    }
                    //Ket thuc kiem tra

                    ArrayList BookingSeats = new ArrayList();
                    if (form != null)
                    {  
                        for (int i = 0; i < form.Count; i++)
                        {
                            //Lay thong tin so ghe KH da lua chon
                            BookingSeats.Add(form.Keys[i].ToString().Substring(8));
                        }
                        //Setup Session BookingSeats - danh sach so hieu cac ghe khach hang chon
                        Session["BookingSeats"] = BookingSeats;
                    }                    

                    return View(BookingSeats);
                }
            }
            catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");                
                return null;
            }
        }


        /// <summary>
        /// About Us
        /// </summary>
        /// <returns></returns>
        public ActionResult AboutUs() {
            try
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                ViewData["Data"] = db.GetAboutUs();

            }catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
            }

            return View();
        }

        /// <summary>
        /// Contact Us
        /// </summary>
        /// <returns></returns>
        public ActionResult ContactUs()
        {
            try
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                ViewData["Data"] = db.GetContactUs();
            }
            catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
            }
            return View();
        }

        /// <summary>
        /// Term & Condition
        /// </summary>
        /// <returns></returns>
        public ActionResult TermCondition()
        {
           try
           {
                RepositoryOBTRS db = new RepositoryOBTRS();
                ViewData["Data"] = db.GetTermCondition();
           }
           catch (Exception)
           {
               Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
               Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
               //throw;
               return null;
           }
            return View();
        }

        /// <summary>
        /// Privacy Policy
        /// </summary>
        /// <returns></returns>
        public ActionResult PrivacyPolicy()
        {
            try
            {
                RepositoryOBTRS db = new RepositoryOBTRS();
                ViewData["Data"] = db.GetPrivacyPolicy();
            }
            catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
            }
            return View();
        }

        /// <summary>
        /// Hien thi chi tiet tin tuc
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult DetailNews(Guid id) {
            try
            {
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
            }
            catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
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
            try
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
            }
            catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");
                //throw;
                return null;
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

        [HttpPost]
        public ActionResult Payment(FormCollection form) {
            //Khai bao
            //thong tin tuyen xe
            List<String> RouteDetail = (List<String>)Session["RouteDetail"];
            //Thong in ghe dang dat
            ArrayList arrSeatNo = (ArrayList)Session["BookingSeats"];
            //Mang luu tru cac ket qua booking
            ArrayList ResultList = new ArrayList();
            RepositoryOBTRS db = new RepositoryOBTRS();
            try
            {            
                if (form != null)
                {
                    //Luu tat ca cac ve cua khach hang vao Database                
                    for (int i = 0; i < (form.Count / 2); i++)
                    {
                        db_OBTRSDataContext discount = new db_OBTRSDataContext();
                        var dis = discount.sp_CalculateDiscount(decimal.Parse(RouteDetail[5].ToString()), int.Parse(form["Age" + i]));
                        Decimal CostDiscount = new Decimal();
                        foreach (sp_CalculateDiscountResult item in dis)
                        {
                            CostDiscount = (Decimal)item.Result;
                        }
                        String result = db.InsertBookingTicket(int.Parse(RouteDetail[6]), int.Parse(RouteDetail[7]), int.Parse(RouteDetail[8]), int.Parse(RouteDetail[9]), Session["UserID"].ToString(), form["NameCustomer" + i].ToString(), int.Parse(form["Age" + i]), CostDiscount, int.Parse(arrSeatNo[i].ToString()), DateTime.Parse(Session["DateDeparture"].ToString()));
                        ResultList.Add(result);
                    }                
                }
            }
            catch (Exception)
            {
                Response.Write("<strong style='font-size:12pt'>Have a error in during request to server!</strong>");
                Response.Write("<br>Sorry for this inconvenience! Please<a href='/Home'> click here</a> to HOME PAGE.");                
                return null;
            }
            return View(ResultList);
        }
    }
}
