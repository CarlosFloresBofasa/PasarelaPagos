using DevExpress.Web.Mvc.UI;
using Microsoft.Owin.Security.Twitter.Messages;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SeguridadPJ;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Security;
using System.Reflection.Emit;
using System.Text.RegularExpressions;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.Clases;
using static System.Net.WebRequestMethods;
using Label = System.Web.UI.WebControls.Label;
using Microsoft.Ajax.Utilities;
using Microsoft.IdentityModel.Tokens;
using System.Security.Cryptography.X509Certificates;
using WebApplication2.Models;
using DevExpress.Web;
using DevExpress.Utils.About;
using DevExpress.ClipboardSource.SpreadsheetML;
using Microsoft.Owin;
using System.Diagnostics;
using System.Web.Razor.Parser.SyntaxTree;
using DevExpress.Web.Internal.XmlProcessor;

namespace WebApplication2
{

    public partial class PAYMENT : System.Web.UI.Page
    {



        [WebMethod]
        public static void RealizarAccionDelBoton()
        {
 
            // Lógica específica que deseas ejecutar desde el lado del servidor
            int ssss = 0;
            // ASPxButton3_Click(1, 1);
           // string txtDireccionEntregaClienteValue =  This.txtDireccionEntregaCliente.Text;



        }



        private string _nit = "";
        private string _monto = "";
        private string _busqCliente = "";
        private string _CC = "";
        private string _Usuario = "";
        private string _guid = "";
        private string _direccionId = "";
        private string _telefonoId = "";
        private string _direccionEntrega = "";
        private string _nombreCliente = "";
        private string _pNitReal = "";
        private string _telefonoEntrega = "";

        generales _generales = new generales();
        creaTxt _log = new creaTxt();


        public string tokenAlmacenado;
        protected List<Direccion> direcciones; // Declaración de la lista
        public String idMunicipio;
        protected async void Page_Load(object sender, EventArgs e)
        {
            //divbtnabrirdirecciones.Visible = true;
            //divbtnabrirPopupFarmacias.Visible = false;
            //ASPxFormFormaPago.Visible = false;
            //ASPxFormFormaPago_TC.Visible = true;
            //ASPxFormFormaPago_Efectivo.Visible = false;

            tokenAlmacenado = HttpContext.Current.Session["AccessToken"] as string;



            string currentUrl = HttpContext.Current.Request.Url.ToString();
            Debug.WriteLine("Current URL: " + currentUrl);

             

            if (Session["AccessToken"] != null)
            {
                string accessToken = Session["AccessToken"].ToString();
                _nit = Request.QueryString["nit"] == null ? "" : Request.QueryString["nit"];
                _monto = Request.QueryString["monto"] == null ? "" : Request.QueryString["monto"];
                _busqCliente = Request.QueryString["busqCliente"] == null ? "" : Request.QueryString["busqCliente"];
                _CC = Request.QueryString["cc"] == null ? "0" : Request.QueryString["cc"];
                _Usuario = "admin";//Request.QueryString["usr"] == null ? "" : Request.QueryString["usr"];
                _guid = Request.QueryString["guid"] == null ? "" : Request.QueryString["guid"];
                _direccionId = Request.QueryString["pDir"] == null ? "" : Request.QueryString["pDir"];
                _telefonoId = Request.QueryString["pTel"] == null ? "" : Request.QueryString["pTel"];
                _direccionEntrega = Request.QueryString["pDirEnt"] == null ? "" : Request.QueryString["pDirEnt"];
                _nombreCliente = Request.QueryString["pNomCliente"] == null ? "" : Request.QueryString["pNomCliente"];
                _pNitReal = Request.QueryString["NitReal"] == null ? "" : Request.QueryString["NitReal"];
                _telefonoEntrega = Request.QueryString["pTelEnt"] == null ? "" : Request.QueryString["pTelEnt"];
                // En tu página ASP.NET, puedes asignar el token a una variable JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "tokenScript", $"var accessToken = '{accessToken}';", true);
            }
            else
            {


                // Obtén la cadena de consulta
                string queryString = Request.QueryString.ToString();

                if (!string.IsNullOrEmpty(queryString))
                {
                    // Procesa la cadena de consulta según tus necesidades
                    // En este ejemplo, mostramos un mensaje de alerta en el lado del cliente
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", $"ShowAlert('{queryString}');", true);
                }
                else
                {
                    // No hay cadena de consulta, manejar según sea necesario
                }

                string datos = Request.QueryString["datos"];
                string url = "Autenticar.aspx?datos=" + HttpUtility.UrlEncode(datos);
                Response.Redirect(url, false);



                //Response.Redirect(url, false);
                // Si la sesión está vacía o no contiene el token, haz algo (por ejemplo, muestra un mensaje de error)
                ClientScript.RegisterStartupScript(this.GetType(), "tokenError", "alert('No se encontró el token en la sesión.');", true);
            }






            if (!IsPostBack)
            {
                CargarAnio();
                CargarMes();
                CargarDepartamentos();

                CargarDepartamentosClientes();

 

            }
        }

        public string GeneraToken(string Usuario)
        {
            string str = "";
            if (Usuario != "")
            {
                Usuario usuario = new Usuario();
                usuario.userName = Usuario;
                usuario.password = "P@s@R3laP@G@";
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                string s = JsonConvert.SerializeObject((object)usuario);
                ServicePointManager.ServerCertificateValidationCallback = (RemoteCertificateValidationCallback)delegate
                {
                    return true;
                };
                string requestUriString = ConfigurationManager.AppSettings["API_TOKEN"].ToString();
                byte[] bytes = new ASCIIEncoding().GetBytes(s);
                HttpWebRequest httpWebRequest = WebRequest.Create(requestUriString) as HttpWebRequest;
                httpWebRequest.Method = "POST";
                httpWebRequest.ContentType = "application/json";
                httpWebRequest.ContentLength = (long)bytes.Length;
                httpWebRequest.Expect = "application/json";
                httpWebRequest.GetRequestStream().Write(bytes, 0, bytes.Length);
                try
                {
                    using (WebResponse response = httpWebRequest.GetResponse())
                    {
                        using (Stream responseStream = response.GetResponseStream())
                        {
                            if (responseStream == null)
                                return (string)null;
                            using (StreamReader streamReader = new StreamReader(responseStream))
                            {
                                string end = streamReader.ReadToEnd();
                                Console.WriteLine(end);
                                str = JsonConvert.DeserializeObject<jwt>(end).token;
                            }
                        }
                    }
                }
                catch (WebException ex)
                {
                }
            }
            return str;
        }

        static bool ValidateEmail(string email)
        {
            string pattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";

            Regex regex = new Regex(pattern);
            return regex.IsMatch(email);
        }

        //protected void btnTarjetaInfoCobrar_Click(object sender, EventArgs e)
        //{

