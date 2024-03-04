using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.Clases;

namespace WebApplication2
{
    public partial class nitList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccessToken"] == null)
            {
                


                // Obtén la cadena de consulta
                string queryString = Request.QueryString.ToString();

                 
                string datos = Request.QueryString["datos"];
                string url = "Autenticar.aspx?datos=" + HttpUtility.UrlEncode(datos);
                Response.Redirect(url, false);


                 
            }


        }
    }
}