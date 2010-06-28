using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace onlinebus.Models.Validation
{
    public class ValidateAdmin
    {
        [Required(ErrorMessage="*")]
        [StringLength(50,ErrorMessage="Value must under than 50 character")]
        public String AdminName { get; set; }

        [Required(ErrorMessage = "*")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:mm/dd/yyyy}")]
        public DateTime DateOfBirth { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(20, ErrorMessage = "Value must under than 20 character")]
        //[Range(4, 20, ErrorMessage = "Value must bigger than 4 and under than 20 character")]        
        public String Password { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(250, ErrorMessage = "Value must under than 250 character")]
        public String Address { get; set; }
                
        [StringLength(20, ErrorMessage = "Value must under than 20 character")]
        public String Phone { get; set; }

        [Required(ErrorMessage = "*")]
        [RegularExpression("\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", ErrorMessage = "Invalid Your Email!")]
        [StringLength(100, ErrorMessage = "Value must under than 100 character")]
        public String Email { get; set; }

        [Required(ErrorMessage = "*")]
        public String Role { get; set; }

        [StringLength(250, ErrorMessage = "Value must under than 250 character")]
        public String Description { get; set; }
    }
}
