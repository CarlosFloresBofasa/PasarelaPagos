using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Helpers;
 using DB;
using WebApplication2.Clases;
namespace WebApplication2.Clases
{
    public class generales
    {
        public DataTable RecuperaCorreoCliente(string pNit)
        {
            string Query = "EXEC spc_tbl_cliente_unico_transaccion_email  @nit = '" + pNit + "'";
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            return conexion.LlenarDataTableSQL(Query);
        }

        public string Datos_XML(string XML)
        {
            try
            {
                DataTable dataTable = ObtenerDatos(XML);
                string str = "";
                if (dataTable.Rows.Count > 0)
                {
                    foreach (DataRow row in (InternalDataCollectionBase)dataTable.Rows)
                        str = row.Field<object>(0).ToString();
                }
                return str;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        private DataTable ObtenerDatos(string XML)
        {
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            string Query = "EXECUTE [APLICACION].[SP_PROC_BUSQUEDA] @XML= '" + XML + "'";
            return conexion.LlenarDataTableSQL(Query);
        }

        public DataTable GuardaInformacionPasarela(string xml)
        {
            DataTable dataTable = new DataTable();
            return new Conexion()
            {
                ConexionSQL = new SqlConnection(new Crypto().DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"))
            }.LlenarDataTableSQL("EXECUTE [SP_PROC_PASARELA] '" + xml.ToString() + "'");
        }

        public DataTable RecuperaInfoComplementariaCliente(
          string pCodCliente,
          string pDireccionId,
          string pTelefonoId,
          string pCC)
        {
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            string Query = "EXECUTE [SPC_PASARELA_RECUPERA_INFO_COMP_CLIENTE] @nit='" + pCodCliente + "', @pDireccionId='" + pDireccionId + "', @pTelefonoId='" + pTelefonoId + "', @pIdFarmacia=" + pCC;
            return conexion.LlenarDataTableSQL(Query);
        }

        public DataTable InsertaLogCobro(string pNit, string pJson)
        {
            string Query = "EXEC spi_tbl_cybersource_log  @nit = '" + pNit + "', @json = '" + pJson + "'";
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            return conexion.LlenarDataTableSQL(Query);
        }

        public DataTable ConsultaReasonCode(string pReasonCode)
        {
            string Query = "EXEC spc_tbl_cyberource_reason_code  @reason_code = '" + pReasonCode + "'";
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            return conexion.LlenarDataTableSQL(Query);
        }

        public bool ValidaConexionBaseDatos()
        {
            bool pRespuesta = false;

            try
            {
                Crypto crypto = new Crypto();

                // Verificar que crypto no sea null antes de usarlo
                if (crypto != null)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["CadenadeConexion"]?.ToString();

                    // Verificar que la cadena de conexión no sea null antes de continuar
                    if (!string.IsNullOrEmpty(connectionString))
                    {
                        SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(connectionString, "bofasa1$"));

                        try
                        {
                            sqlConnection.Open();
                            pRespuesta = true;
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"Error en ValidaConexionBaseDatos al abrir la conexión: {ex.Message}");
                            pRespuesta = false;
                        }
                        finally
                        {
                            if (sqlConnection.State == ConnectionState.Open)
                            {
                                sqlConnection.Close();
                            }
                        }
                    }
                    else
                    {
                        Console.WriteLine("La cadena de conexión es nula o vacía.");
                    }
                }
                else
                {
                    Console.WriteLine("El objeto Crypto es nulo.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error en ValidaConexionBaseDatos: {ex.Message}");
                pRespuesta = false;
            }

            return pRespuesta;
        }

        public int PerfilCorreoValidaExiste()
        {
            int pRespuesta = 0;
            string Query = "SELECT COUNT(1) FROM msdb.dbo.sysmail_profile WHERE name = 'PasarelaPago'"
                ;

            Crypto crypto = new Crypto();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));

            try
            {
                SqlCommand command = new SqlCommand(Query, sqlConnection);

                sqlConnection.Open();
                pRespuesta = (int)command.ExecuteScalar();
            }
            catch (Exception ex)
            {
                pRespuesta = 0;
            }

            return pRespuesta;
        }

        public bool PerfilCorreoValidaFuncionamiento()
        {
            bool pRespuesta = false;
            string Query = "EXEC msdb.dbo.sp_send_dbmail @profile_name='PasarelaPago', @recipients='Pasarela@FuncionaCorreo', @subject='Prueba Funcionamiento', @body='Prueba Funcionamiento', @body_format='HTML'"
                ;
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;

            try
            {
                pRespuesta = conexion.EjecutarQuery(Query);
            }
            catch (Exception ex)
            {
                pRespuesta = false;
            }

            return pRespuesta;
        }

        public DataTable BlackListAntiFraude(string pTelefono, string pDireccion, string pCodigoCliente, string pNIT)
        {
            string Query = "EXEC spc_tbl_pasarela_black_list_antifraude " +
                 "@telefono_entrega = '" + pTelefono + "'" +
                 ",@direccion_entrega = '" + pDireccion + "'" +
                 ",@codigo_cliente = '" + pCodigoCliente + "'" +
                 ",@nit = '" + pNIT + "'"
                ;
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            return conexion.LlenarDataTableSQL(Query);

        }
        public DataTable BlackListAntiFraudeInsertAutoriza(string pIdBlackList, string pUsuario, string pIpEquipo, string pComentarios, string pUsuarioCajero)
        {
            string Query = "EXEC spi_tbl_pasareala_black_list_justificacion " +
                 "@id_black_list = " + (pIdBlackList == "" ? "NULL" : pIdBlackList) + "" +
                 ",@usuario_confirma = " + (pIdBlackList == "" ? "NULL" : "'" + pUsuario + "'") +
                 ",@ip_equipo = '" + pIpEquipo + "'" +
                 ",@comentarios = '" + pComentarios + "'" +
                 ",@usuario_cajero = '" + pUsuarioCajero + "'"
                ;
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            return conexion.LlenarDataTableSQL(Query);

        }
        public DataTable BlackListAntiFraudeValidaAcceso(string pUsuario, string pContrasena)
        {
            string Query = "EXEC spc_tbl_pasareala_black_list_valida_credenciales " +
                 "@usuario = " + pUsuario + "" +
                 ",@contrasena = '" + pContrasena + "'"
                ;
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            return conexion.LlenarDataTableSQL(Query);

        }
        public DataTable BlackListRecupera(string pEstado, string pNumeroEnc)
        {
            string Query = "EXEC spc_tbl_pasareala_black_list " +
                 "@estado = " + (pEstado == "" ? "NULL" : pEstado) +
                 ", @no_tarjeta = " + (pNumeroEnc == "" ? "NULL" : "'" + pNumeroEnc + "'")
                ;
            Conexion conexion = new Conexion();
            Crypto crypto = new Crypto();
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(crypto.DecryptCadena(ConfigurationManager.ConnectionStrings["CadenadeConexion"].ToString(), "bofasa1$"));
            conexion.ConexionSQL = sqlConnection;
            return conexion.LlenarDataTableSQL(Query);

        }
    }
}