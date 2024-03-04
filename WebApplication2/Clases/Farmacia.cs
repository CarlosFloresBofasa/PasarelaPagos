using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.Clases
{
    public class Farmacia
    {


        public string codigoFarmacia { get; set; }
        public int codigoCadena { get; set; }
        public string nombre { get; set; }
        public string direccion { get; set; }
        public bool esFavorita { get; set; }
        public List<string> telefonos { get; set; }

    }
}