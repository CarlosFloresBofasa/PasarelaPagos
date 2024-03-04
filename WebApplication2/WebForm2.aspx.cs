using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SeguridadPJ;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // URL del API de departamentos
                string apiUrl = "https://farmappcia.bofasa.com/api/departamento";

                using (var httpClient = new HttpClient())
                {
                    try
                    {
                        // Realiza una solicitud GET al API
                        var response = httpClient.GetStringAsync(apiUrl).Result;

                        // Deserializa la respuesta JSON en una clase C#
                        var result = JsonConvert.DeserializeObject<ApiResponse>(response);

                        if (result.resultado)
                        {
                            // Los departamentos se obtuvieron exitosamente
                            List<Departamento> departamentos = result.data;

                            // Ahora puedes trabajar con la lista de departamentos
                            foreach (var departamento in departamentos)
                            {
                                // Accede a las propiedades de cada departamento
                                int codigoDepartamento = departamento.codigo_departamento;
                                string nombreDepartamento = departamento.nombre;


                                // Crea un ListItem con el nombre como texto y el código como valor
                                ListItem item = new ListItem(nombreDepartamento, codigoDepartamento.ToString());
                                // Agrega el ListItem al DropDownList
                                ddlDepartamentos.Items.Add(item);
                                // Puedes utilizar estos datos como desees
                            }
                        }
                        else
                        {
                               // El API devolvió un resultado 'false', puedes manejarlo aquí
                        }
                    }
                    catch (Exception ex)
                    {
                        // Maneja cualquier error que ocurra durante la solicitud
                        Label1.Text = "Error al obtener los departamentos: " + ex.Message;
                    }
                }

            }

        }
    }
}
