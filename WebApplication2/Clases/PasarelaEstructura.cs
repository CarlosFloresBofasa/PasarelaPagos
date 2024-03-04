using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.Clases
{
    public class PasarelaEstructura
    {
     
        public string Secret_key { get; set; }
        public string Url { get; set; }
        public string Acces_key { get; set; }
        public string Profile_id { get; set; }
        public string Transaction_uuid { get; set; }
        public string Signed_fields_names { get; set; }
        public string Unsigned_fields_names { get; set; }
        public string Signed_date_time { get; set; }
        public string Locale { get; set; }
        public string Transaction_type { get; set; }
        public string Reference_number { get; set; }
        public string Amount { get; set; }
        public string Currency { get; set; }
        public string Payment_method { get; set; }
        public string Bill_to_forename { get; set; }
        public string Bill_to_surname { get; set; }
        public string Bill_to_email { get; set; }
        public string Bill_to_phone { get; set; }
        public string Bill_to_address_line1 { get; set; }
        public string Bill_to_address_city { get; set; }
        public string Bill_to_address_country { get; set; }
        public string Signature { get; set; }
        public string Card_type { get; set; }
        public string Card_number { get; set; }
        public string Card_expiry_date { get; set; }
        public string Card_cvn { get; set; }
        public string Payment_token { get; set; }
        public string Device_fingerprint_id { get; set; }
        public string autoriza_american_xpress { get; set; }
    }
}