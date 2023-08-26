using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EjemploPrograV.Modelos
{
    class PaisesQueries
    {
        /*
            Tabla Paises
        */

        /* Todos los paises*/
        internal static string selectPais()
        {
            string selectPais = "SELECT * FROM SYSTEM.PAIS PA ORDER BY PA.NOMBRE ASC ";
            return selectPais;
        }

        /*Muetra pais por id*/
        internal static string selectPaisEspecifico()
        {
            string selectPais = "SELECT * FROM SYSTEM.PAIS PA WHERE PA.ID_PAIS = :ID_PAIS ";
            return selectPais;
        }

        /*Inserta pais*/
        internal static string insertPais()
        {
            string insertPais = "INSERT INTO SYSTEM.PAIS (ID_PAIS, NOMBRE, ABREVIATURA, ESTADO) " +
                                "VALUES(SYSTEM.SQ_PAIS.NEXTVAL,:PAIS,:ABREVIATURA,:ESTADO)";
            return insertPais;
        }

        /*Actualiza pais*/
        internal static string updatePais()
        {
            string updatePais = "UPDATE SYSTEM.PAIS PA SET PA.NOMBRE = :PAIS, PA.ABREVIATURA = :ABREVIATURA, " +
                                "PA.ESTADO = :ESTADO, PA.USUARIO_MODIFICACION = USER, PA.FECHA_MODIFICACION = SYSDATE " +
                                "WHERE PA.ID_PAIS = :ID_PAIS ";
            return updatePais;
        }

        /*Borra pais*/
        internal static string deletePais()
        {
            string deletePais = "DELETE FROM SYSTEM.PAIS PA WHERE PA.ID_PAIS = :ID_PAIS ";
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