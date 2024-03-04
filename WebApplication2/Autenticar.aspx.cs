using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
 
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Threading;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Web;
using Google.Apis.Services;
 
using Google.Apis.Util.Store;
using System.Threading.Tasks;
using System.Net;
using System.Diagnostics;

namespace WebApplication2
{


    public partial class Autenticar : System.Web.UI.Page
    {

        string currentUrl;
        public string AccessToken { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            // Obtén la cadena de consulta



     
              currentUrl = HttpContext.Current.Request.Url.ToString();
            Debug.WriteLine("Current URL: " + currentUrl);

            txtPassword.Value = "PassPrueba#2023";
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            // Obtener los valores del formulario
            string email = txtEmail.Value;
            string password = txtPassword.Value;

        
              // URL del endpoint de autenticación
            string apiUrl = "https://farmappcia.bofasa.com/api/cuenta/autenticar";

            // Crear objeto JSON con los datos de autenticación
            var autenticacion = new
            {
                email = email,
                password = password
            };

            try
            {
                // Realizar solicitud POST al API para autenticar
                using (HttpClient client = new HttpClient())
                {
                    // Convertir el objeto de autenticación a JSON
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

                    string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(autenticacion);

                    // Configurar las cabeceras de la solicitud
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("text/plain"));
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json-patch+json"));

                    // Realizar la solicitud POST
                    HttpResponseMessage response = client.PostAsync(apiUrl, new StringContent(jsonData, System.Text.Encoding.UTF8, "application/json")).Result;

                    // Verificar si la solicitud fue exitosa
                    if (response.IsSuccessStatusCode)
                    {
                        // Leer y almacenar el token de la respuesta



                        string token = response.Content.ReadAsStringAsync().Result;
                        AccessToken = token; // Almacenar el token en la variable pública

                        // Aquí puedes realizar otras acciones con el token o redireccionar a otra página


                        string responseBody = response.Content.ReadAsStringAsync().Result;
                        // Deserializar la cadena JSON
                        var jsonResponse = JObject.Parse(responseBody);

                        // Acceder al valor de jwToken
                        string jwToken = jsonResponse["data"]["jwToken"].ToString();
                        Session["AccessToken"] = jwToken;
                        string url;
                        string datos = Request.QueryString["datos"];
                        //string url = "Autenticar.aspx?datos=" + HttpUtility.UrlEncode(datos);
                        //Response.Redirect(url, false);



                          url = "PAYMENT.aspx?datos=" + HttpUtility.UrlEncode(datos);
                        Response.Redirect(url, false);
                        ///Response.Redirect(url, false);
                    }
                    else
                    {
                        // Si la solicitud no fue exitosa, mostrar mensaje de error
                        Response.Write("Error al autenticar usuario. Código de estado: " + response.StatusCode);
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción que pueda ocurrir durante la solicitud
                Response.Write("Error: " + ex.Message);
            }

        }

          
    }
}
