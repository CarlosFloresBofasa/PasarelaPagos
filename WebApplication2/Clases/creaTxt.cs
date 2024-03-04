using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebApplication2.Clases
{
    public class creaTxt
    {
        public void GuardaLog(string pJson)
        {
            try
            {
                string folderPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "LOG");
                string nameTxt = DateTime.Today.ToString("yyyyMMdd") + ".txt";
                string filePath = Path.Combine(folderPath, nameTxt);

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                bool fileExists = File.Exists(filePath);

                // Crear o abrir el archivo en modo de escritura
                StreamWriter sw;
                if (fileExists)
                {
                    // Si el archivo ya existe, abrirlo en modo de apendice y agregar una nueva línea antes de guardar el JSON
                    sw = new StreamWriter(filePath, true);
                    sw.WriteLine();
                }
                else
                {
                    // Si el archivo no existe, crearlo y abrirlo en modo de escritura
                    sw = new StreamWriter(filePath);
                }

                // Guardar el JSON en el archivo
                sw.Write(pJson);

                // Cerrar el archivo
                sw.Close();
            }
            catch (Exception ex)
            {

            }
        }
    }
}