        private void FinalizarCompra  ()
        {

             

            // ModalAlertas.ShowOnPageLoad = true;

            hdJWT.Value = GeneraToken(_Usuario);
            bool validaConexionBD = false;
            bool validaCorreoFunciona = false;
            int validaCorreoExiste = 0;

            string pNombre = txtPasarelaTarjetaNombre.Text;
            string pApellido = txtPasarelaCobroTarjetaApellido.Text;
            string pEmail = (chkTarjetaInfoCorreoNo.Checked == false ? txtTarjetaTipo.Text.ToLower() : "null@cybersource.com");
            string pTarjeta = txtTarjetaNvaNumero.Text;
            string pMesExpira =   ddlTarjetaInfoMes.SelectedValue.ToString();
            string pAnioExpira =  ddlTarjetaInfoAnio.SelectedValue.ToString();
            string pCvv = txtPedidoCodigoCCV.Text;
            string pCodigoCliente = txtuuidpasarela.Text;
            string pMonto = txtmontotarjeta.Text;
            string pIdBanco = "";
            string pCC = "1001";//_CC;
            string pJwt = hdJWT.Value;
            
            string pTelefonoId = "C719DA85-2FC4-4645-AF5F-EA689EC4BC02";///_telefonoId;
            //= "4 AV LOTE 9 1 - 50 LOTIFICACION CAÑADA Z.2 CAÑADA SUCHITEPEQU";//_direccionEntrega;
            string pDireccionEntrega;
            string txtDireccionEntregaClienteValue = txtdireccionpasarela.Text;
           string txtDireccionFarmaciaValue = txtDireccionFarmacia.Text;
            string pDireccionId;
            if (string.IsNullOrEmpty(txtDireccionEntregaClienteValue))
            {
                pDireccionEntrega = txtDireccionFarmaciaValue;
                  pDireccionId = txtDireccionEntregaClienteUUID.Text;
            }
            else if (string.IsNullOrEmpty(txtDireccionFarmaciaValue))
            {
                pDireccionEntrega = txtDireccionEntregaClienteValue;
                  pDireccionId = txtDireccionEntregaClienteUUID.Text;
            }
            else
            {
                pDireccionEntrega = "Sin Direccion";
                  pDireccionId = "Sin Direccion";
            }

            string pTelefonoEntrega = _telefonoEntrega;
            string pTarjetaInicia = "";
            string pValTarjeta = "";
            string pIpEquipo = "";

            pValTarjeta = txtTarjetaNvaNumero.Text;
            //pTarjetaInicia = pValTarjeta.Substring(0, 1);



            pTarjeta = pValTarjeta.Replace(" ", "");

            try
            {
                validaConexionBD = _generales.ValidaConexionBaseDatos();
            }
            catch (Exception ex)
            {
                _log.GuardaLog("Error btnTarjetaCobroCobrar ValidaConexionBaseDatos: " + ex.Message);
            }

            try
            {
                validaCorreoExiste = _generales.PerfilCorreoValidaExiste();
            }
            catch (Exception ex)
            {
                _log.GuardaLog("Error btnTarjetaCobroCobrar PerfilCorreoValidaExiste: " + ex.Message);
            }

            try
            {
                validaCorreoFunciona = _generales.PerfilCorreoValidaFuncionamiento();
            }
            catch (Exception ex)
            {
                _log.GuardaLog("Error btnTarjetaCobroCobrar PerfilCorreoValidaFuncionamiento: " + ex.Message);
            }

            if (validaConexionBD == false)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertaMsg", "alert('Error al comunicarse con el servidor interno');", true);
                return;
            }
            if (validaCorreoExiste != 1)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertaMsg", "alert('Error al comunicarse con el perfil de notificación');", true);
                return;
            }
            if (validaCorreoFunciona == false) //CORREO ENVIA SIN PROBLEMAS
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertaMsg", "alert('Error problemas en envio de notificación');", true);
                return;
            }

            try
            {
                RecuperaDatosIP();
                pIpEquipo = Session["PC_IP"].ToString();
            }
            catch (Exception ex)
            {
                RecuperaDatosIP();

                try
                {
                    pIpEquipo = Session["PC_IP"].ToString();
                }
                catch (Exception ex2)
                {
                    pIpEquipo = "";
                }
            }

            ServicePointManager.ServerCertificateValidationCallback = (RemoteCertificateValidationCallback)delegate
            {
                return true;
            };
            try
            {
                Pasarela pasarela = new Pasarela();
                PasarelaEstructura pasarelaEstructura = new PasarelaEstructura();
                string str1 = "";
                string Reference_number_val = "";
                string Auth_banco_val = "";

                DataTable dataTable1 = pasarela.PasarelaArmaXml("NOGUARDA");
                pasarelaEstructura.Secret_key = dataTable1.Rows[0]["secret_key"].ToString();
                pasarelaEstructura.Url = dataTable1.Rows[0]["noguarda_url"].ToString();
                pasarelaEstructura.Acces_key = dataTable1.Rows[0]["access_key"].ToString();
                pasarelaEstructura.Profile_id = dataTable1.Rows[0]["profile_id"].ToString();
                string str2 = "";
                str2 = pCC;
                pasarelaEstructura.Transaction_uuid = str2 + "|" + Guid.NewGuid().ToString();
                pasarelaEstructura.Signed_fields_names = dataTable1.Rows[0]["noguarda_signed_field_names"].ToString();
                pasarelaEstructura.Unsigned_fields_names = dataTable1.Rows[0]["noguarda_unsigned_field_names"].ToString();
                pasarelaEstructura.Signed_date_time = "";
                pasarelaEstructura.Locale = dataTable1.Rows[0]["locale"].ToString();
                pasarelaEstructura.Transaction_type = dataTable1.Rows[0]["noguarda_transaction_type"].ToString();
                pasarelaEstructura.Reference_number = "";
                pasarelaEstructura.Amount = pMonto;
                pasarelaEstructura.Currency = dataTable1.Rows[0]["currency"].ToString();
                pasarelaEstructura.Payment_method = dataTable1.Rows[0]["payment_method"].ToString();
                pasarelaEstructura.Signature = "";
                pasarelaEstructura.Bill_to_forename = pNombre;
                pasarelaEstructura.Bill_to_surname = pApellido;
                pasarelaEstructura.Bill_to_email = pEmail;
                DataTable dataTable3 = _generales.RecuperaInfoComplementariaCliente(pCodigoCliente, pDireccionId, pTelefonoId, pCC);
                pasarelaEstructura.Bill_to_phone = "";
                string valDireccionCybersource = (pDireccionEntrega == "" ? dataTable3.Rows[0]["direccion"].ToString() : pDireccionEntrega.ToUpper().ToString());
               // pasarelaEstructura.Bill_to_address_line1 = valDireccionCybersource.Substring(0, 59);


                if (!string.IsNullOrEmpty(valDireccionCybersource) && valDireccionCybersource.Length >= 59)
                {
                    pasarelaEstructura.Bill_to_address_line1 = valDireccionCybersource.Substring(0, 59);
                }
                else
                {
                    // Manejar el caso donde la cadena es nula, vacía o tiene menos de 59 caracteres
                    pasarelaEstructura.Bill_to_address_line1 = valDireccionCybersource;
                    // O asignar un valor predeterminado, dependiendo de tus necesidades
                }

                pasarelaEstructura.Bill_to_address_city = dataTable3.Rows[0]["departamento"].ToString();
                pasarelaEstructura.Bill_to_address_country = dataTable1.Rows[0]["bill_to_address_country"].ToString();
                string str3 = pTarjeta.Substring(0, 1);
                string str4 = pMesExpira + "-" + pAnioExpira;
                if (str3 == "4")
                    pasarelaEstructura.Card_type = dataTable1.Rows[0]["card_type_visa"].ToString();
                else if (str3 == "5")
                    pasarelaEstructura.Card_type = dataTable1.Rows[0]["card_type_master_card"].ToString();
                else if (str3 == "3")
                    pasarelaEstructura.Card_type = dataTable1.Rows[0]["card_type_american_express"].ToString();
                pasarelaEstructura.Card_number = pTarjeta;
                pasarelaEstructura.Card_expiry_date = str4;
                pasarelaEstructura.Card_cvn = pCvv;
                pasarelaEstructura.autoriza_american_xpress = "0";
                pasarelaEstructura.Payment_token = "";


                //try
                //{
                //    if (HttpContext.Current.Session["dfSessionId"].ToString() == "")
                //        HttpContext.Current.Session["dfSessionId"] = (object)Guid.NewGuid().ToString();
                //}
                //catch (Exception ex)
                //{
                //    HttpContext.Current.Session["dfSessionId"] = (object)Guid.NewGuid().ToString();
                //}

                if (HttpContext.Current != null)
                {
                    try
                    {
                        if (HttpContext.Current.Session["dfSessionId"] == null || HttpContext.Current.Session["dfSessionId"].ToString() == "")
                        {
                            HttpContext.Current.Session["dfSessionId"] = (object)Guid.NewGuid().ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        HttpContext.Current.Session["dfSessionId"] = (object)Guid.NewGuid().ToString();
                    }
                }
                //else
                //{
                //    // Manejar el caso en que HttpContext.Current es null
                //    // Por ejemplo, puedes generar un nuevo Guid directamente sin intentar acceder a la sesión.
                //}



                pasarelaEstructura.Device_fingerprint_id = HttpContext.Current.Session["dfSessionId"].ToString();
                ServicePointManager.ServerCertificateValidationCallback = (RemoteCertificateValidationCallback)delegate
                {
                    return true;
                };
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                string requestUriString = ConfigurationManager.AppSettings["API_COBRA_TARJETA"].ToString();
                string str5 = JsonConvert.SerializeObject((object)pasarelaEstructura);
                byte[] bytes = new ASCIIEncoding().GetBytes(str5);
                Console.WriteLine("JSON enviado: " + str5);

                //txtLog.Text = str5;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "AlertaPasarela", "alert('" + str5 + "');", true);

                //guardo Log en BD de la accion
                string pLogDelivery = "CYBERSOURCE-COMPRA|" + DateTime.Now.ToString("dd/MM/yyyy HH:mm") + "|" + pCodigoCliente.Trim() + "|Solicitud:" + str5;
                try
                {
                    _generales.InsertaLogCobro(_nit, pLogDelivery);
                }
                catch (Exception ex)
                {
                    _log.GuardaLog("Error Pasarela2: " + ex.Message);
                }

                HttpWebRequest httpWebRequest = WebRequest.Create(requestUriString) as HttpWebRequest;
                httpWebRequest.Headers.Add("Authorization", "Bearer " + pJwt);
                httpWebRequest.Method = "POST";
                httpWebRequest.ContentType = "application/json";
                httpWebRequest.ContentLength = (long)bytes.Length;
                httpWebRequest.Expect = "application/json";
                httpWebRequest.GetRequestStream().Write(bytes, 0, bytes.Length);
                try
                {
                    using (WebResponse response = httpWebRequest.GetResponse())
                    {
                        using (Stream responseStream = response.GetResponseStream())
                        {
                            if (responseStream == null)
                                return;

                            using (StreamReader streamReader = new StreamReader(responseStream))
                            {

                                 

                                string end = streamReader.ReadToEnd();



                                // Deserializar el JSON a una clase específica (TransferenciaResponse en este caso)
                                 
                                try
                                {


                                    RespuestaPago transferenciaResponse = JsonConvert.DeserializeObject<RespuestaPago>(end);
                                    // Ahora puedes acceder a las propiedades de transferenciaResponse según sea necesario
                                  

                                    // Acceder a las propiedades según sea necesario
                                    string authTransRefNo = transferenciaResponse.auth_trans_ref_no;
                                    string reasonCode = transferenciaResponse.reason_code;
                                    string referenceNumber = transferenciaResponse.reference_number;
                                    string authBanco = transferenciaResponse.auth_banco;
                                    decimal monto = transferenciaResponse.monto;
                                    string mensaje = transferenciaResponse.mensaje;
                                    string tarjeta = transferenciaResponse.tarjeta;

                                    // Imprimir el mensaje
                                    Console.WriteLine("Mensaje: " + mensaje);
                                   
                                }
                                catch (JsonSerializationException ex)
                                {
                                    // Manejo de errores específicos de la deserialización JSON
                                    Console.WriteLine("Error durante la deserialización JSON: " + ex.Message);
                                }
                                catch (Exception ex)
                                {
                                    // Manejo de errores generales
                                    Console.WriteLine("Error: " + ex.Message);
                                }


                                 

                                // txtresultadopagovisa.Text = mensaje;
                                //Console.WriteLine(end);

                                //guardo Log en txt como respaldo por si la BD cae
                                try
                                {



                                    string pLogGuardar = pLogDelivery + "|Respuesta:" + end;
                                    _log.GuardaLog(pLogGuardar);
                                }
                                catch (Exception ex)
                                {

                                }

                                str1 = end;
                                PasarelaCobroTokenResponse cobroTokenResponse = JsonConvert.DeserializeObject<PasarelaCobroTokenResponse>(end);
                                str1 = pasarela.GuardaTransaccionCobroToken(pCodigoCliente, "", cobroTokenResponse.auth_trans_ref_no, cobroTokenResponse.reason_code, cobroTokenResponse.reference_number, cobroTokenResponse.auth_banco, cobroTokenResponse.monto, pIdBanco, cobroTokenResponse.tarjeta, pCC, pEmail
                                    , pIpEquipo, _telefonoEntrega);


                                Reference_number_val = cobroTokenResponse.reference_number;
                                Auth_banco_val = cobroTokenResponse.auth_banco;
                                if (cobroTokenResponse.reason_code == "100")
                                {
                                    try
                                    {
                                         
                                        string msgJson = "";
                                        string msgCobro = str1;
                                        string[] splitMsgCobro = msgCobro.Split('|');

                                        //dtRespuesta.Rows[0]["sn_ok"].ToString() + "|" + dtRespuesta.Rows[0]["mensaje"].ToString() + "|" + pMonto + "|" + pIdBanco + "|" + pAuth_banco + "|" + pAuth_trans_ref_no;
                                        string jsId = "PasarelaPago";
                                        string jsBanco = splitMsgCobro[3];
                                        string jsAuthBanco = cobroTokenResponse.reference_number; //splitMsgCobro[4];
                                        string jsMonto = cobroTokenResponse.monto;
                                        string sms = splitMsgCobro[1];
                                        string jsAuthCybersource = splitMsgCobro[5];

                                        msgJson = jsId + "|" + jsBanco + "|" + jsAuthBanco + "|" + jsMonto + "|" + sms + "|" + jsAuthCybersource;
                                        //txtLog.Text = jsAuthBanco;

                                        //txtLog.BackColor = System.Drawing.Color.LightGreen;
                                        //txtLog.ForeColor = System.Drawing.Color.Black;
                                        // ScriptManager.RegisterStartupScript(Page, Page.GetType(), "EnviaPosgreen", "alert('" + sms + "');RespuestaPosgreen('" + msgJson + "');", true);


                                        // Get a reference to the client script manager
                                        ClientScriptManager cs = Page.ClientScript;
                                        // Define the JavaScript code to be executed
                                        bool resultadocobro;
                                        resultadocobro = true;
                                        string str1_true= "El pago se realizo con exito ";
                                        string script = @"


var Reference_number = document.getElementById('pReference_number');
    var pAuth_banco = document.getElementById('pAuth_banco');
    var resultadoResultadoCobro = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoResultadoCobro.style.backgroundColor = '#70e67e';
    resultadoResultadoCobro.style.color = 'black';
    resultadoResultadoCobro.innerText = 'true';
   

    resultadoMensaje.style.backgroundColor = '#70e67e';
    resultadoMensaje.style.color = 'black';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(str1_true + ". " + cobroTokenResponse.mensaje) + @"';


    Reference_number.innerText = '" + (Reference_number_val) + @"';
 

    Auth_banco.innerText = '" + (Auth_banco_val) + @"';
    Auth_banco.style.backgroundColor = '#70e67e';
    Auth_banco.style.color = 'black'; 
";

                                    }
                                    catch (Exception ex)
                                    {

                                    }
                                }
                                else
                                {
                                    if (cobroTokenResponse.reason_code != "100")
                                    {
 
                                        // Get a reference to the client script manager
                                        ClientScriptManager cs = Page.ClientScript;
                                        // Define the JavaScript code to be executed
                                        bool resultadocobro;
                                        resultadocobro = false;

                                        string script = @"


var Reference_number = document.getElementById('pReference_number');
    var pAuth_banco = document.getElementById('pAuth_banco');
    var resultadoResultadoCobro = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoResultadoCobro.style.backgroundColor = '#fe0419';
    resultadoResultadoCobro.style.color = 'white';
    resultadoResultadoCobro.innerText = 'false';
   

    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(str1 + ". " + cobroTokenResponse.mensaje) + @"';


    Reference_number.innerText = '" + (Reference_number_val) + @"';
 

    Auth_banco.innerText = '" + RemoveSpecialCharactersAndNumbers(Auth_banco_val) + @"';
    Auth_banco.style.backgroundColor = '#fe0419';
    Auth_banco.style.color = 'white';
 

";
                                        // Register the script block to be executed when the page loads
                                        cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);




                                        DataTable dataTable4 = _generales.ConsultaReasonCode(cobroTokenResponse.reason_code);
                                        if (dataTable4.Rows.Count > 0)
                                        {
                                            string str6 = dataTable4.Rows[0]["reason_descr"].ToString();
                                            //str1 = cobroTokenResponse.reason_code + "|" + str6;

                                            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "AlertaPasarela", "alert('" + str6 + "');", true);
                                        }
                                        else
                                        {
                                             

                                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "AlertaPasarela", "alert('" + cobroTokenResponse.mensaje + "');", true);
                                        }

                                        txtPasarelaTarjetaNombre.Text = "";
                                        txtPasarelaCobroTarjetaApellido.Text = "";
                                        txtTarjetaNvaNumero.Text = "";
                                        ddlTarjetaInfoMes.SelectedIndex = 0;
                                        ddlTarjetaInfoAnio.SelectedIndex = 0;


                                    }
                                }
                            }
                        }
                    }
                }

                catch (WebException ex)
                {
                    //postcredit();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "AlertaPasarela", "alert('" + ex.Message + "');", true);
                }
            }
            catch (Exception ex)
            {

                ErrorCobro = "Ingrese el nombre y apellido de la tarjeta";

                ClientScriptManager cs = Page.ClientScript;

                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');

 


    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '"" + RemoveSpecialCharactersAndNumbers(RemoveSpecialCharactersAndNumbers(ex.Message) + "". "" + cobroTokenResponse.mensaje) + @""';

";
                // Register the script block to be executed when the page loads
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "AlertaPasarela", "alert('" + ex.Message + "');", true);
            }
        }

        static string RemoveSpecialCharactersAndNumbers(string input)
        {
            // Utiliza una expresión regular para eliminar caracteres especiales y números

            string pattern = "[^a-zA-Z ]"; // Ahora también incluye espacio en blanco
            Regex regex = new Regex(pattern);
            return regex.Replace(input, "");


        }
        private void CargarMes()
        {
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
        }

        private void CargarAnio()
        {
            ddlTarjetaInfoAnio.Items.Clear();

            int finAnio = DateTime.Today.Year + 10;
            for (int i = DateTime.Today.Year; i <= finAnio; i++)
            {
                ddlTarjetaInfoAnio.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
        protected void ShowAlert(string message, string tipo)
        {
            //ModalAlertas.ShowCloseButton = true;

            ////ASPxLabel lblModalTestNotificacion = modalPrueba.FindControl("lblModalTestNotificacion") as ASPxLabel;
            //if (tipo == "ERROR")
            //{

            //    //lblToastMessageImage.Text = "<i class='material-icons' style='font-size:75px;color:#d9534f'>error</i>";
            //    ASPxButton1.BackColor = System.Drawing.ColorTranslator.FromHtml("#d9534f");
            //    lblModalTestNotificacion.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d9534f");


            //    if (lblModalTestNotificacion != null)
            //    {
            //        lblModalTestNotificacion.Text = message;
            //    }



            //    ModalAlertas.ShowOnPageLoad = true;
            //}
            //if (tipo == "OK")
            //{

            //    lblModalTestNotificacion.Text = message;

            //    lblModalTestNotificacion.ForeColor = System.Drawing.ColorTranslator.FromHtml("#3cb879");

            //   // lblToastMessageImage.Text = "<i class='material-icons' style='font-size:75px;color:#3cb879'>check_circle</i>";

            //    ASPxButton1.BackColor = System.Drawing.ColorTranslator.FromHtml("#3cb879");

            //    ModalAlertas.ShowOnPageLoad = true;
            //}

            //if (tipo == "AVISO")
            //{

            //    lblModalTestNotificacion.Text = message;
            //    lblModalTestNotificacion.ForeColor = System.Drawing.ColorTranslator.FromHtml("#6094D4");

            //    //lblToastMessageImage.Text = "<i class='material-icons' style='font-size:75px;color:#6094D4'>file_copy</i>";

            //    ASPxButton1.BackColor = System.Drawing.ColorTranslator.FromHtml("#6094D4");


            //    ModalAlertas.ShowOnPageLoad = true;
            //}


        }
        private void CargarDepartamentos()
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
                            Guid codigoDepartamento = departamento.id;
                            string nombreDepartamento = departamento.nombre;



                            // Crea un ListItem con el nombre como texto y el código como valor
                            ListItem item = new ListItem(nombreDepartamento, codigoDepartamento.ToString());
                            // Agrega el ListItem al DropDownList
                            ddlDepartamentos_New.Items.Add(item);




                            // Puedes utilizar estos datos como desees
                        }
                    }
                    else
                    {
                        // El API devolvió un resultado 'false', puedes manejarlo aquí
                    }
                }
                catch (Exception)
                {
                    // Maneja cualquier error que ocurra durante la solicitud
                    //Label1.Text = "Error al obtener los departamentos: " + ex.Message;
                }
            }
        }
        private void CargarDepartamentosClientes()
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
                            Guid codigoDepartamento = departamento.id;
                            string nombreDepartamento = departamento.nombre;



                            // Crea un ListItem con el nombre como texto y el código como valor
                            ListItem item = new ListItem(nombreDepartamento, codigoDepartamento.ToString());
                            // Agrega el ListItem al DropDownList

                            ddlDepartamentos_Nuevo.Items.Add(item);



                            // Puedes utilizar estos datos como desees
                        }
                    }
                    else
                    {
                        // El API devolvió un resultado 'false', puedes manejarlo aquí
                    }
                }
                catch (Exception)
                {
                    // Maneja cualquier error que ocurra durante la solicitud
                    //Label1.Text = "Error al obtener los departamentos: " + ex.Message;
                }
            }
        }

        public class ResponseData
        {
            public List<Direccion> Resultado { get; set; }
        }


        protected string GetHtml(string filePath)
        {
            string content = string.Empty;
            try
            {
                // Lee el contenido del archivo
                content = System.IO.File.ReadAllText(Server.MapPath(filePath));
            }
            catch (Exception ex)
            {
                // Maneja cualquier error al leer el archivo
                // Por ejemplo, puedes registrar el error o realizar alguna otra acción.
                // También podrías devolver un mensaje de error en lugar de una cadena vacía.
                content = "Error al leer el archivo: " + ex.Message;
            }
            return content;
        }

        private void CargarMunicipio(string pIdDepartamento, int pCombo)
        {
            try
            {
                bool existeDatos = false;
                // Obtener el código de departamento seleccionado en el DropDownList de departamentos
                string codigoDepartamento = (string)pIdDepartamento;

                // Realizar la solicitud HTTP a la API con el código de departamento como parámetro
                // string urlValue = Seguridad.DesEncripta(ConfigurationManager.AppSettings["API_MUNICIPIO"].ToString());

                string urlValue = "https://farmappcia.bofasa.com/api/departamento/{codigoDepartamento}/municipios";

                string apiUrl = urlValue.Replace("{codigoDepartamento}", codigoDepartamento);



                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(apiUrl).Result;

                    // Deserializar la respuesta JSON como un JObject
                    JObject jsonMunicipio = JObject.Parse(response);

                    // Acceder a los datos dentro del objeto y llenar el DropDownList
                    JArray jsonMunicipiosArray = (JArray)jsonMunicipio["data"];

                    // Limpiar DropDownList de municipios
                    //ddlDireccionesSitioMunicipio.Items.Clear();
                    //ddlDireccionesClienteMunicipio.Items.Clear();

                    //ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Municipio", "0"));
                    //ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Municipio", "0"));

                    // Recorrer el JArray y agregar los datos al DropDownList de municipios
                    foreach (JObject municipio in jsonMunicipiosArray.OrderBy(x => (string)x["nombre"]))
                    {
                        existeDatos = true;
                        string id = (string)municipio["id"];
                        string nombre = (string)municipio["nombre"];

                        if (pCombo == 1)
                        {
                            ddlMunicipios_New.Items.Add(new ListItem(nombre, id));

                            //ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                        }
                        else
                        {
                            if (pCombo == 2)
                            {
                                //ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                            }
                        }
                    }
                }

                if (existeDatos == false)
                {
                    //ddlDireccionesSitioMunicipio.Items.Clear();
                    //ddlDireccionesClienteMunicipio.Items.Clear();

                    //ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Sin Municipios", "-1"));
                    //ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Sin Municipios", "-1"));

                    //ddlDireccionesSitioMunicipio.SelectedIndex = 0;
                    //ddlDireccionesClienteMunicipio.SelectedIndex = 0;
                }

                //ddlDireccionesSitioMunicipio.SelectedIndex = 0;
                //ddlDireccionesClienteMunicipio.SelectedIndex = 0;
            }
            catch (Exception)
            {

            }
        }

        private void CargarMunicipioNuevaDireccion(string pIdDepartamento, int pCombo)
        {
            try
            {
                bool existeDatos = false;
                // Obtener el código de departamento seleccionado en el DropDownList de departamentos
                string codigoDepartamento = (string)pIdDepartamento;

                // Realizar la solicitud HTTP a la API con el código de departamento como parámetro
                // string urlValue = Seguridad.DesEncripta(ConfigurationManager.AppSettings["API_MUNICIPIO"].ToString());

                string urlValue = "https://farmappcia.bofasa.com/api/departamento/{codigoDepartamento}/municipios";

                string apiUrl = urlValue.Replace("{codigoDepartamento}", codigoDepartamento);



                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(apiUrl).Result;

                    // Deserializar la respuesta JSON como un JObject
                    JObject jsonMunicipio = JObject.Parse(response);

                    // Acceder a los datos dentro del objeto y llenar el DropDownList
                    JArray jsonMunicipiosArray = (JArray)jsonMunicipio["data"];

                    // Limpiar DropDownList de municipios
                    //ddlDireccionesSitioMunicipio.Items.Clear();
                    //ddlDireccionesClienteMunicipio.Items.Clear();

                    //ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Municipio", "0"));
                    //ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Municipio", "0"));

                    // Recorrer el JArray y agregar los datos al DropDownList de municipios
                    foreach (JObject municipio in jsonMunicipiosArray.OrderBy(x => (string)x["nombre"]))
                    {
                        existeDatos = true;
                        string id = (string)municipio["id"];
                        string nombre = (string)municipio["nombre"];

                        if (pCombo == 1)
                        {
                            ddlMunicipios_Nuevo.Items.Add(new ListItem(nombre, id));

                            //ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                        }
                        else
                        {
                            if (pCombo == 2)
                            {
                                //ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                            }
                        }
                    }
                }

                if (existeDatos == false)
                {
                    //ddlDireccionesSitioMunicipio.Items.Clear();
                    //ddlDireccionesClienteMunicipio.Items.Clear();

                    //ddlDireccionesSitioMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Sin Municipios", "-1"));
                    //ddlDireccionesClienteMunicipio.Items.Add(new DevExpress.Web.ListEditItem("Sin Municipios", "-1"));

                    //ddlDireccionesSitioMunicipio.SelectedIndex = 0;
                    //ddlDireccionesClienteMunicipio.SelectedIndex = 0;
                }

                //ddlDireccionesSitioMunicipio.SelectedIndex = 0;
                //ddlDireccionesClienteMunicipio.SelectedIndex = 0;
            }
            catch (Exception)
            {

            }
        }
        protected void ddlDepartamentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obtener el código del departamento seleccionado
            string codigoDepartamento = (ddlDepartamentos_New.SelectedValue);

            // Llamar al método para cargar los municipios relacionados con el departamento
            CargarMunicipio(codigoDepartamento, 1);
        }


        private void CargarZonas(string pIdMunicipio, int pCombo)
        {
            try
            {

                idMunicipio = pIdMunicipio;
                bool existeDatos = false;
                // Obtener el código de departamento seleccionado en el DropDownList de departamentos
                string codigoMunicipio = (string)pIdMunicipio;

                // Realizar la solicitud HTTP a la API con el código de departamento como parámetro
                // string urlValue = Seguridad.DesEncripta(ConfigurationManager.AppSettings["API_ZONA"].ToString());
                string urlValue = "https://farmappcia.bofasa.com/api/municipio/{codigoMunicipio}/zonas";
                string apiUrl = urlValue.Replace("{codigoMunicipio}", codigoMunicipio);
                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(apiUrl).Result;

                    // Deserializar la respuesta JSON como un JObject
                    JObject jsonZonas = JObject.Parse(response);

                    // Acceder a los datos dentro del objeto y llenar el DropDownList
                    JArray jsonZonasArray = (JArray)jsonZonas["data"];

                    // Limpiar DropDownList de municipios
                    ddlDireccionesSitioZona_New.Items.Clear();
                    //ddlDireccionesClienteZona.Items.Clear();

                    //ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));
                    //ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));

                    // Recorrer el JArray y agregar los datos al DropDownList de municipios
                    foreach (JObject municipio in jsonZonasArray)
                    {
                        existeDatos = true;
                        string id = (string)municipio["id"];
                        string nombre = (string)municipio["nombre"];

                        if (pCombo == 1)
                        {
                            //ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                            // ddlDireccionesSitioZona.Items.Add(nombre);
                            ddlDireccionesSitioZona_New.Items.Add(new ListItem(nombre, id));
                        }
                        else
                        {
                            if (pCombo == 2)
                            {
                                // ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                            }
                        }

                    }
                }

                if (existeDatos == false)
                {
                    //ddlDireccionesSitioZona.Items.Clear();
                    //ddlDireccionesClienteZona.Items.Clear();

                    //ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem("Sin Zonas", "-1"));
                    //ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem("Sin Zonas", "-1"));

                    //ddlDireccionesSitioZona.SelectedIndex = 0;
                    //ddlDireccionesClienteZona.SelectedIndex = 0;
                }

                //ddlDireccionesSitioZona.SelectedIndex = 0;
                //ddlDireccionesClienteZona.SelectedIndex = 0;
            }
            catch (Exception)
            {

            }
        }


        private void CargarZonas_nueva_direccion(string pIdMunicipio, int pCombo)
        {
            try
            {

                idMunicipio = pIdMunicipio;
                bool existeDatos = false;
                // Obtener el código de departamento seleccionado en el DropDownList de departamentos
                string codigoMunicipio = (string)pIdMunicipio;

                // Realizar la solicitud HTTP a la API con el código de departamento como parámetro
                // string urlValue = Seguridad.DesEncripta(ConfigurationManager.AppSettings["API_ZONA"].ToString());
                string urlValue = "https://farmappcia.bofasa.com/api/municipio/{codigoMunicipio}/zonas";
                string apiUrl = urlValue.Replace("{codigoMunicipio}", codigoMunicipio);
                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(apiUrl).Result;

                    // Deserializar la respuesta JSON como un JObject
                    JObject jsonZonas = JObject.Parse(response);

                    // Acceder a los datos dentro del objeto y llenar el DropDownList
                    JArray jsonZonasArray = (JArray)jsonZonas["data"];

                    // Limpiar DropDownList de municipios
                    // ddlFarmacias.Items.Clear();
                    //ddlDireccionesClienteZona.Items.Clear();

                    //ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));
                    //ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Zona", "0"));

                    // Recorrer el JArray y agregar los datos al DropDownList de municipios
                    foreach (JObject municipio in jsonZonasArray)
                    {
                        existeDatos = true;
                        string id = (string)municipio["id"];
                        string nombre = (string)municipio["nombre"];

                        if (pCombo == 1)
                        {
                            //ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                            // ddlDireccionesSitioZona.Items.Add(nombre);
                            ddlDireccionesSitioZona_NuevoCliente.Items.Add(new ListItem(nombre, id));
                        }
                        else
                        {
                            if (pCombo == 2)
                            {
                                // ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem(nombre, id));
                            }
                        }

                    }
                }

                if (existeDatos == false)
                {
                    //ddlDireccionesSitioZona.Items.Clear();
                    //ddlDireccionesClienteZona.Items.Clear();

                    //ddlDireccionesSitioZona.Items.Add(new DevExpress.Web.ListEditItem("Sin Zonas", "-1"));
                    //ddlDireccionesClienteZona.Items.Add(new DevExpress.Web.ListEditItem("Sin Zonas", "-1"));

                    //ddlDireccionesSitioZona.SelectedIndex = 0;
                    //ddlDireccionesClienteZona.SelectedIndex = 0;
                }

                //ddlDireccionesSitioZona.SelectedIndex = 0;
                //ddlDireccionesClienteZona.SelectedIndex = 0;
            }
            catch (Exception)
            {

            }
        }
        protected void ddlMunicipios_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obtener el código del departamento seleccionado
            string codigoMunicipio = (ddlMunicipios_New.SelectedValue);

            // Llamar al método para cargar los municipios relacionados con el departamento
            CargarZonas(codigoMunicipio, 1);


        }
        public class Direccion
        {
            public string CodigoDireccion { get; set; }
            public string Direccion1 { get; set; }
            public string Alias { get; set; }
            public string Colonia { get; set; }
            public string NumeroCasa { get; set; }
            public string Indicaciones { get; set; }
            public Zona Zona { get; set; }
            public Municipio Municipio { get; set; }
            public Departamento Departamento { get; set; }
        }

        public class Zona
        {
            public string Id { get; set; }
            public string Nombre { get; set; }
        }

        public class Municipio
        {
            public string Id { get; set; }
            public string Nombre { get; set; }
            public int CodigoMunicipio { get; set; }
        }

        //public class Departamento
        //{
        //    public string Id { get; set; }
        //    public int Codigo_departamento { get; set; }
        //    public string Nombre { get; set; }
        //}

        public class RespuestaDireccion
        {
            public bool Resultado { get; set; }
            public string Mensaje { get; set; }
            public List<Direccion> Data { get; set; }
        }






        //    protected void ddlDireccionesCliente_SelectedIndexChanged(object sender, EventArgs e)
        //    {

        //       int id = Convert.ToInt32(ddlTipoEnvio.SelectedItem.Value);

        //        if (id == 0)
        //        {
        //            //Cliente
        //            ddlDireccionesSitioZona.Items.Clear();

        //            ddlDireccionesSitioZona.SelectedValue = "1";
        //            //divDireccionesCliente.Visible = true;
        //            //divDireccionesFarmacia.Visible = false;
        //        }
        //        else
        //        {
        //            if (id == 1)
        //            {
        //                 //ddlDireccionesSitioFarmacia.Items.Clear();
        //                 //ddlDireccionesSitioFarmacia.Items.Add(new DevExpress.Web.ListEditItem("Seleccionar Farmacia", 0));
        //                 //ddlDireccionesSitioFarmacia.SelectedIndex = 0;

        //                 //divDireccionesFarmacia.Visible = true;
        //                //divDireccionesCliente.Visible = false;
        //            }
        //            else
        //            {
        //                //divDireccionesFarmacia.Visible = false;
        //                //divDireccionesCliente.Visible = false;
        //            }
        //    }
        //}

        protected void ddlDireccionesSitioZona_SelectedIndexChanged(object sender, EventArgs e)
        {

            string idZona = (ddlFarmacias.SelectedValue);

            //CargarFarmacias(1, idMunicipio, idZona, 1, 1);


            // Llamar al método para cargar los municipios relacionados con el departamento

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ShowAlert("Direccion establecida", "OK");

        }

        [WebMethod]
        public static string ejecutarEvento(string codigoDireccion)
        {
            // Realiza alguna lógica del lado del servidor usando el código de dirección recibido

            // Devuelve una respuesta al cliente
            return "¡Evento ejecutado correctamente!";
        }

        protected void btnTurnoDetalleAgregar_Click(object sender, EventArgs e)
        {

        }

        protected void ddlDepartamentos_SelectedIndexChanged1(object sender, EventArgs e)
        {
            // Obtener el código del departamento seleccionado
            string codigoDepartamento = (ddlDepartamentos_New.SelectedValue);

            // Llamar al método para cargar los municipios relacionados con el departamento
            CargarMunicipio(codigoDepartamento, 1);
        }

        protected void ddlMunicipios_SelectedIndexChanged1(object sender, EventArgs e)
        {
            // Obtener el código del departamento seleccionado
            string codigoMunicipio = (ddlMunicipios_New.SelectedValue);

            // Llamar al método para cargar los municipios relacionados con el departamento
            CargarZonas(codigoMunicipio, 1);


        }

        protected void ddlDireccionesSitioZona_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string idZona = (ddlDireccionesSitioZona_New.SelectedValue);

            CargarFarmacias(1, idMunicipio, idZona, 1, 1);


            // Llamar al método para cargar los municipios relacionados con el departamento
        }

        private void CargarFarmacias(int CodigoCadena, string codigoMunicipio, string codigoZona, int NumeroPagina, int TamanoPagina)
        {
            try
            {
                // Construir la URL del API con los parámetros necesarios
                string apiUrl = $"https://farmappcia.bofasa.com/api/farmacia?CodigoCadena={CodigoCadena}&CodigoMunicipio={codigoMunicipio}&CodigoZona={codigoZona}&NumeroPagina={NumeroPagina}&TamanoPagina={TamanoPagina}";

                using (var httpClient = new HttpClient())
                {
                    var response = httpClient.GetStringAsync(apiUrl).Result;

                    // Deserializar la respuesta JSON como un objeto
                    var jsonData = JsonConvert.DeserializeObject<FarmaciaData>(response);

                    // Acceder a los datos dentro del objeto "jsonData" y llenar el DropDownList
                    ddlFarmacias.Items.Clear();

                    foreach (var farmacia in jsonData.data.data)
                    {
                        string id = farmacia.codigoFarmacia;
                        string nombre = farmacia.nombre;
                        ddlFarmacias.Items.Add(new ListItem(nombre, id));
                    }

                    ddlFarmacias.SelectedIndex = 0;
                }
            }
            catch (Exception)
            {
                // Manejar cualquier excepción que pueda ocurrir durante la solicitud
                // Por ejemplo, puedes mostrar un mensaje de error al usuario
                // lblError.Text = "Ocurrió un error al cargar los datos del API: " + ex.Message;
            }
        }


        private async Task EnviarDatosAlServicio()
        {

            // Tu lógica para enviar los datos al servicio aquí
            // Puedes usar la lógica que ya tienes para enviar la solicitud POST al servicio API.
            // Por ejemplo, si ya tienes el código para enviar datos mediante una solicitud HTTP, puedes llamarlo desde aquí.

            // Datos para enviar en la solicitud POST
            var data = new
            {
                direccion = txtdireccionCliente_New.Text,
                //alias = txtAliasCliente.Text,
                //colonia = txtColoniaCliente_New.Text,
                // Agregar otros campos según sea necesario
            };
            // URL del servicio API
            var apiUrl = "https://farmappcia.bofasa.com/api/direccion"; // Reemplaza con la URL correcta

            // Token de autorización
            var accessToken = "Tu_Token_Aquí"; // Reemplaza con tu token de autorización

            using (var client = new HttpClient())
            {
                // Agregar el token de autorización en los headers
                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + accessToken);

                // Convertir los datos a formato JSON
                var content = new StringContent(Newtonsoft.Json.JsonConvert.SerializeObject(data), System.Text.Encoding.UTF8, "application/json");

                try
                {
                    // Enviar la solicitud POST
                    var response = await client.PostAsync(apiUrl, content);

                    // Verificar si la solicitud fue exitosa (código de estado 200-299)
                    if (response.IsSuccessStatusCode)
                    {
                        // Procesar la respuesta si es necesario
                        var responseData = await response.Content.ReadAsStringAsync();
                        Console.WriteLine("Respuesta: " + responseData);
                    }
                    else
                    {
                        // Si la solicitud no fue exitosa, manejar el error aquí
                        Console.WriteLine("Error al enviar la solicitud. Código de estado: " + response.StatusCode);
                    }
                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción que pueda ocurrir durante la solicitud
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }




        protected async void ASPxButton2_Click(object sender, EventArgs e)
        {

            try
            {
                await EnviarDatosAlServicio();
            }
            catch (Exception)
            {
                // Manejar la excepción aquí
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                EnviarDatosAlServicio();
            }
            catch (Exception)
            {
                // Manejar la excepción aquí
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // Registro del script JavaScript que muestra la alerta
            string script = "alert('¡Hola! Esta es una alerta desde el servidor.');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }

        protected void ddlDireccionesSitioZona_SelectedIndexChanged2(object sender, EventArgs e)
        {
            string idZona = (ddlDireccionesSitioZona_New.SelectedValue);

            CargarFarmacias(1, idMunicipio, idZona, 1, 1);
        }
        protected void ASPxPageControl4_ActiveTabChanged1(object sender, EventArgs e)
        {
            // Tu lógica aquí
        }

        protected void ddlDepartamentos_Nuevo_SelectedIndexChanged(object sender, EventArgs e)
        {


            // Obtener el valor seleccionado del DropDownList
            string valorSeleccionado = ddlDepartamentos_Nuevo.SelectedValue;

            // Asignar el valor seleccionado al TextBox
            // dpto.Text = valorSeleccionado;


            // Obtener el código del departamento seleccionado
            string codigoDepartamento = (ddlDepartamentos_Nuevo.SelectedValue);
            //nombreTarjeta.value = codigoDepartamento;
            // Llamar al método para cargar los municipios relacionados con el departamento
            CargarMunicipioNuevaDireccion(codigoDepartamento, 1);
        }

        protected void ddlMunicipios_Nuevo_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obtener el código del departamento seleccionado
            string codigoMunicipio = (ddlMunicipios_Nuevo.SelectedValue);

            // Llamar al método para cargar los municipios relacionados con el departamento
            CargarZonas_nueva_direccion(codigoMunicipio, 1);
        }

        protected void ddlDireccionesSitioZona_New_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idZona = (ddlDireccionesSitioZona_New.SelectedValue);

            CargarFarmacias(1, idMunicipio, idZona, 1, 1);
        }

        protected void enviarDatosAPI_NuevaDireccion()
        {
            // Tu lógica para enviar datos a la API
        }

        //protected void btnServer_Click(object sender, EventArgs e)
        //{
        //    popup2.ShowOnPageLoad = false;
        //    string startUpScript = string.Format("ShowInfo('Server', '{0}');", textBox.Text);
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "ANY_KEY", startUpScript, true);
        //}

 


 
 
        private void RecuperaDatosIP()
        {
            try
            {
                string IP = Request.UserHostName;
                IPAddress myIP = IPAddress.Parse(IP);
                IPHostEntry GetIPHost = Dns.GetHostEntry(myIP);

                try
                {
                    string pIpAddressList = "";
                    string pIpAddress = "";
                    bool pValidaIp = false;
                    IPAddress[] pValListIp = GetIPHost.AddressList;

                    for (int i = 0; i < pValListIp.Length; i++)
                    {
                        try
                        {
                            pIpAddressList = pValListIp[i].ToString();
                            pValidaIp = ValidateIPv4(pIpAddressList);//IPAddress.TryParse(pIpAddressList, out ip);

                            if (pValidaIp == true && pIpAddress == "")
                            {
                                pIpAddress = pIpAddressList;
                            }
                        }
                        catch (Exception)
                        {

                        }
                    }

                    if (pIpAddress == "")
                    {
                        pIpAddress = Request.UserHostAddress;
                    }

                    Session["PC_IP"] = pIpAddress;
                }
                catch (Exception ex)
                {

                }
            }
            catch (Exception)
            {

            }
        }

        public bool ValidateIPv4(string ipString)
        {
            if (String.IsNullOrWhiteSpace(ipString))
            {
                return false;
            }

            string[] splitValues = ipString.Split('.');
            if (splitValues.Length != 4)
            {
                return false;
            }

            byte tempForParsing;

            return splitValues.All(r => byte.TryParse(r, out tempForParsing));
        }

        public void SeccionInformacion()
        {
            string pTarjetaInicia = "";
            string pValTarjeta = "";
            string pReplaceTarjeta = "";
            string pTipoTarjeta = "";
            string tarjetaUltDigitos = "";
            string tarjetaMask = "";
            int tarjetaMaskInicio = 0;

            pValTarjeta = txtTarjetaNvaNumero.Text;
            pTarjetaInicia = pValTarjeta.Substring(0, 1);
            pReplaceTarjeta = pValTarjeta.Replace(" ", "");
            tarjetaMaskInicio = pReplaceTarjeta.Length;

            if (pTarjetaInicia == "4")
            {
                pTipoTarjeta = "VISA";
            }
            else
            {
                if (pTarjetaInicia == "5")
                {
                    pTipoTarjeta = "MASTERCARD";
                }
                else
                {
                    //ERROR
                }
            }

            if (tarjetaMaskInicio == 16)
            {
                tarjetaUltDigitos = pReplaceTarjeta.Substring(12, 4);
                tarjetaMask = "XXXX XXXX XXXX " + tarjetaUltDigitos;
            }
            else
            {
                //ERROR
            }

            //txtPasarelaCobroTarjetaCliente.Text = _nit + "-" + _nombreCliente.Trim().ToUpper();
            //txtPasarelaCobroTarjetaTelefonoEnt.Text = _telefonoEntrega.Trim().ToUpper();
            //txtPasarelaCobroTarjetaDireccionEnt.Text = _direccionEntrega.Trim().ToUpper();
            //txtPasarelaCobroTarjetaNombre.Text = xxx.Text.Trim().ToUpper();
            //txtPasarelaCobroTarjetaApellido.Text = txtPasarelaTarjetaApellido.Text.Trim().ToUpper();
            //txtPasarelaCobroTipo.Text = pTipoTarjeta;
            //txtPasarelaCobroTarjetaNumero.Text = tarjetaMask;
            //txtPasarelaCobroTarjetaMontoPago.Text = _monto;
        }


        protected void btnEnviarSolicitud0_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtLog.Text))
            {


                //FinalizarCompra();


            }
            else
            {
                //ModalAlertas.ShowOnPageLoad = true;
            }
        }
        string ErrorCobro;
        protected void btnTarjetaInfoCobrar_Click(object sender, EventArgs e)
        {

             
           

        }

    
         

        //protected void btnseleccionarTarjeta_Click(object sender, EventArgs e)
        //{
        //     ASPxFormFormaPago.Visible = false;
        //    ASPxFormFormaPago_TC.Visible = true;
        //    ASPxFormFormaPago_Efectivo.Visible= false;
            
        //    ASPxCheckBox1_Tarjeta.Checked = true;
        //    ASPxCheckBox2_SaludEmpresa.Checked = false;
        //    ASPxCheckBox3_Efectivo.Checked = false;

        //    // ASPxCheckBox1_Tarjeta.Text = "TARJETA DE CREDITO";


                
        //}

          

        //protected void btnseleccionarSaludEmpresa_Click(object sender, EventArgs e)
        //{
        //    ASPxFormFormaPago.Visible = true;
        //    ASPxFormFormaPago_TC.Visible = false;
        //    ASPxFormFormaPago_Efectivo.Visible = false;
            
        //    //btnseleccionarSaludEmpresa.Checked = true;

        //    ASPxCheckBox1_Tarjeta.Checked = false;
        //    ASPxCheckBox2_SaludEmpresa.Checked = true;
        //    ASPxCheckBox3_Efectivo.Checked = false;




        //} 
  
        //protected void btnEfectivo_Click(object sender, EventArgs e)
        //{
        //    ASPxFormFormaPago.Visible = false;
        //    ASPxFormFormaPago_TC.Visible = false;
        //    ASPxFormFormaPago_Efectivo.Visible = true;

        //    ASPxCheckBox1_Tarjeta.Checked = false;
        //    ASPxCheckBox2_SaludEmpresa.Checked = false;
        //    ASPxCheckBox3_Efectivo.Checked = true;
        //}

        protected void txtTarjetaNvaNumero_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxButton3_Click(object sender, EventArgs e)
        {
           


            RealizarAccionDelBoton();

            string pDireccionEntrega;
            string txtDireccionEntregaClienteValue = "aqui va la direccion del cliente"; //txtDireccionEntregaCliente.Text;
            string txtDireccionFarmaciaValue = txtDireccionFarmacia.Text;
            string valortj =  txtmontotarjeta.Text;

             

            //< span id = "total" > 0.00 </ span >

            string valortarjeta = (txtmontotarjeta.Text);


            if (string.IsNullOrEmpty(txtDireccionEntregaClienteValue) && (string.IsNullOrEmpty(txtDireccionFarmaciaValue)))
            {



                ErrorCobro = "Error: Debe seleccionar la direccion, puede ser la del cliente o la de alguna farmacia";

                ClientScriptManager cs = Page.ClientScript;

                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(ErrorCobro) + @"'";
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);
            }


            else if (string.IsNullOrEmpty(txtPasarelaTarjetaNombre.Text) || string.IsNullOrEmpty(txtPasarelaCobroTarjetaApellido.Text))
            {

                ErrorCobro = "Ingrese el nombre y apellido ";


                ClientScriptManager cs = Page.ClientScript;

                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(ErrorCobro) + @"'";
                // Register the script block to be executed when the page loads
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);
            }
            else if (string.IsNullOrEmpty(txtPasarelaNombreTarjeta.Text))
            {
                // Mensaje de error


                ClientScriptManager cs = Page.ClientScript;

                ErrorCobro = "Ingrese el nombre de la tarjeta";


                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(ErrorCobro) + @"'";
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);

            }

            else if (string.IsNullOrEmpty(ddlTarjetaInfoAnio.Text) || (string.IsNullOrEmpty(ddlTarjetaInfoMes.Text)))
            {

                ErrorCobro = "Ingrese la fecha de vencimiento de la tarjeta";

                ClientScriptManager cs = Page.ClientScript;

                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(ErrorCobro) + @"'";
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);
            }

            else if (string.IsNullOrEmpty(txtTarjetaNvaNumero.Text))
            {



                ErrorCobro = "Ingrese el numero de la tarjeta";

                ClientScriptManager cs = Page.ClientScript;

                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(ErrorCobro) + @"'";
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);
            }
            else if (string.IsNullOrEmpty(txtPedidoCodigoCCV.Text))
            {


                ErrorCobro = "Ingrese el codigo CCV de la tarjeta";

                ClientScriptManager cs = Page.ClientScript;

                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(ErrorCobro) + @"'";
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);

            }

          

            else if (  valortarjeta == "0")


            {
                ClientScriptManager cs = Page.ClientScript;
                string caca2 =  (txtmontotarjeta.Text);

                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", caca2, true);
                ErrorCobro = "Ingrese el monto a pagar con la tarjeta";

               

                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 
    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(ErrorCobro) + @"'";
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);
            }



            else if (string.IsNullOrEmpty(txtTarjetaNvaNumero.Text))
            {


                ErrorCobro = "Ingrese el número de tarjeta";

                ClientScriptManager cs = Page.ClientScript;

                string script = @"
    var resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    var resultadoResultado = document.getElementById('resultadoResultado');
    var resultadoMensaje = document.getElementById('resultadoMensaje');
 resultadoResultadoCobro = document.getElementById('resultadoResultadoCobro');
    resultadoMensaje.style.backgroundColor = '#fe0419';
    resultadoMensaje.style.color = 'white';
    resultadoMensaje.innerText = '" + RemoveSpecialCharactersAndNumbers(ErrorCobro) + @"'";
                cs.RegisterStartupScript(this.GetType(), "SetStylesScript", script, true);

            }
            else
            {
                FinalizarCompra();
            }

        }

        protected void btnseleccionarTarjeta_Click1(object sender, EventArgs e)
        {
            ASPxFormFormaPago.Visible = false;
            ASPxFormFormaPago_TC.Visible = true;
            ASPxFormFormaPago_Efectivo.Visible = false;

            //ASPxCheckBox1_Tarjeta.Checked = true;
            //ASPxCheckBox2_SaludEmpresa.Checked = false;
            //ASPxCheckBox3_Efectivo.Checked = false;

        }

       

        protected void btnEfectivo_Click1(object sender, EventArgs e)
        {
            ASPxFormFormaPago.Visible = false;
            ASPxFormFormaPago_TC.Visible = false;
            ASPxFormFormaPago_Efectivo.Visible = true;

            //ASPxCheckBox1_Tarjeta.Checked = false;
            //ASPxCheckBox2_SaludEmpresa.Checked = false;
            //ASPxCheckBox3_Efectivo.Checked = true;
        }

        protected void ASPxButton2_Click1(object sender, EventArgs e)
        {
            ASPxFormFormaPago.Visible = true;
            ASPxFormFormaPago_TC.Visible = false;
            ASPxFormFormaPago_Efectivo.Visible = false;

            //btnseleccionarSaludEmpresa.Checked = true;

            //ASPxCheckBox1_Tarjeta.Checked = false;
            //ASPxCheckBox2_SaludEmpresa.Checked = true;
            //ASPxCheckBox3_Efectivo.Checked = false;

        }

        protected void txtPasarelaCobroTarjetaMontoPago_TextChanged(object sender, EventArgs e)
        {

        }
    }
    }
 
