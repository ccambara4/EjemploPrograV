<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ejemplo1.aspx.cs" Inherits="EjemploPrograV.Vistas.Ejemplo1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ejemplo1</title>
</head>
    <style>
        h1{
            color: red;
            font-size: large;
        }
        button{
            background-color:chartreuse;
            font-style:oblique;
            font-weight:bolder;
        }
        span{
            background-color:aqua;
            font-style:italic;
            font-weight: bold;
        }
    </style>

<script>
    function mostrarMensaje() {
        alert("Hola Mundo, presionaste el botón!!");
    };
</script>

<body>
    <form id="form1" runat="server">
        
        <!--Bloques-->
        <h1>Hola mundo</h1>
        <h1>Otro h1</h1>
        <h2 style ="color:greenyellow;" >Otro texto</h2>
        
        <div>
            <input type="text" /> <sapn>span 1</sapn>
            <button>Boton</button>
            
            
        </div>
        <br />

        <div>
            <input type="number" />
            
        </div>

        <br />

        <div>
            <button onclick ="mostrarMensaje()">Preseionar</button>
            <button>Aceptar</button>
        </div>
        <br />

        <div>
            <label>Persona:</label>
            <input id="nPais" placeholder="Nombre" type="text" />
            <label>Fecha Nacimiento:</label><input id="fecha" type="date" />
            <br />
            <label>Descripcion:</label>            
            <textarea cols ="50" rows="5"></textarea>
            <br />
            <label>Seleccionar pais</label>
            <select>
                <option value ="1">Guatemala</option>
                <option value ="2">El Salvador</option>
                <option value ="3">Honduras</option>
                <option value ="4">Nicaragua</option>
                <option value ="5">Costa Rica</option>
                <option value ="6">Panamá</option>
            </select>
            <button>Aceptar</button>
        </div>
        <hr />
        <br />
        
        <h1>Ejemplo tabla</h1>
        <table>
            <thead>
                <th>Codigo</th>
                <th>Pais</th>
                <th>Fecha Creacion</th>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Guatemala</td>
                    <td>Hoy</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>El Salvador</td>
                    <td>Hoy</td>
                </tr>
            </tbody>
        </table>

    </form>
</body>
</html>
