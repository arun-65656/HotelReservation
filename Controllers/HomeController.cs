using HotelReservation.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HotelReservation.Controllers
{
    public class HomeController : Controller
    {
        string myConnectionString = "server=localhost;uid=root;" + "database=hotel_reservation";
        [HttpGet]
        public ActionResult Login()
        {
            ViewBag.Message = "Login.";
            return View();
        }

        [HttpPost]
        public ActionResult Login(Models.loginDetail obj)
        {
            DataSet ds = new DataSet("Detail");
            Models.HotelDetail HotelDetail = new Models.HotelDetail();
            string newProdID = "";
            try
            {
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select Count(*) from customers o where o.email=@userName and password=@password", conn);
                    cmd.Parameters.AddWithValue("@userName", obj.email);
                    cmd.Parameters.AddWithValue("@password", obj.password);
                    try
                    {
                        conn.Open();
                        newProdID = Convert.ToString(cmd.ExecuteScalar());
                        if (Convert.ToInt32(newProdID) == 0)
                        {
                            return View("Login");
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    //--------------
                    MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter("SELECT HOTELSID, HOTELNAME, IMAGES, DISTANCE, BENIFITS,(select Role from customers o where o.email = '" + obj.email + "' and password = '"+ obj.password + "') as Role FROM `HOTELS`GROUP BY HOTELSID,HOTELNAME,IMAGES,DISTANCE,BENIFITS ORDER BY HOTELSID", conn);
                    da.Fill(ds, "Detail");
                    HotelDetail.dt = ds.Tables[0]; 
                    Session["Role"] = ds.Tables[0].Rows[0]["Role"].ToString();
                    //--------------
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                newProdID = "";
            }
            Session["uid"] = obj.email;
            Session["pwd"] = obj.password;
            return View("Index", HotelDetail);
        }

        [HttpGet]
        public ActionResult UserRegistration()
        {
            ViewBag.Message = "User Registration.";
            return View();
        }

        [HttpPost]
        public ActionResult UserRegistration(Models.RegistrationDetails obj)
        {
            int count = 0;
            try
            {
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {
                    MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("select Count(*) from customers o where o.email = @username and password = @password", conn);
                    cmd1.Parameters.AddWithValue("@username", obj.email);
                    cmd1.Parameters.AddWithValue("@password", obj.password);
                    try
                    {
                        conn.Open();
                        count = Convert.ToInt32(cmd1.ExecuteScalar());
                        if (count > 0)
                        {
                            //ViewBag["MSG"]= "User Allready Exist.";
                            ViewBag.Message = "User Already Exist.";
                            return View("UserRegistration");
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("insert into customers(name,email,phone,password,Role) values(@name,@email,@mobile,@password,@Roles)", conn);
                    cmd.Parameters.AddWithValue("@name", obj.name);
                    cmd.Parameters.AddWithValue("@email", obj.email);
                    cmd.Parameters.AddWithValue("@mobile", obj.mobile);
                    cmd.Parameters.AddWithValue("@password", obj.password);
                    cmd.Parameters.AddWithValue("@Roles", (obj.Roles).ToString());
                    try
                    {
                        //conn.Open();
                        count = cmd.ExecuteNonQuery();
                        if (count == 0)
                        {
                            return View("UserRegistration");
                        }
                    }
                    catch (Exception ex)
                    {
                        return View("UserRegistration");
                    }
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                count = 0;
            }
            return View("Login");
        }

        public ActionResult Logout()
        {
            Session["uid"] = null;
            Session["pwd"] = null;
            return RedirectToAction("Login");
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Reserve(string HotelId, string HotelName)
        {
            if ((Session["Role"]).ToString() == "Owner")
            {
                DataSet ds = new DataSet("Detail");
                Models.HotelDetail HotelDetail = new Models.HotelDetail();
                string Query = "SELECT HOTELSID, HOTELNAME, IMAGES, DISTANCE, BENIFITS,(select Role from customers o where o.email = '" + (Session["uid"]).ToString() + "' and password = '" + (Session["pwd"]).ToString() + "') as Role FROM HOTELS GROUP BY HOTELSID,HOTELNAME,IMAGES,DISTANCE,BENIFITS ORDER BY HOTELSID";                  
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {
                    MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter(Query, conn);
                    da.Fill(ds, "Detail");
                    HotelDetail.dt = ds.Tables[0];
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        Session["Role"] = ds.Tables[0].Rows[0]["Role"].ToString();
                    }
                    //--------------
                } 
                return View("Index", HotelDetail);
            }
            TempData["HotelId"] = HotelId;
            TempData["HotelName"] = HotelName;
            return View();
        }


        [HttpPost]
        public JsonResult Proceed(Models.PaymentDetail obj)
        {
            double Amt = 0;
            Amt = CalculateAmount(obj.HotelId, "Double Room", obj.Room1, Amt);
            Amt = CalculateAmount(obj.HotelId, "Deluxe Triple Room", obj.Room2, Amt);
            Amt = CalculateAmount(obj.HotelId, "Standard Double Room", obj.Room3, Amt);
            Amt = CalculateAmount(obj.HotelId, "Deluxe Room", obj.Room4, Amt);
            Amt = CalculateAmount(obj.HotelId, "Classic Triple Room", obj.Room5, Amt);
            Amt = CalculateAmount(obj.HotelId, "Small Twin Room", obj.Room6, Amt);
            Amt = CalculateAmount(obj.HotelId, "Standard Double or Twin Room", obj.Room7, Amt);
            Models.PaymentDetail obj1 = new Models.PaymentDetail();
            obj1.HotelId = Convert.ToString(obj.HotelId);
            obj1.HotelName = Convert.ToString(obj.HotelName);
            //obj1.RoomType = Convert.ToString(obj.RoomType);
            obj1.Amount = Convert.ToString(Amt);
            return Json(obj1, JsonRequestBehavior.AllowGet);
        }


        public double CalculateAmount(string HotelId, string RoomType, string count, double Amt1)
        {
            string Amt = "0";
            try
            {
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select Amount from hotels o where o.HotelsId=@HotelsId and RoomTyoe=@RoomType", conn);
                    cmd.Parameters.AddWithValue("@HotelsId", HotelId);
                    cmd.Parameters.AddWithValue("@RoomType", RoomType);
                    try
                    {
                        conn.Open();
                        Amt = Convert.ToString(cmd.ExecuteScalar());
                        if (count != "" && count != "0" && count != null)
                        {
                            Amt1 = Amt1 + (Convert.ToInt32(count) * Convert.ToDouble(Amt));
                        }
                    }
                    catch (Exception ex)
                    {
                        Amt1 = 0;
                    }
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Amt1 = 0;
            }
            return Amt1;
        }

        [HttpPost]
        public JsonResult ProceedPay(Models.PaymentDetail obj)
        {
            // Declare two dates
            //var eDate = obj.eDate;
            //var sDate = obj.sDate;

            //get difference of two dates
            //var diffOfDates = eDate - sDate;

            //int Count = Convert.ToInt32(diffOfDates);
            int Count1 = 0;
            double TotAmt = (Convert.ToDouble(obj.Amount) * Convert.ToInt32(obj.DayCount));
            string CustId = "";
            Models.PaymentDetail obj1 = new Models.PaymentDetail();
            try
            {
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select customerid from customers o where o.email = '" + (Session["uid"]).ToString() + "' and password = '" + (Session["pwd"]).ToString() + "'", conn);
                    try
                    {
                        conn.Open();
                        CustId = Convert.ToString(cmd.ExecuteScalar());
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("insert into HotelReservationDetail(HotelId,CheckIn,CheckOut,Amount,billstatus,CustomerId) values(@HotelId,@CheckIn,@CheckOut,@Amount,@billstatus,@customerid)", conn);
                    cmd1.Parameters.AddWithValue("@HotelId", obj.HotelId);
                    cmd1.Parameters.AddWithValue("@CheckIn", (obj.sDate).ToString("yyyy-MM-dd"));
                    cmd1.Parameters.AddWithValue("@CheckOut", (obj.eDate).ToString("yyyy-MM-dd"));
                    cmd1.Parameters.AddWithValue("@Amount", TotAmt);
                    cmd1.Parameters.AddWithValue("@billstatus", "PAID");
                    cmd1.Parameters.AddWithValue("@customerid", CustId);
                    try
                    {
                        //conn.Open();
                        Count1 = Convert.ToInt32(cmd1.ExecuteNonQuery());
                        if (Count1 <= 0)
                        {
                            obj1.Amount = Convert.ToString("0");
                            obj1.status = Convert.ToString("Failed");
                            return Json(obj1, JsonRequestBehavior.AllowGet);
                        }
                    }
                    catch (Exception ex)
                    {
                        obj1.Amount = Convert.ToString("0");
                        obj1.status = Convert.ToString("Failed");
                        return Json(obj1, JsonRequestBehavior.AllowGet);
                    }
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                obj1.Amount = Convert.ToString("0");
                obj1.status = Convert.ToString("Failed");
                return Json(obj1, JsonRequestBehavior.AllowGet);
            }
            //Models.PaymentDetail obj1 = new Models.PaymentDetail();
            obj1.Amount = Convert.ToString(TotAmt);
            obj1.status = Convert.ToString("Successful...");
            return Json(obj1, JsonRequestBehavior.AllowGet);
        }

        public ActionResult HotelDetails(HotelDetail Hotel)
        {
            DataSet ds = new DataSet("Detail");
            Models.HotelDetail HotelDetail = new Models.HotelDetail();
            try
            {
                string Query = "";
                if (Hotel.SearchHotel == "")
                {
                    Query = "SELECT HOTELSID, HOTELNAME, IMAGES, DISTANCE, BENIFITS,(select Role from customers o where o.email = '" + (Session["uid"]).ToString() + "' and password = '" + (Session["pwd"]).ToString() + "') as Role FROM HOTELS GROUP BY HOTELSID,HOTELNAME,IMAGES,DISTANCE,BENIFITS ORDER BY HOTELSID";
                }
                else {
                    Query= "SELECT HOTELSID, HOTELNAME, IMAGES, DISTANCE, BENIFITS,(select Role from customers o where o.email = '" + (Session["uid"]).ToString() + "' and password = '" + (Session["pwd"]).ToString() + "') as Role FROM HOTELS WHERE UPPER(HOTELNAME) Like (UPPER('%" + Hotel.SearchHotel + "%')) GROUP BY HOTELSID,HOTELNAME,IMAGES,DISTANCE,BENIFITS ORDER BY HOTELSID";
                }
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {                  
                    MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter(Query, conn);
                    da.Fill(ds, "Detail");
                    HotelDetail.dt = ds.Tables[0];
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        Session["Role"] = ds.Tables[0].Rows[0]["Role"].ToString();
                    }
                    //--------------
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
            } 
            return View("Index", HotelDetail);
        }

        [HttpGet]
        public ActionResult BookingDetails()
        {
            DataSet ds = new DataSet("Detail");
            Models.HotelDetail HotelDetail = new Models.HotelDetail();
            try
            {
                string Query = "";
                if ((Session["Role"]).ToString() == "Owner")
                {
                    Query = "SELECT C.NAME,C.EMAIL,C.PHONE,H.CHECKIN,H.CHECKOUT,H.AMOUNT,H.BILLSTATUS,G.HOTELNAME FROM CUSTOMERS C, HOTELRESERVATIONDETAIL H,(SELECT HOTELSID, HOTELNAME FROM HOTELS GROUP BY HOTELSID, HOTELNAME) G WHERE C.CUSTOMERID=H.CUSTOMERID AND G.HOTELSID=H.HOTELID ORDER BY H.CHECKIN";              
                }
                else
                {
                    Query = "SELECT C.NAME,C.EMAIL,C.PHONE,H.CHECKIN,H.CHECKOUT,H.AMOUNT,H.BILLSTATUS,G.HOTELNAME FROM CUSTOMERS C, HOTELRESERVATIONDETAIL H,(SELECT HOTELSID, HOTELNAME FROM HOTELS GROUP BY HOTELSID, HOTELNAME) G WHERE C.CUSTOMERID=H.CUSTOMERID AND G.HOTELSID=H.HOTELID AND C.EMAIL = '" + (Session["uid"]).ToString() + "' AND C.PASSWORD = '" + (Session["pwd"]).ToString() + "' ORDER BY H.CHECKIN";
                }
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {
                    MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter(Query, conn);
                    da.Fill(ds, "Detail");
                    HotelDetail.dt = ds.Tables[0]; 
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
            }
            return View(HotelDetail);
        }


        public ActionResult Back()
        {
            DataSet ds = new DataSet("Detail");
            Models.HotelDetail HotelDetail = new Models.HotelDetail();
            string Query = "SELECT HOTELSID, HOTELNAME, IMAGES, DISTANCE, BENIFITS,(select Role from customers o where o.email = '" + (Session["uid"]).ToString() + "' and password = '" + (Session["pwd"]).ToString() + "') as Role FROM HOTELS GROUP BY HOTELSID,HOTELNAME,IMAGES,DISTANCE,BENIFITS ORDER BY HOTELSID";
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
            {
                MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter(Query, conn);
                da.Fill(ds, "Detail");
                HotelDetail.dt = ds.Tables[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Session["Role"] = ds.Tables[0].Rows[0]["Role"].ToString();
                }
            }
            return View("Index", HotelDetail);
        }
    }
}