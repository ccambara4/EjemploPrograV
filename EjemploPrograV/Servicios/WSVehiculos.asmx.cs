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
    /// Descripción breve de WSVehiculos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WSVehiculos : System.Web.Services.WebService
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
        public List<Vehiculos> getAllVehi()
        {
            DataTable dt = new DataTable();
            List<Vehiculos> lista = new List<Vehiculos>();
            String sqlVehi = VehiculosQuerys.getAllVehiculo().ToString();

            try
            {
                using (OracleConnection con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SYSTEM"].ConnectionString))
                {
                    using (OracleCommand cmd = new OracleCommand(sqlVehi, con))
                    {
                        con.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                lista.Add(new Vehiculos
                                {
                                    ID_VEHICULO = dt.Rows[i]["ID_VEHICULO"].ToString(),
                                    ID_COMBUSTIBLE = dt.Rows[i]["ID_COMBUSTIBLE"].ToString(),
                                    COMBUSTIBLE = dt.Rows[i]["COMBUSTIBLE1"].ToString(),
                                    ID_TIPO = dt.Rows[i]["ID_TIPO"].ToString(),
                                    TIPO = dt.Rows[i]["TIPO"].ToString(),
                                    ID_TRANSMISION = dt.Rows[i]["ID_TRANSMISION"].ToString(),
                                    TRANSMISION = dt.Rows[i]["TRANSMISION1"].ToString(),
                                    ID_FABRICANTE = dt.Rows[i]["ID_FABRICANTE"].ToString(),
                                    FABRICANTE = dt.Rows[i]["FABRICANTE1"].ToString(),
                                    ID_PAIS = dt.Rows[i]["ID_PAIS"].ToString(),
                                    PAIS = dt.Rows[i]["PAIS1"].ToString(),
                                    MODELO = dt.Rows[i]["MODELO"].ToString(),
                                    PLACA = dt.Rows[i]["PLACA"].ToString(),
                                    ANIO = dt.Rows[i]["ANIO"].ToString(),
                                    COLOR = dt.Rows[i]["COLOR"].ToString(),
                                    CILINDRADA = dt.Rows[i]["CILINDRADA"].ToString(),
                                    COSTO = dt.Rows[i]["COSTO"].ToString(),
                                    ESTADO = dt.Rows[i]["ESTADO"].ToString(),
                                    RENDIMIENTO = dt.Rows[i]["RENDIMIENTO"].ToString(),
                                    VELOCIDAD_MAXIMA = dt.Rows[i]["VELOCIDAD_MAXIMA"].ToString(),
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
                            lista.Add(new Vehiculos
                            {
                                FABRICANTE = "No hay datos ".ToString()
                            });
                            return lista;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista.Add(new Vehiculos
                {
                    FABRICANTE = "Error " + ex.ToString()
                });
                return lista;
            }
        }

        [WebMethod]
        public List<Vehiculos> getAllVehiF()
        {
            DataTable dt = new DataTable();
            List<Vehiculos> lista = new List<Vehiculos>();
            String sqlVehi = VehiculosQuerys.getAllVehiF().ToString();

            try
            {
                using (OracleConnection con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SYSTEM"].ConnectionString))
                {
                    using (OracleCommand cmd = new OracleCommand(sqlVehi, con))
                    {
                        con.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                lista.Add(new Vehiculos
                                {
                                    ID_VEHICULO = dt.Rows[i]["ID_VEHICULO"].ToString(),
                                    COMBUSTIBLE = dt.Rows[i]["COMBUSTIBLE1"].ToString(),
                                    TIPO = dt.Rows[i]["TIPO"].ToString(),
                                    TRANSMISION = dt.Rows[i]["TRANSMISION1"].ToString(),
                                    FABRICANTE = dt.Rows[i]["FABRICANTE1"].ToString(),
                                    PAIS = dt.Rows[i]["PAIS1"].ToString(),
                                    ABREVIATURA_PAIS = dt.Rows[i]["ABREVIATURA"].ToString(),
                                    MODELO = dt.Rows[i]["MODELO"].ToString(),
                                    PLACA = dt.Rows[i]["PLACA"].ToString(),
                                    ANIO = dt.Rows[i]["ANIO"].ToString(),
                                    COLOR = dt.Rows[i]["COLOR"].ToString(),
                                    CILINDRADA = dt.Rows[i]["CILINDRADA"].ToString(),
                                    FECHA_GRABACION = dt.Rows[i]["FECHA_GRABACION"].ToString(),
                                    FECHA_EDITA = dt.Rows[i]["FECHA_MODIFICACION"].ToString()
                                });
                            }
                            return lista;
                        }
                        else
                        {
                            lista.Add(new Vehiculos
                            {
                                FABRICANTE = "No hay datos ".ToString()
                            });
                            return lista;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista.Add(new Vehiculos
                {
                    FABRICANTE = "Error " + ex.ToString()
                });
                return lista;
            }
        }

        [WebMethod]
        public string insertVehi(int ID_TIPO, int ID_COMBUSTIBLE, int ID_TRANSMISION, int ID_FABRICANTE, string PLACA, string ANIO, string MODELO, string COLOR, string CILINDRADA, string COSTO, string ESTADO, string RENDIMIENTO, string VELOCIDAD_MAXIMA)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlInsVehi = VehiculosQuerys.insertVehi().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlInsVehi, con);

                cmd.Parameters.Add("P_ID_TIPO", ID_TIPO);
                cmd.Parameters.Add("P_ID_COMBUSTIBLE", ID_COMBUSTIBLE);
                cmd.Parameters.Add("P_ID_TRANSMISION", ID_TRANSMISION);
                cmd.Parameters.Add("P_ID_FABRICANTE", ID_FABRICANTE);
                cmd.Parameters.Add("P_PLACA", PLACA.Trim().ToUpper());
                cmd.Parameters.Add("P_ANIO", ANIO.Trim().ToUpper());
                cmd.Parameters.Add("P_MODELO", MODELO.Trim().ToUpper());
                cmd.Parameters.Add("P_COLOR", COLOR.Trim().ToUpper());
                cmd.Parameters.Add("P_CILINDRADA", CILINDRADA.Trim().ToUpper());
                cmd.Parameters.Add("P_COSTO", COSTO.Trim().ToUpper());
                cmd.Parameters.Add("P_ESTADO", ESTADO.Trim().ToUpper());
                cmd.Parameters.Add("P_RENDIMIENTO", RENDIMIENTO.Trim().ToUpper());
                cmd.Parameters.Add("P_VELOCIDAD_MAXIMA", VELOCIDAD_MAXIMA.Trim().ToUpper());

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
        public string updateVehi(int ID_VEHICULO, int ID_TIPO, int ID_COMBUSTIBLE, int ID_TRANSMISION, int ID_FABRICANTE, string PLACA, string ANIO, string MODELO, string COLOR, string CILINDRADA, string COSTO, string ESTADO, string RENDIMIENTO, string VELOCIDAD_MAXIMA)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlUpdVehi = VehiculosQuerys.updateVehi().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlUpdVehi, con);

                cmd.Parameters.Add("P_ID_TIPO", ID_TIPO);
                cmd.Parameters.Add("P_ID_COMBUSTIBLE", ID_COMBUSTIBLE);
                cmd.Parameters.Add("P_ID_TRANSMISION", ID_TRANSMISION);
                cmd.Parameters.Add("P_ID_FABRICANTE", ID_FABRICANTE);
                cmd.Parameters.Add("P_PLACA", PLACA.Trim().ToUpper());
                cmd.Parameters.Add("P_ANIO", ANIO.Trim().ToUpper());
                cmd.Parameters.Add("P_MODELO", MODELO.Trim().ToUpper());
                cmd.Parameters.Add("P_COLOR", COLOR.Trim().ToUpper());
                cmd.Parameters.Add("P_CILINDRADA", CILINDRADA.Trim().ToUpper());
                cmd.Parameters.Add("P_COSTO", COSTO.Trim().ToUpper());
                cmd.Parameters.Add("P_ESTADO", ESTADO.Trim().ToUpper());
                cmd.Parameters.Add("P_RENDIMIENTO", RENDIMIENTO.Trim().ToUpper());
                cmd.Parameters.Add("P_VELOCIDAD_MAXIMA", VELOCIDAD_MAXIMA.Trim().ToUpper());
                cmd.Parameters.Add("P_ID_VEHICULO", ID_VEHICULO);

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
        public string deleteVehi(int ID_VEHICULO)
        {
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["SYSTEM"].ToString());
            string sqlDelPais = VehiculosQuerys.deleteVehi().ToString();

            try
            {
                con.Open();
                OracleCommand cmd = new OracleCommand(sqlDelPais, con);

                cmd.Parameters.Add("P_ID_VEHICULO", ID_VEHICULO);

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
        
    }
}
