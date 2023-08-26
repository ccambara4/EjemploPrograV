using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Threading.Tasks;

namespace EjemploPrograV.Servicios
{
    /// <summary>
    /// Descripción breve de Operaciones
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class Operaciones : System.Web.Services.WebService
    {

        [WebMethod]
        public string Suma(decimal num1, decimal num2)
        {
            try
            {
                return Convert.ToString(num1 + num2);
            }catch(Exception ex)
            {
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public string Resta(decimal num1, decimal num2)
        {
            try
            {
                return Convert.ToString(num1 - num2);
            }
            catch (Exception ex)
            {
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public string Multiplicacion(decimal num1, decimal num2)
        {
            try
            {
                return Convert.ToString(num1 * num2);
            }
            catch (Exception ex)
            {
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public string Division(decimal num1, decimal num2)
        {
            try
            {
                decimal resultado = (num1 / num2);
                return Convert.ToString(resultado.ToString("F"));
            }
            catch (Exception ex)
            {
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public string Residuo(decimal num1, decimal num2)
        {
            try
            {                
                return Convert.ToString(num1 % num2);
            }
            catch (Exception ex)
            {
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public string Factorial(int num)
        {            
            try
            {
                long factorial = 1;
                for(int i = 1; i <= num; i++)
                {
                    factorial = factorial *i;
                }
                return Convert.ToString(factorial.ToString("N"));
            }
            catch (Exception ex)
            {
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public string Edad(decimal anio_nacimiento, decimal anio_actual)
        {
            try
            {
                return Convert.ToString(anio_actual - anio_nacimiento);
            }
            catch (Exception ex)
            {
                return "Error " + ex.ToString();
            }
        }

        [WebMethod]
        public List<string> Calcular_Tabla(int numero, int lineas)
        {
            List<string> tabla = new List<string>();

            tabla.Add($"Tabla de multiplicar del número {numero}:");
            tabla.Add("-------------------------");

            for (int i = 1; i <= lineas; i++)
            {
                int resultado = numero * i;
                tabla.Add($"{numero} x {i} = {resultado}");
            }

            return tabla;
        }


    }
}
