using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace onlinebus.Models.Validation
{
    public class ValidateLogin
    {
        [Required(ErrorMessage = "Please enter Your Email!")]
        [RegularExpression("\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*",ErrorMessage = "Invalid Your Email!")]        
        public String Email { get; set; }


        [Required(ErrorMessage = "Please enter Your Password")]
        [StringLength(50,ErrorMessage = "Password don't more than 50 characters")]
        public String Password { get; set; }

        public String Message { get; set; }
    }
}
