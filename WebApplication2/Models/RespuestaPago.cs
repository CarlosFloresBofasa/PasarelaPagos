﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.Models
{
    public class RespuestaPago
    {
        public string auth_trans_ref_no { get; set; }
        public string reason_code { get; set; }
        public string reference_number { get; set; }
        public string auth_banco { get; set; }
        public decimal monto { get; set; }
        public string mensaje { get; set; }
        public string tarjeta { get; set; }
    }
}