using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EjemploPrograV.Modelos
{
        class FabricantesQuerys
        {

        /*
         Traer todos los Fabricantes
        */
        internal static string selectFabri()
        {
            string selectFabri = "SELECT FA.*, PA.NOMBRE PAIS FROM FABRICANTE FA INNER JOIN PAIS PA ON PA.ID_PAIS = FA. ID_PAIS ORDER BY FA.NOMBRE ASC ";
            return selectFabri;
        }

        internal static string selectFabriEspecifico()
        {
            string selectFabri = "SELECT FA.*, PA.NOMBRE PAIS FROM FABRICANTE FA INNER JOIN PAIS PA ON PA.ID_PAIS = FA. ID_PAIS WHERE FA.ID_FABRICANTE = :P_ID_FABRICANTE ";
            return selectFabri;
        }

        /*Inserta Fabricantes*/
        internal static string insertFabri()
        {
            string insertFabri = "INSERT INTO FABRICANTE (ID_FABRICANTE, NOMBRE, ABREVIATURA, ESTADO, ID_PAIS) " +
                                "VALUES(SYSTEM.SQ_FABRICANTE.NEXTVAL,:P_NOMBRE,:P_ABREVIATURA,:P_ESTADO, :P_ID_PAIS)";
            return insertFabri;
        }

        /*Actualiza fabricantes*/
        internal static string updateFabri()
        {
            string updateFabri = "UPDATE FABRICANTE SET NOMBRE = :P_NOMBRE, ABREVIATURA = :P_ABREVIATURA, " +
                                "ESTADO = :P_ESTADO, ID_PAIS = :P_ID_PAIS, USUARIO_MODIFICACION = USER, FECHA_MODIFICACION = SYSDATE " +
                                "WHERE ID_FABRICANTE = :P_ID_FABRICANTE";
            return updateFabri;
        }

        /*Actualiza fabricantes*/
        internal static string deleteFabri()
        {
            string deleteFabri = "DELETE FROM FABRICANTE WHERE ID_FABRICANTE = :P_ID_FABRICANTE";
            return deleteFabri;
        }

        /*
         Contar Fabricantes
        */

        internal static string countFabricante()
            {
                string countFabricante = "SELECT COUNT(*) AS Cantidad, PA.ID_PAIS, PA.NOMBRE FROM FABRICANTE FA\n" +
                    "INNER JOIN PAIS PA ON PA.ID_PAIS = FA.ID_PAIS\n" +
                    "GROUP BY PA.ID_PAIS, PA.NOMBRE\n" +
                    "ORDER BY PA.NOMBRE ASC";
                return countFabricante;
            }
        }
    
}