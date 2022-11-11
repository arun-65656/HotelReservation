using System;
using System.Collections.Generic;
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
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                newProdID = "";
            }
            Session["uid"] = obj.email;
            Session["pwd"] = obj.password;
            return View("Index");
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
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("insert into customers(name,email,phone,password) values(@name,@email,@mobile,@password)", conn);
                    cmd.Parameters.AddWithValue("@name", obj.name);
                    cmd.Parameters.AddWithValue("@email", obj.email);
                    cmd.Parameters.AddWithValue("@mobile", obj.mobile);
                    cmd.Parameters.AddWithValue("@password", obj.password);
                    try
                    {
                        conn.Open();
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
            TempData["HotelId"] = HotelId;
            TempData["HotelName"] = HotelName;
            return View();
        }


        [HttpPost]
        public JsonResult Proceed(Models.PaymentDetail obj)
        {
            string Amt = "";
            try
            {
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select Amount from hotels o where o.HotelsId=@HotelsId and RoomTyoe=@RoomType", conn);
                    cmd.Parameters.AddWithValue("@HotelsId", obj.HotelId);
                    cmd.Parameters.AddWithValue("@RoomType", obj.RoomType);
                    try
                    {
                        conn.Open();
                        Amt  = Convert.ToString(cmd.ExecuteScalar());
                    }
                    catch (Exception ex)
                    {
                        Amt="0";
                    }
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Amt = "0";
            }
            Models.PaymentDetail obj1 = new Models.PaymentDetail();
            obj1.HotelId = Convert.ToString(obj.HotelId);
            obj1.HotelName = Convert.ToString(obj.HotelName);
            obj1.RoomType = Convert.ToString(obj.RoomType);
            obj1.Amount = Convert.ToString(Amt);
            return Json(obj1, JsonRequestBehavior.AllowGet);
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
            string HotelId = "";
            Models.PaymentDetail obj1 = new Models.PaymentDetail();
            try
            {
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(myConnectionString))
                {
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select HotelId from hotels o where o.HotelsId=@HotelsId and RoomTyoe=@RoomType", conn);
                    cmd.Parameters.AddWithValue("@HotelsId", obj.HotelId);
                    cmd.Parameters.AddWithValue("@RoomType", obj.RoomType);
                    try
                    {
                        conn.Open();
                        HotelId = Convert.ToString(cmd.ExecuteScalar());
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("insert into HotelReservationDetail(HotelId,CheckIn,CheckOut,Amount,billstatus) values(@HotelId,@CheckIn,@CheckOut,@Amount,@billstatus)", conn);
                    cmd1.Parameters.AddWithValue("@HotelId", HotelId);
                    cmd1.Parameters.AddWithValue("@CheckIn", (obj.sDate).ToString("yyyy-MM-dd"));
                    cmd1.Parameters.AddWithValue("@CheckOut", (obj.eDate).ToString("yyyy-MM-dd"));
                    cmd1.Parameters.AddWithValue("@Amount", TotAmt);
                    cmd1.Parameters.AddWithValue("@billstatus", "PAID");
                    try
                    {
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

        //public ActionResult Index()
        //{
        //    return View();
        //}
        //
        //public ActionResult About()
        //{
        //    ViewBag.Message = "Your application description page.";
        //
        //    return View();
        //}
        //
        //public ActionResult Contact()
        //{
        //    ViewBag.Message = "Your contact page.";
        //
        //    return View();
        //}
    }
}