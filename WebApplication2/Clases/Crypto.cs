#region ensamblado DB, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// C:\DATA\CODIGO\PasarelaPagoCybersource\PasarelaPagoCybersource\PasarelaPagoCybersource\bin\DB.dll
// Decompiled with ICSharpCode.Decompiler 7.1.0.6543
#endregion

using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace DB
{
    public class Crypto
    {
        private byte[] _salt = Encoding.ASCII.GetBytes("o6806642kbM7c5");

        public string DecryptCadena(string TextoAdesencryp, string Patron)
        {
            if (string.IsNullOrEmpty(TextoAdesencryp))
            {
                throw new ArgumentNullException("TextoAdesencryp");
            }

            if (string.IsNullOrEmpty(Patron))
            {
                throw new ArgumentNullException("Patron");
            }

            RijndaelManaged rijndaelManaged = null;
            string result = null;
           // "Initial Catalog=DB_GEN_CALL_CENTER;Data Source=192.200.9.131;User Id=sa;password=bofasa1$;Min Pool Size=10;Max Pool Size=30;"
            try
            {
                //Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(Patron, _salt);
                //rijndaelManaged = new RijndaelManaged();
                //rijndaelManaged.Key = rfc2898DeriveBytes.GetBytes(rijndaelManaged.KeySize / 8);
                //ICryptoTransform transform = rijndaelManaged.CreateEncryptor(rijndaelManaged.Key, rijndaelManaged.IV);
                //using MemoryStream memoryStream = new MemoryStream();
                //memoryStream.Write(BitConverter.GetBytes(rijndaelManaged.IV.Length), 0, 4);
                //memoryStream.Write(rijndaelManaged.IV, 0, rijndaelManaged.IV.Length);
                //using (CryptoStream stream = new CryptoStream(memoryStream, transform, CryptoStreamMode.Write))
                //{
                //    using StreamWriter streamWriter = new StreamWriter(stream);
                //    streamWriter.Write(TextoAdesencryp);
                //}

                result = "Initial Catalog=DB_GEN_CALL_CENTER;Data Source=192.200.9.131;User Id=sa;password=bofasa1$;Min Pool Size=10;Max Pool Size=30;";// Convert.ToBase64String(memoryStream.ToArray());
            }
            finally
            {
                rijndaelManaged?.Clear();
            }

            return result;
        }
    
 
  
        private static byte[] ReadByteArray(Stream s)
        {
            byte[] array = new byte[4];
            if (s.Read(array, 0, array.Length) != array.Length)
            {
                throw new SystemException("Array no tiene el formato correcto");
            }

            byte[] array2 = new byte[BitConverter.ToInt32(array, 0)];
            if (s.Read(array2, 0, array2.Length) != array2.Length)
            {
                throw new SystemException("No se puede leer el array");
            }

            return array2;
        }
    }

}
#if false // Registro de descompilación
"28" elementos en caché
------------------
Resolver: "mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
Se encontró un solo ensamblado: "mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
AVISO: No coinciden las versiones. Se esperaba "2.0.0.0", se obtuvo "4.0.0.0"
Cargar desde: "C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5.2\mscorlib.dll"
------------------
Resolver: "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
Se encontró un solo ensamblado: "System.Data, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
AVISO: No coinciden las versiones. Se esperaba "2.0.0.0", se obtuvo "4.0.0.0"
Cargar desde: "C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5.2\System.Data.dll"
------------------
Resolver: "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
Se encontró un solo ensamblado: "System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
AVISO: No coinciden las versiones. Se esperaba "2.0.0.0", se obtuvo "4.0.0.0"
Cargar desde: "C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5.2\System.dll"
------------------
Resolver: "System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
Se encontró un solo ensamblado: "System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
AVISO: No coinciden las versiones. Se esperaba "2.0.0.0", se obtuvo "4.0.0.0"
Cargar desde: "C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5.2\System.Xml.dll"
------------------
Resolver: "mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
Se encontró un solo ensamblado: "mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
Cargar desde: "C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5.2\mscorlib.dll"
#endif
