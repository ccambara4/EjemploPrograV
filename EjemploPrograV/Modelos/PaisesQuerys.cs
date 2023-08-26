using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EjemploPrograV.Modelos
{
    class PaisesQuerys
    {
        /*
         Tabla Paises
        */

        internal static string selectPais()
        {
            string selectPais = "SELECT * FROM SYSTEM.PAIS PA ORDER BY PA.NOMBRE ASC ";
            return selectPais;
        }

        /*
         Muestra Paises por id
        */

        internal static string selectPaisEspecifico()
        {
            string selectPaisEspecifico = "SELECT * FROM SYSTEM.PAIS PA WHERE PA.ID_PAIS = :P_ID_PAIS ";
            return selectPaisEspecifico;
        }

        /*
         Insertar Pais
         */
        internal static string insertPais()
        {
            string insertPais = "INSERT INTO SYSTEM.PAIS (ID_PAIS, NOMBRE, ABREVIATURA, ESTADO) VALUES (SYSTEM.SQ_PAIS.NEXTVAL, :P_NOMBRE, :P_ABREVIATURA, :P_ESTADO)";
            return insertPais;
        }

        /*
         Update Pais
         */
        internal static string updatePais()
        {
            string updatePais = "UPDATE SYSTEM.PAIS SET NOMBRE = :P_NOMBRE, ABREVIATURA = :P_ABREVIATURA,  ESTADO = :P_ESTADO, USUARIO_MODIFICACION = USER, FECHA_MODIFICACION = SYSDATE WHERE ID_PAIS = :P_ID_PAIS";
            return updatePais;
        }

        /*
         Delete Pais
         */
        internal static string deletePais()
        {
            string deletePais = "DELETE FROM SYSTEM.PAIS WHERE ID_PAIS = :P_ID_PAIS";
            return deletePais;
        }

        /*Llena combo paises*/
        internal static string selectPaisCMB()
        {
            string selectPais = "SELECT ID_PAIS, NOMBRE FROM SYSTEM.PAIS PA ORDER BY PA.NOMBRE ASC";
            return selectPais;
        }

        /*Cantidad de registros*/
        internal static string cantidadPaises()
        {
            string selectPais = "SELECT COUNT(*) CANTIDAD FROM SYSTEM.PAIS PA ";
            return selectPais;
        }
    }
}