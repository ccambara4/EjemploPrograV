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
            font_size: large;
        }

    </style>
    <script>
        function mostrarMensaje() {
            alert("Hola mundo, presionaste el botón")
        };
    </script>
<body>
    <form id="form1" runat="server">
        <!--Bloques-->
        <h1>Hola mundo</h1>
        <h1>Otro h1</h1>
        <h2 style ="color:green;">Otro texto</h2>
        <div>
            <button>Boton</button>
            <input type="text" />
        </div>

        <div>
            <input type="number"/>
        </div>
        <div>
            <button onclick ="mostrarMensaje()">Presionar
            </button>
        </div>
    </form>
</body>
</html>
