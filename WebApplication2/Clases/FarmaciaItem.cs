using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.Clases
{
    public class FarmaciaItem
    {
        public string primeraPagina { get; set; }
        public string ultimaPagina { get; set; }
        public int totalPaginas { get; set; }
        public int totalRegistros { get; set; }
        public string siguientePagina { get; set; }
        public object anteriorPagina { get; set; }
        public List<Farmacia> data { get; set; }
    }
}