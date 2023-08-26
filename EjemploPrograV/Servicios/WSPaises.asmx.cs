using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using EjemploPrograV.Modelos;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

namespace EjemploPrograV.Servicios
{
    /// <summary>
    /// Descripción breve de WSPaises
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WSPaises : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }

        [WebMethod]
        public string getDate()
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand("SELECT SYSDATE FROM DUAL", con);
                string fecha = cmd.ExecuteScalar().ToString();
                con.Close();
                return fecha;
            }
            catch (Exception ex)
            {
                con.Close();
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public List<Paises> getAllPaises()
        {
            DataTable dt = new DataTable();
            List<Paises> lista = new List<Paises>();
            String sqlPais = PaisesQueries.selectPais().ToString();

            try
            {
                using (OracleConnection con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SYSTEM"].ConnectionString))
                {
                    using (OracleCommand cmd = new OracleCommand(sqlPais, con))
                    {
                        con.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                lista.Add(new Paises
                                {
                                    idPaid = dt.Rows[i]["ID_PAIS"].ToString(),
                                    nombrePais = dt.Rows[i]["NOMBRE"].ToString(),
                                    abreviaturaPais = dt.Rows[i]["ABREVIATURA"].ToString(),
                                    estadoPais = dt.Rows[i]["ESTADO"].ToString(),
                                    usuarioGraba = dt.Rows[i]["USUARIO_GRABACION"].ToString(),
                                    fechaGraba = dt.Rows[i]["FECHA_GRABACION"].ToString(),
                                    usuarioEdita = dt.Rows[i]["USUARIO_MODIFICACION"].ToString(),
                                    fechaEdita = dt.Rows[i]["FECHA_MODIFICACION"].ToString()
                                });
                            }
                            return lista;
                        }
                        else
                        {
                            lista.Add(new Paises
                            {
                                bandera = "No hay datos ".ToString()
                            });
                            return lista;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista.Add(new Paises
                {
                    bandera = "Error " + ex.ToString()
                });
                return lista;
            }
        }


        [WebMethod]
        public List<Paises> getPais(int idPais)
        {
            DataTable dt = new DataTable();
            List<Paises> lista = new List<Paises>();
            String sqlPais = PaisesQueries.selectPaisEspecifico().ToString();

            try
            {
                using (OracleConnection con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SYSTEM"].ConnectionString))
                {
                    using (OracleCommand cmd = new OracleCommand(sqlPais, con))
                    {
                        cmd.Parameters.Add("ID_PAIS", idPais);
                        con.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                lista.Add(new Paises
                                {
                                    idPaid = dt.Rows[i]["ID_PAIS"].ToString(),
                                    nombrePais = dt.Rows[i]["NOMBRE"].ToString(),
                                    abreviaturaPais = dt.Rows[i]["ABREVIATURA"].ToString(),
                                    estadoPais = dt.Rows[i]["ESTADO"].ToString(),
                                    usuarioGraba = dt.Rows[i]["USUARIO_GRABACION"].ToString(),
                                    fechaGraba = dt.Rows[i]["FECHA_GRABACION"].ToString(),
                                    usuarioEdita = dt.Rows[i]["USUARIO_MODIFICACION"].ToString(),
                                    fechaEdita = dt.Rows[i]["FECHA_MODIFICACION"].ToString()
                                });
                            }
                            return lista;
                        }
                        else
                        {
                            lista.Add(new Paises
                            {
                                bandera = "No hay datos ".ToString()
                            });
                            return lista;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista.Add(new Paises
                {
                    bandera = "Error " + ex.ToString()
                });
                return lista;
            }
        }

        [WebMethod]
        public string insertPais(string pais, string abreviatura, string estado)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlInsPais = PaisesQueries.insertPais().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlInsPais, con);

                cmd.Parameters.Add("PAIS", pais.Trim().ToUpper());
                cmd.Parameters.Add("ABREVIATURA", abreviatura.Trim().ToUpper());
                cmd.Parameters.Add("ESTADO", estado.Trim().ToUpper());

                cmd.ExecuteNonQuery();
                con.Close();
                return "SUCCESS";

            }
            catch (Exception ex)
            {
                con.Close();
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public string updatePais(string pais, string abreviatura, int idPais, string estado)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlInsPais = PaisesQueries.updatePais().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlInsPais, con);

                cmd.Parameters.Add("PAIS", pais.Trim().ToUpper());
                cmd.Parameters.Add("ABREVIATURA", abreviatura.Trim().ToUpper());
                cmd.Parameters.Add("ESTADO", estado.Trim().ToUpper());
                cmd.Parameters.Add("ID_PAIS", idPais);

                cmd.ExecuteNonQuery();
                con.Close();
                return "SUCCESS";

            }
            catch (Exception ex)
            {
                con.Close();
                return "Error " + ex.ToString();
            }
        }


       
        [WebMethod]
        public string deletePais(int idPais)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlInsPais = PaisesQueries.deletePais().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlInsPais, con);

                cmd.Parameters.Add("ID_PAIS", idPais);

                cmd.ExecuteNonQuery();
                con.Close();
                return "SUCCESS";

            }
            catch (Exception ex)
            {
                con.Close();
                return "Error " + ex.ToString();
            }
        }


        [WebMethod]
        public List<Paises> getAllPaisesCMB()
        {
            DataTable dt = new DataTable();
            List<Paises> lista = new List<Paises>();
            string sqlPais = PaisesQueries.selectPaisCMB();

            try 
            {
                using (OracleConnection con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SYSTEM"].ConnectionString))
                {
                    using (OracleCommand cmd = new OracleCommand(sqlPais, con))
                    {                        
                        con.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                lista.Add(new Paises
                                {
                                    idPaid = dt.Rows[i]["ID_PAIS"].ToString(),
                                    nombrePais = dt.Rows[i]["NOMBRE"].ToString()
                                });
                            }
                            return lista;
                        }
                        else
                        {
                            lista.Add(new Paises
                            {
                                bandera = "No hay datos ".ToString()
                            });
                            return lista;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista.Add(new Paises
                {
                    bandera = "Error " + ex.ToString()
                });
                return lista;

            }
        }

        
        [WebMethod]
        public string getCantidad()
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlCantidad = PaisesQueries.cantidadPaises();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlCantidad, con);
                string cantidad = cmd.ExecuteScalar().ToString();
                con.Close();
                return cantidad;
            }
            catch (Exception ex)
            {
                con.Close();
                return "Error " + ex.ToString();
            }
        }

    }
 }

