using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;


using SeguridadPJ;


namespace WebApplication2
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            string userName = User.Identity.Name;
            Session["Usuario"] = userName;

            if (userName.ToString().Length == 0)
            {
                // La sesión no está iniciada, redirige al inicio de sesión o a otra página.
                Response.Redirect("~/Account/Login");
            }
            else
            { 
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                CargarCombo();
                // La sesión está iniciada, puedes acceder a la información del usuario.
                //string usuario = Session["Usuario"].ToString();
                // Realiza las acciones necesarias aquí.
            }

        }





        private void CargarCombo()
        {
            //Tipo Envio
            ddlTipoEnvio.Items.Clear();
            ddlTipoEnvio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Tipo Envio", 0));
            ddlTipoEnvio.Items.Add(new DevExpress.Web.ListEditItem("A Domicilio", 1));
            ddlTipoEnvio.Items.Add(new DevExpress.Web.ListEditItem("Recoger en Farmacia", 2));
            ddlTipoEnvio.SelectedIndex = 0;

            //Mes
            ddlTarjetaInfoMes.Items.Clear();

            for (int i = 1; i <= 12; i++)
            {
                string valMes = "";

                if (i > 0 && i < 10)
                {
                    valMes = "0" + i.ToString();
                }
                else
                {
                    valMes = i.ToString();
                }

                ddlTarjetaInfoMes.Items.Add(new ListItem(valMes, valMes));
            }

            //Año
            ddlTarjetaInfoAnio.Items.Clear();

            int finAnio = DateTime.Today.Year + 10;
            for (int i = DateTime.Today.Year; i <= finAnio; i++)
            {
                ddlTarjetaInfoAnio.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            //Departamentos
            try
            {


                string urlValue = Seguridad.DesEncripta(ConfigurationManager.AppSettings["API_DEPARTAMENTO"].ToString());
                string apiUrl = urlValue;
                ddlDireccionesSitioDepartamento.Items.Clear();
                ddlDireccionesClienteDepartamento.Items.Clear();

                ddlDireccionesSitioDepartamento.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Departamento", "0"));
                ddlDireccionesClienteDepartamento.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Departamento", "0"));

                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(apiUrl).Result;

                    // Deserializar la respuesta JSON como un JObject
                    JObject jsonDepartamentos = JObject.Parse(response);

                    // Acceder a los datos dentro del objeto y llenar el DropDownList
                    JArray jsonDepartamentoArray = (JArray)jsonDepartamentos["data"];

                    foreach (JObject departamento in jsonDepartamentoArray.OrderBy(x => (string)x["nombre"]))
                    {
                        string id = (string)departamento["id"];
                        string nombre = (string)departamento["nombre"];

                        ddlDireccionesSitioDepartamento.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                        ddlDireccionesClienteDepartamento.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                    }
                }

                ddlDireccionesSitioDepartamento.SelectedIndex = 0;
                ddlDireccionesClienteDepartamento.SelectedIndex = 0;

                //SIN MUNICIPIOS
                ddlDireccionesSitioMunicipio.Items.Clear();
                ddlDireccionesClienteMunicipio.Items.Clear();

                ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Municipio", "0"));
                ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Municipio", "0"));

                ddlDireccionesSitioMunicipio.SelectedIndex = 0;
                ddlDireccionesClienteMunicipio.SelectedIndex = 0;

                //SIN ZONAS
                ddlDireccionesSitioZona.Items.Clear();
                ddlDireccionesClienteZona.Items.Clear();

                ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));
                ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));

                ddlDireccionesSitioZona.SelectedIndex = 0;
                ddlDireccionesClienteZona.SelectedIndex = 0;
            }
            catch (Exception  )
            {

            }
        }

        private void CargarMunicipio(string pIdDepartamento, int pCombo)
        {
            try
            {
                bool existeDatos = false;
                // Obtener el código de departamento seleccionado en el DropDownList de departamentos
                string codigoDepartamento = (string)pIdDepartamento;

                // Realizar la solicitud HTTP a la API con el código de departamento como parámetro
                string urlValue = Seguridad.DesEncripta(ConfigurationManager.AppSettings["API_MUNICIPIO"].ToString());
                string apiUrl = urlValue.Replace("{codigoDepartamento}", codigoDepartamento);
                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(apiUrl).Result;

                    // Deserializar la respuesta JSON como un JObject
                    JObject jsonMunicipio = JObject.Parse(response);

                    // Acceder a los datos dentro del objeto y llenar el DropDownList
                    JArray jsonMunicipiosArray = (JArray)jsonMunicipio["data"];

                    // Limpiar DropDownList de municipios
                    ddlDireccionesSitioMunicipio.Items.Clear();
                    ddlDireccionesClienteMunicipio.Items.Clear();

                    ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Municipio", "0"));
                    ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Municipio", "0"));

                    // Recorrer el JArray y agregar los datos al DropDownList de municipios
                    foreach (JObject municipio in jsonMunicipiosArray.OrderBy(x => (string)x["nombre"]))
                    {
                        existeDatos = true;
                        string id = (string)municipio["id"];
                        string nombre = (string)municipio["nombre"];

                        if (pCombo == 1)
                        {
                            ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                        }
                        else
                        {
                            if (pCombo == 2)
                            {
                                ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                            }
                        }
                    }
                }

                if (existeDatos == false)
                {
                    ddlDireccionesSitioMunicipio.Items.Clear();
                    ddlDireccionesClienteMunicipio.Items.Clear();

                    ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Sin Municipios", "-1"));
                    ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Sin Municipios", "-1"));

                    ddlDireccionesSitioMunicipio.SelectedIndex = 0;
                    ddlDireccionesClienteMunicipio.SelectedIndex = 0;
                }

                ddlDireccionesSitioMunicipio.SelectedIndex = 0;
                ddlDireccionesClienteMunicipio.SelectedIndex = 0;
            }
            catch (Exception  )
            {

            }
        }

        private void CargarZonas(string pIdMunicipio, int pCombo)
        {
            try
            {
                bool existeDatos = false;
                // Obtener el código de departamento seleccionado en el DropDownList de departamentos
                string codigoMunicipio = (string)pIdMunicipio;

                // Realizar la solicitud HTTP a la API con el código de departamento como parámetro
                string urlValue = Seguridad.DesEncripta(ConfigurationManager.AppSettings["API_ZONA"].ToString());
                string apiUrl = urlValue.Replace("{codigoMunicipio}", codigoMunicipio);
                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(apiUrl).Result;

                    // Deserializar la respuesta JSON como un JObject
                    JObject jsonZonas = JObject.Parse(response);

                    // Acceder a los datos dentro del objeto y llenar el DropDownList
                    JArray jsonZonasArray = (JArray)jsonZonas["data"];

                    // Limpiar DropDownList de municipios
                    ddlDireccionesSitioZona.Items.Clear();
                    ddlDireccionesClienteZona.Items.Clear();

                    ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));
                    ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));

                    // Recorrer el JArray y agregar los datos al DropDownList de municipios
                    foreach (JObject municipio in jsonZonasArray)
                    {
                        existeDatos = true;
                        string id = (string)municipio["id"];
                        string nombre = (string)municipio["nombre"];

                        if (pCombo == 1)
                        {
                            ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                        }
                        else
                        {
                            if (pCombo == 2)
                            {
                                ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                            }
                        }
                    }
                }

                if (existeDatos == false)
                {
                    ddlDireccionesSitioZona.Items.Clear();
                    ddlDireccionesClienteZona.Items.Clear();

                    ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem("Sin Zonas", "-1"));
                    ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem("Sin Zonas", "-1"));

                    ddlDireccionesSitioZona.SelectedIndex = 0;
                    ddlDireccionesClienteZona.SelectedIndex = 0;
                }

                ddlDireccionesSitioZona.SelectedIndex = 0;
                ddlDireccionesClienteZona.SelectedIndex = 0;
            }
            catch (Exception  )
            {

            }
        }

        protected void ddlTipoEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlTipoEnvio.SelectedItem.Value);

            if (id == 1)
            {
                //Cliente
                ddlDireccionesCliente.Items.Clear();
                ddlDireccionesCliente.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Dirección", -1));
                ddlDireccionesCliente.Items.Add(new DevExpress.Web.ListEditItem("Nueva Dirección", 0));
                ddlDireccionesCliente.SelectedIndex = 0;

                divDireccionesCliente.Visible = true;
                divDireccionesFarmacia.Visible = false;
            }
            else
            {
                if (id == 2)
                {
                    ddlDireccionesSitioFarmacia.Items.Clear();
                    ddlDireccionesSitioFarmacia.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Farmacia", 0));
                    ddlDireccionesSitioFarmacia.SelectedIndex = 0;

                    divDireccionesFarmacia.Visible = true;
                    divDireccionesCliente.Visible = false;
                }
                else
                {
                    divDireccionesFarmacia.Visible = false;
                    divDireccionesCliente.Visible = false;
                }
            }
        }

        protected void ddlDireccionesCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlDireccionesCliente.SelectedItem.Value);

            if (id == 0)
            {
                divDireccionesClienteNueva.Visible = true;
            }
            else
            {
                divDireccionesClienteNueva.Visible = false;
            }
        }

        protected void btnFormaPagoSyEValidar_Click(object sender, EventArgs e)
        {
            ddlFormaPagoSyECuotas.Items.Clear();
            ddlFormaPagoSyECuotas.Items.Add(new ListItem("Seleccionar Cuotas", "0"));
            ddlFormaPagoSyECuotas.Items.Add(new ListItem("1", "1"));
            ddlFormaPagoSyECuotas.Items.Add(new ListItem("2", "2"));
            ddlFormaPagoSyECuotas.Items.Add(new ListItem("3", "3"));
            ddlFormaPagoSyECuotas.SelectedIndex = 0;

            divFormaPagoSyEDatos.Visible = true;
        }

        #region CreaPedidoDermacenter
        protected void btnFormaPagoEfectivoPedido_Click(object sender, EventArgs e)
        {

        }

        protected void btnFormaPagoTarjetaCobrar_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("WebForm1.aspx");
        }

         protected void btnFormaPagoSyEPedido_Click(object sender, EventArgs e)
        {

        }
        #endregion

        protected void ddlDireccionesSitioDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pId = ddlDireccionesSitioDepartamento.SelectedItem.Value.ToString();

            //SIN ZONAS
            ddlDireccionesSitioZona.Items.Clear();
            ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));

            ddlDireccionesSitioMunicipio.SelectedIndex = 0;
            ddlDireccionesSitioZona.SelectedIndex = 0;

            CargarMunicipio(pId, 1);
        }

        protected void ddlDireccionesClienteDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pId = ddlDireccionesClienteDepartamento.SelectedItem.Value.ToString();

            //SIN ZONAS
            ddlDireccionesClienteZona.Items.Clear();
            ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));

            ddlDireccionesClienteMunicipio.SelectedIndex = 0;
            ddlDireccionesClienteZona.SelectedIndex = 0;

            CargarMunicipio(pId, 2);
        }

        protected void ddlDireccionesSitioMunicipio_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pId = ddlDireccionesSitioMunicipio.SelectedItem.Value.ToString();

            ddlDireccionesSitioZona.SelectedIndex = 0;

            CargarZonas(pId, 1);
        }

        protected void ddlDireccionesClienteMunicipio_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pId = ddlDireccionesClienteMunicipio.SelectedItem.Value.ToString();

            ddlDireccionesClienteZona.SelectedIndex = 0;

            CargarZonas(pId, 2);
        }

        protected void RadioButton_SeleccionarDireccion_CheckedChanged(object sender, EventArgs e)
        {
       

            //Cliente
            ddlDireccionesCliente.Items.Clear();
            ddlDireccionesCliente.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Dirección", -1));
            ddlDireccionesCliente.Items.Add(new DevExpress.Web.ListEditItem("Nueva Dirección", 0));
            ddlDireccionesCliente.SelectedIndex = 0;

            divDireccionesCliente.Visible = true;
            divDireccionesFarmacia.Visible = false;
            RadioButton_SeleccionarDireccion.Checked = false;
            
        }

        protected void RadioButton_RecogerFarmacia_CheckedChanged(object sender, EventArgs e)
        {
        
            ddlDireccionesSitioFarmacia.Items.Clear();
                ddlDireccionesSitioFarmacia.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Farmacia", 0));
                ddlDireccionesSitioFarmacia.SelectedIndex = 0;

                divDireccionesFarmacia.Visible = true;
                divDireccionesCliente.Visible = false;
            RadioButton_RecogerFarmacia.Checked = false;

        }

        protected void ddlDireccionesSitioFarmacia_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlDireccionesSitioZona_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
