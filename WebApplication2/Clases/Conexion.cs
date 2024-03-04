using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication2.Clases
{ 
        public class Conexion
        {
            private SqlConnection SQLconexion = null;

            public SqlConnection ConexionSQL
            {
                get
                {
                    return SQLconexion;
                }
                set
                {
                    SQLconexion = value;
                }
            }

            public DataTable LlenarDataTableSQL(string Query)
            {
                try
                {
                    SQLconexion.Open();
                    SqlCommand sqlCommand = new SqlCommand(Query, SQLconexion);
                    DataTable dataTable = new DataTable();
                    dataTable.Load(sqlCommand.ExecuteReader());
                    SQLconexion.Close();
                    return dataTable;
                }
                catch (SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    if (SQLconexion != null && SQLconexion.State == ConnectionState.Open)
                    {
                        SQLconexion.Close();
                    }
                }
            }

            public DataSet LlenarDataSetSQL(string Query)
            {
                try
                {
                    SQLconexion.Open();
                    SqlCommand selectCommand = new SqlCommand(Query, SQLconexion);
                   // using SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectCommand);
                using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectCommand))
                {
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);
                    SQLconexion.Close();
                    return dataSet;
                }

               
                }
                catch (SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    if (SQLconexion != null && SQLconexion.State == ConnectionState.Open)
                    {
                        SQLconexion.Close();
                    }
                }
            }

            public LinkedList<string> ObtenerColumnaDataTable(DataTable loadDT)
            {
                try
                {
                    LinkedList<string> linkedList = new LinkedList<string>();
                    foreach (DataColumn column in loadDT.Columns)
                    {
                        linkedList.AddLast(column.ColumnName);
                    }

                    return linkedList;
                }
                catch (SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
            }

            public bool EjecutarQuery(string Query)
            {
                try
                {
                    SQLconexion.Open();
                    SqlCommand sqlCommand = new SqlCommand(Query, SQLconexion);
                    sqlCommand.ExecuteNonQuery();
                    SQLconexion.Close();
                    return true;
                }
                catch (SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    if (SQLconexion != null && SQLconexion.State == ConnectionState.Open)
                    {
                        SQLconexion.Close();
                    }
                }
            }

            public DataTable EjecutarQueryStoreProcedure(string StoreProcedure, Hashtable Parametros)
            {
                try
                {
                    SQLconexion.Open();
                    SqlCommand sqlCommand = new SqlCommand(StoreProcedure.Trim(), SQLconexion);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    foreach (DictionaryEntry Parametro in Parametros)
                    {
                        sqlCommand.Parameters.AddWithValue("@" + Parametro.Key, Parametro.Value);
                    }

                    DataTable dataTable = new DataTable();
                    sqlCommand.CommandTimeout = 900000;
                    dataTable.Load(sqlCommand.ExecuteReader());
                    SQLconexion.Close();
                    return dataTable;
                }
                catch (SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    if (SQLconexion != null && SQLconexion.State == ConnectionState.Open)
                    {
                        SQLconexion.Close();
                    }
                }
            }
        }
    }
 