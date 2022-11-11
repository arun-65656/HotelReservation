using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace HotelReservation.Models
{
    public class loginDetail
    {
        [Required(ErrorMessage = "User Name is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        public string password { get; set; }
    }

    public class RegistrationDetails
    {
        [Required(ErrorMessage = "Name is required")]
        public string name { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string email { get; set; }

        [Required(ErrorMessage = "Mobile is required")]
        public string mobile { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        public string password { get; set; }

        [Required(ErrorMessage = "Confirm Password is required")]
        [DataType(DataType.Password)]
        public string cpassword { get; set; }
    }

    public class PaymentDetail
    {
        public string HotelId { get; set; }
        public string HotelName { get; set; }
        public string RoomType { get; set; }
        public string Amount { get; set; }
        public DateTime sDate { get; set; }
        public DateTime eDate { get; set; }
        public string PayMode { get; set; }
        public string status { get; set; }
        public string DayCount { get; set; }
}
}