using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace onlinebus.Models.Validation
{
    public class SearchForm
    {
        [Required(ErrorMessage = "Please choose one begin place")]
        public string DepartureDate { get; set; }
    }
}
