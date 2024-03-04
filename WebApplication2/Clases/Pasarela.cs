using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;
using Newtonsoft.Json;

namespace WebApplication2.Clases
{
    public class Pasarela
    {
        generales _generales = new generales();

        public DataTable PasarelaArmaXml(string pLlave)
        {
            DataTable dtInfo = new DataTable("PasarelaParametros");
            dtInfo.Columns.Add("access_key");
            dtInfo.Columns.Add("profile_id");
            dtInfo.Columns.Add("locale");
            dtInfo.Columns.Add("currency");
            dtInfo.Columns.Add("secret_key");

            if (pLlave == "TOKEN")
            {
                dtInfo.Columns.Add("token_transaction_type");
                dtInfo.Columns.Add("token_signed_field_names");
                dtInfo.Columns.Add("token_unsigned_field_names");
                dtInfo.Columns.Add("payment_method");
                dtInfo.Columns.Add("bill_to_address_country");
                dtInfo.Columns.Add("token_url");
                dtInfo.Columns.Add("card_type_visa");
                dtInfo.Columns.Add("card_type_master_card");
            }
            else
            {
                if (pLlave == "COBRO")
                {
                    dtInfo.Columns.Add("cobro_transaction_type");
                    dtInfo.Columns.Add("cobro_signed_field_names");
                    dtInfo.Columns.Add("cobro_unsigned_field_names");
                    dtInfo.Columns.Add("cobro_url");
                }
                else
                {
                    if (pLlave == "NOGUARDA")
                    {
                        dtInfo.Columns.Add("noguarda_transaction_type");
                        dtInfo.Columns.Add("noguarda_signed_field_names");
                        dtInfo.Columns.Add("noguarda_unsigned_field_names");
                        dtInfo.Columns.Add("noguarda_url");
                        dtInfo.Columns.Add("bill_to_address_country");
                        dtInfo.Columns.Add("card_type_visa");
                        dtInfo.Columns.Add("card_type_master_card");
                        dtInfo.Columns.Add("payment_method");
                        dtInfo.Columns.Add("card_type_american_express");
                    }
                }
            }

            StringBuilder xml = new StringBuilder();
            xml.AppendLine("<BusquedaPasarelaParametros>");
            xml.AppendLine("<LLAVE>" + pLlave + "</LLAVE>");
            xml.AppendLine("</BusquedaPasarelaParametros>");
            XmlDocument XML = new XmlDocument();

            try
            {
                XML.LoadXml(_generales.Datos_XML(xml.ToString()));
                String raiz = "/PASARELA";
                System.Xml.XmlNodeList xnList = XML.SelectNodes(raiz);
                foreach (System.Xml.XmlNode xn in xnList)
                {
                    DataRow row = dtInfo.NewRow();
                    row["access_key"] = xn["access_key"].InnerText;
                    row["profile_id"] = xn["profile_id"].InnerText;
                    row["locale"] = xn["locale"].InnerText;
                    row["currency"] = xn["currency"].InnerText;
                    row["secret_key"] = xn["secret_key"].InnerText;

                    if (pLlave == "TOKEN")
                    {
                        row["token_transaction_type"] = xn["token_transaction_type"].InnerText;
                        row["token_signed_field_names"] = xn["token_signed_field_names"].InnerText;
                        row["token_unsigned_field_names"] = xn["token_unsigned_field_names"].InnerText;
                        row["payment_method"] = xn["payment_method"].InnerText;
                        row["bill_to_address_country"] = xn["bill_to_address_country"].InnerText;
                        row["token_url"] = xn["token_url"].InnerText;
                        row["card_type_visa"] = xn["card_type_visa"].InnerText;
                        row["card_type_master_card"] = xn["card_type_master_card"].InnerText;
                    }
                    else
                    {
                        if (pLlave == "COBRO")
                        {
                            row["cobro_transaction_type"] = xn["cobro_transaction_type"].InnerText;
                            row["cobro_signed_field_names"] = xn["cobro_signed_field_names"].InnerText;
                            row["cobro_unsigned_field_names"] = xn["cobro_unsigned_field_names"].InnerText;
                            row["cobro_url"] = xn["cobro_url"].InnerText;
                        }
                        else
                        {
                            if (pLlave == "NOGUARDA")
                            {
                                row["noguarda_transaction_type"] = xn["noguarda_transaction_type"].InnerText;
                                row["noguarda_signed_field_names"] = xn["noguarda_signed_field_names"].InnerText;
                                row["noguarda_unsigned_field_names"] = xn["noguarda_unsigned_field_names"].InnerText;
                                row["noguarda_url"] = xn["noguarda_url"].InnerText;
                                row["bill_to_address_country"] = xn["bill_to_address_country"].InnerText;
                                row["card_type_visa"] = xn["card_type_visa"].InnerText;
                                row["card_type_master_card"] = xn["card_type_master_card"].InnerText;
                                row["payment_method"] = xn["payment_method"].InnerText;
                                row["card_type_american_express"] = xn["card_type_american_express"].InnerText;
                            }
                        }
                    }

                    dtInfo.Rows.Add(row);
                }

                return dtInfo;
            }
            catch (Exception ex)
            {
                return dtInfo;
                throw new System.ArgumentException(ex.Message);
            }
        }

