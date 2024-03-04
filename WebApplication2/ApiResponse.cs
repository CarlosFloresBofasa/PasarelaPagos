using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2
{
    public class ApiResponse
    {
        public bool resultado { get; set; }
        public string mensaje { get; set; }
        public List<Departamento> data { get; set; }
    }
}