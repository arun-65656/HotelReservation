using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data;

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
        public Role Roles { get; set; }
    }
    public enum Role
    {
        User, Owner
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


        public string Room1 { get; set; }
        public string Room2 { get; set; }
        public string Room3 { get; set; }
        public string Room4 { get; set; }
        public string Room5 { get; set; }
        public string Room6 { get; set; }
        public string Room7 { get; set; }
    }

    public class HotelDetail
    {
        public string HotelId { get; set; }
        public string HotelName { get; set; }
        public string Images { get; set; }
        public string Distance { get; set; }
        public string Benifits { get; set; }
        public DataTable dt { get; set; }

        public string SearchHotel { get; set; }
    }
}