        public string GuardaTarjetaToken(string pCodCliente, string pNombre, string pApellido, string pTarjeta, string pPaymentToken, string pTipoTarjeta, string pBanco)
        {
            string respuesta = "";
            StringBuilder xml = new StringBuilder();
            xml.AppendLine("<PasarelaTokenInsert>");
            xml.AppendLine("<CODIGO>" + pCodCliente + "</CODIGO>");
            xml.AppendLine("<NOMBRE>" + pNombre + "</NOMBRE>");
            xml.AppendLine("<APELLIDO>" + pApellido + "</APELLIDO>");
            xml.AppendLine("<TARJETA>" + pTarjeta + "</TARJETA>");
            xml.AppendLine("<PAYMENT>" + pPaymentToken + "</PAYMENT>");
            xml.AppendLine("<TIPO>" + pTipoTarjeta + "</TIPO>");
            xml.AppendLine("<BANCO>" + pBanco + "</BANCO>");
            xml.AppendLine("</PasarelaTokenInsert>");

            DataTable dtRespuesta = new DataTable();
            dtRespuesta = _generales.GuardaInformacionPasarela(xml.ToString());
            respuesta = dtRespuesta.Rows[0]["sn_ok"].ToString() + "|" + dtRespuesta.Rows[0]["mensaje"].ToString() + "|" + pPaymentToken;

            return respuesta;
        }

        public string GuardaTransaccionCobroToken(string pNit, string pPaymentToken, string pAuth_trans_ref_no, string pReason_code, string pReference_number, string pAuth_banco,
            string pMonto, string pIdBanco, string pTarjeta, string pCC, string pEmail, string pIpEquipo, string pTelefono)
        {
            string respuesta = "";
            string UTIENDA = "";

            if (pCC.Trim() == "")
            {
                UTIENDA = "0";
            }
            else
            {
                UTIENDA = pCC;
            }

            StringBuilder xml = new StringBuilder();
            xml.AppendLine("<PasarelaCobroTokenInsert>");
            xml.AppendLine("<CODIGO>" + pNit + "</CODIGO>");
            xml.AppendLine("<PAYMENT>" + pPaymentToken + "</PAYMENT>");
            xml.AppendLine("<AUTOTRANSREFNO>" + pAuth_trans_ref_no + "</AUTOTRANSREFNO>");
            xml.AppendLine("<REASONCODE>" + pReason_code + "</REASONCODE>");
            xml.AppendLine("<REFERENCENUMBER>" + pReference_number + "</REFERENCENUMBER>");
            xml.AppendLine("<AUTHBANCO>" + pAuth_banco + "</AUTHBANCO>");
            xml.AppendLine("<MONTO>" + pMonto + "</MONTO>");
            xml.AppendLine("<TARJETA>" + pTarjeta + "</TARJETA>");
            xml.AppendLine("<UTIENDA>" + UTIENDA + "</UTIENDA>");
            xml.AppendLine("<EMAIL>" + pEmail + "</EMAIL>");
            xml.AppendLine("<IPEQUIPO>" + pIpEquipo + "</IPEQUIPO>");
            xml.AppendLine("<TELEFONO>" + pTelefono + "</TELEFONO>");
            xml.AppendLine("</PasarelaCobroTokenInsert>");

            DataTable dtRespuesta = new DataTable();
            dtRespuesta = _generales.GuardaInformacionPasarela(xml.ToString());
            respuesta = dtRespuesta.Rows[0]["sn_ok"].ToString() + "|" + dtRespuesta.Rows[0]["mensaje"].ToString() + "|" + pMonto + "|" + pIdBanco + "|" + pAuth_banco + "|" + pAuth_trans_ref_no;

         
            return respuesta;


        }

        public string DesactivaTarjetaCliente(string pPaymentToken)
        {
            string respuesta = "";

            StringBuilder xml = new StringBuilder();
            xml.AppendLine("<DesactivarToken>");
            xml.AppendLine("<PAYMENT>" + pPaymentToken + "</PAYMENT>");
            xml.AppendLine("</DesactivarToken>");

            DataTable dtRespuesta = new DataTable();
            dtRespuesta = _generales.GuardaInformacionPasarela(xml.ToString());
            respuesta = dtRespuesta.Rows[0]["sn_ok"].ToString() + "|" + dtRespuesta.Rows[0]["mensaje"].ToString();

            return respuesta;
        }
    }
}