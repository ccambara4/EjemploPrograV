using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EjemploPrograV.Modelos
{
    class VehiculosQuerys
    {
        /*
         Traer todos vehiculos
        */

        internal static string getAllVehiculo()
        {
            string getAllVehiculo = "SELECT VH.*, TI.NOMBRE TIPO, FA.NOMBRE FABRICANTE1, PA.ID_PAIS, PA.NOMBRE PAIS1, CO.NOMBRE COMBUSTIBLE1, TR.NOMBRE TRANSMISION1"
                + " FROM SYSTEM.VEHICULO VH" + " INNER JOIN TIPO_VEHICULO TI ON TI.ID_TIPO = VH.ID_TIPO" + " INNER JOIN FABRICANTE FA ON FA.ID_FABRICANTE = VH.ID_FABRICANTE" +
                " INNER JOIN PAIS PA ON PA.ID_PAIS = FA.ID_PAIS" + " INNER JOIN COMBUSTIBLE CO ON CO.ID_COMBUSTIBLE = VH.ID_COMBUSTIBLE" + " INNER JOIN TIPO_VEHICULO TI ON TI.ID_TIPO = VH.ID_TIPO" +
                " INNER JOIN TRANSMISION TR ON TR.ID_TRANSMISION = VH.ID_TRANSMISION WHERE PA.NOMBRE NOT IN ('JAPON', 'ALEMANIA')";
            return getAllVehiculo;
        }

        /*
         Traer todos vehiculos con pais y fabricante
        */
        internal static string getAllVehiF()
        {
            string getAllVehiculof = "SELECT VH.ID_VEHICULO, VH.PLACA, VH.ANIO, VH.MODELO, VH.COLOR, VH.CILINDRADA, VH.FECHA_GRABACION, VH.FECHA_MODIFICACION, TI.NOMBRE TIPO, FA.NOMBRE FABRICANTE1, PA.NOMBRE PAIS1, PA.ABREVIATURA, CO.NOMBRE COMBUSTIBLE1, TR.NOMBRE TRANSMISION1"
                + " FROM SYSTEM.VEHICULO VH" + " INNER JOIN TIPO_VEHICULO TI ON TI.ID_TIPO = VH.ID_TIPO" + " INNER JOIN FABRICANTE FA ON FA.ID_FABRICANTE = VH.ID_FABRICANTE" +
                " INNER JOIN PAIS PA ON PA.ID_PAIS = FA.ID_PAIS" + " INNER JOIN COMBUSTIBLE CO ON CO.ID_COMBUSTIBLE = VH.ID_COMBUSTIBLE" + " INNER JOIN TIPO_VEHICULO TI ON TI.ID_TIPO = VH.ID_TIPO" +
                " INNER JOIN TRANSMISION TR ON TR.ID_TRANSMISION = VH.ID_TRANSMISION ORDER BY FA.NOMBRE ASC";
            return getAllVehiculof;
        }

        /*
         Insertar Vehiculos
        */

        internal static string insertVehi()
        {
            string insertVehi = "INSERT INTO SYSTEM.VEHICULO (ID_VEHICULO,ID_TIPO,ID_COMBUSTIBLE,ID_TRANSMISION,ID_FABRICANTE," + 
                "PLACA, ANIO, MODELO, COLOR, CILINDRADA, COSTO, ESTADO, RENDIMIENTO, VELOCIDAD_MAXIMA) " +
                "VALUES(SYSTEM.SQ_VEHICULO.NEXTVAL, :P_ID_TIPO, :P_ID_COMBUSTIBLE, :P_ID_TRANSMISION, :P_ID_FABRICANTE," + 
                ":P_PLACA, :P_ANIO, :P_MODELO, :P_COLOR, :P_CILINDRADA, :P_COSTO, :P_ESTADO, :P_RENDIMIENTO, :P_VELOCIDAD_MAXIMA)";
            return insertVehi;
        }

        /*
         Actualizar Vehiculos
        */

        internal static string updateVehi()
        {
            string updateVehi = "UPDATE SYSTEM.VEHICULO SET ID_TIPO = :P_ID_TIPO, ID_COMBUSTIBLE = :P_ID_COMBUSTIBLE, ID_TRANSMISION = :P_ID_TRANSMISION, " +
                                "ID_FABRICANTE = :P_ID_FABRICANTE, PLACA = :P_PLACA, ANIO = :P_ANIO, MODELO = :P_MODELO, COLOR = :P_COLOR, CILINDRADA = :P_CILINDRADA, " + 
                                "COSTO = :P_COSTO, ESTADO = :P_ESTADO, RENDIMIENTO = :P_RENDIMIENTO, VELOCIDAD_MAXIMA = :P_VELOCIDAD_MAXIMA, USUARIO_MODIFICACION = USER, FECHA_MODIFICACION = SYSDATE " +
                                "WHERE ID_VEHICULO = :P_ID_VEHICULO";
            return updateVehi;
        }

        /*
         Eliminar Vehiculos
        */

        internal static string deleteVehi()
        {
            string deleteVehi = "DELETE FROM SYSTEM.VEHICULO WHERE ID_VEHICULO = :P_ID_VEHICULO";
            return deleteVehi;
        }

        /*
         Contar vehiculos
        */

        internal static string countVehiculo()
        {
            string countVehiculo = "SELECT COUNT(*) AS Cantidad, PA.ID_PAIS, PA.NOMBRE FROM VEHICULO VH\n" +
                    "INNER JOIN FABRICANTE FA ON FA.ID_FABRICANTE = VH.ID_FABRICANTE\n" +
                    "INNER JOIN PAIS PA ON PA.ID_PAIS = FA.ID_PAIS\n" +
                    "GROUP BY PA.ID_PAIS, PA.NOMBRE\n" +
                    "ORDER BY PA.NOMBRE ASC";
            return countVehiculo;
        }

        internal static string countVehiculoF()
        {
            string countVehiculoF = "SELECT COUNT(*) AS Cantidad, FA.ID_FABRICANTE, FA.NOMBRE FROM VEHICULO VH\n" +
                    "INNER JOIN FABRICANTE FA ON FA.ID_FABRICANTE = VH.ID_FABRICANTE\n" +
                    "GROUP BY FA.ID_FABRICANTE, FA.NOMBRE\n" +
                    "ORDER BY FA.NOMBRE ASC";
            return countVehiculoF;
        }
    }
}