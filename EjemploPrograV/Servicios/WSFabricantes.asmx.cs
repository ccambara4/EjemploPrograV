using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using EjemploPrograV.Modelos;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

namespace EjemploPrograV.Servicios
{
    /// <summary>
    /// Descripción breve de WSFabricantes
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WSFabricantes : System.Web.Services.WebService
    {

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
        public List<Fabricantes> getAllFabri()
        {
            DataTable dt = new DataTable();
            List<Fabricantes> lista = new List<Fabricantes>();
            String sqlFabri = FabricantesQuerys.selectFabri().ToString();

            try
            {
                using (OracleConnection con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SYSTEM"].ConnectionString))
                {
                    using (OracleCommand cmd = new OracleCommand(sqlFabri, con))
                    {
                        con.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                lista.Add(new Fabricantes
                                {
                                    ID_FABRICANTE = dt.Rows[i]["ID_FABRICANTE"].ToString(),
                                    NOMBRE_FABRICANTE = dt.Rows[i]["NOMBRE"].ToString(),
                                    ESTADO = dt.Rows[i]["ESTADO"].ToString(),
                                    ABREVIATURA = dt.Rows[i]["ABREVIATURA"].ToString(),
                                    ID_PAIS = dt.Rows[i]["ID_PAIS"].ToString(),
                                    NOMBRE_PAIS = dt.Rows[i]["PAIS"].ToString(),
                                    USUARIO_GRABACION = dt.Rows[i]["USUARIO_GRABACION"].ToString(),
                                    FECHA_GRABACION = dt.Rows[i]["FECHA_GRABACION"].ToString(),
                                    USUARIO_EDITA = dt.Rows[i]["USUARIO_MODIFICACION"].ToString(),
                                    FECHA_EDITA = dt.Rows[i]["FECHA_MODIFICACION"].ToString()
                                });
                            }
                            return lista;
                        }
                        else
                        {
                            lista.Add(new Fabricantes
                            {
                                NOMBRE_FABRICANTE= "No hay datos ".ToString()
                            });
                            return lista;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista.Add(new Fabricantes
                {
                    NOMBRE_FABRICANTE = "Error " + ex.ToString()
                });
                return lista;
            }
        }

        [WebMethod]
        public string getName()
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand("SELECT SYS_CONTEXT('USERENV', 'DB_NAME') AS NOMBRE_BASE FROM DUAL", con);
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
        public List<Fabricantes> getFabri(int ID_FABRICANTE)
        {
            DataTable dt = new DataTable();
            List<Fabricantes> lista = new List<Fabricantes>();
            String sqlFabri = FabricantesQuerys.selectFabriEspecifico().ToString();

            try
            {
                using (OracleConnection con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SYSTEM"].ConnectionString))
                {
                    using (OracleCommand cmd = new OracleCommand(sqlFabri, con))
                    {
                        cmd.Parameters.Add("P_ID_FABRICANTE", ID_FABRICANTE);
                        con.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                lista.Add(new Fabricantes
                                {
                                    ID_FABRICANTE = dt.Rows[i]["ID_FABRICANTE"].ToString(),
                                    NOMBRE_FABRICANTE = dt.Rows[i]["NOMBRE"].ToString(),
                                    ESTADO = dt.Rows[i]["ESTADO"].ToString(),
                                    ABREVIATURA = dt.Rows[i]["ABREVIATURA"].ToString(),
                                    NOMBRE_PAIS = dt.Rows[i]["PAIS"].ToString(),
                                    USUARIO_GRABACION = dt.Rows[i]["USUARIO_GRABACION"].ToString(),
                                    FECHA_GRABACION = dt.Rows[i]["FECHA_GRABACION"].ToString(),
                                    USUARIO_EDITA = dt.Rows[i]["USUARIO_MODIFICACION"].ToString(),
                                    FECHA_EDITA = dt.Rows[i]["FECHA_MODIFICACION"].ToString()
                                });
                            }
                            return lista;
                        }
                        else
                        {
                            lista.Add(new Fabricantes
                            {
                                NOMBRE_FABRICANTE= "No hay datos ".ToString()
                            });
                            return lista;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista.Add(new Fabricantes
                {
                    NOMBRE_FABRICANTE = "Error " + ex.ToString()
                });
                return lista;
            }
        }

        /*Inserta Fabricante*/
        [WebMethod]
        public string insertFabri(string NOMBRE, string ESTADO, string ABREVIATURA, int ID_PAIS)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlInsFabri = FabricantesQuerys.insertFabri().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlInsFabri, con);

                cmd.Parameters.Add("P_NOMBRE", NOMBRE.Trim().ToUpper());
                cmd.Parameters.Add("P_ABREVIATURA", ABREVIATURA.Trim().ToUpper());
                cmd.Parameters.Add("P_ESTADO", ESTADO.Trim().ToUpper());
                cmd.Parameters.Add("P_ID_PAIS", ID_PAIS);

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

        /*Actualiza Fabricante*/
        [WebMethod]
        public string updatePais(int ID_FABRICANTE, string NOMBRE, string ESTADO, string ABREVIATURA, int ID_PAIS)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlInsFabri = FabricantesQuerys.updateFabri().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlInsFabri, con);


                cmd.Parameters.Add("P_NOMBRE", NOMBRE.Trim().ToUpper());
                cmd.Parameters.Add("P_ABREVIATURA", ABREVIATURA.Trim().ToUpper());
                cmd.Parameters.Add("P_ESTADO", ESTADO.Trim().ToUpper());
                cmd.Parameters.Add("P_ID_PAIS", ID_PAIS);
                cmd.Parameters.Add("P_ID_FABRICANTE", ID_FABRICANTE);

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

        /*BorraR*/
        [WebMethod]
        public string deleteFabri(int ID_FABRICANTE)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlDelFabri = FabricantesQuerys.deleteFabri().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlDelFabri, con);

                cmd.Parameters.Add("ID_FABRICANTE", ID_FABRICANTE);

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
        public List<Fabricantes> GetCountFabricantes()
        {
            DataTable dt = new DataTable();
            List<Fabricantes> lista = new List<Fabricantes>();
            String sqlFabricante = FabricantesQuerys.countFabricante().ToString();
            try
            {
                using (OracleConnection con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SYSTEM"].ConnectionString))
                {
                    using (OracleCommand cmd = new OracleCommand(sqlFabricante, con))
                    {

                        con.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                lista.Add(new Fabricantes
                                {
                                    CANTIDAD = dt.Rows[i]["Cantidad"].ToString(),
                                    ID_PAIS = dt.Rows[i]["ID_PAIS"].ToString(),
                                    NOMBRE = dt.Rows[i]["NOMBRE"].ToString()
                                   
                                });
                            }
                            return lista;
                        }
                        else
                        {
                            lista.Add(new Fabricantes
                            {
                                NOMBRE = "No hay datos".ToString()
                            });
                            return lista;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                lista.Add(new Fabricantes
                {
                    NOMBRE = "Error " + ex.ToString()
                });
                return lista;
            }
        }
    }
}
