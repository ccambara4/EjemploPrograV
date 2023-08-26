<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fabricantes.aspx.cs" Inherits="EjemploPrograV.Vistas.Fabricantes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.7.0/jquery-3.7.0.js"></script>
    <script src="../Scripts/bootstrap/js/bootstrap.min.js"></script>
    <title>Fabricantes</title>
</head>

    <script type="text/javascript">

        $(document).ready(function () {
            getHora();
            obtenerNombre();
 
            $('#btnGethora').click(function () {
                getHora();
            });

            $('#btnObtenerNombre').click(function () {
                obtenerNombre();
            });
        });

        //obtiene la hora
        function getHora() {
            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSFabricantes.asmx/getDate",
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (resultado) {
                    console.log(resultado)
                    var items = resultado.d;
                    $('#horaFecha').val(items);
                },
            });
        }

        function obtenerNombre() {
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/WSFabricantes.asmx/getName",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var nombre = response.d;
                    $("#lblNombre").text(nombre);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        function obtenerFabricantes() {
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/WSFabricantes.asmx/GetCountFabricantes",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var fabricantes = response.d;
                    var fabricantesHtml = "<h2>Lista de Fabricantes</h2><br/>";
                    fabricantesHtml += "<ul>";
                    for (var i = 0; i < fabricantes.length; i++) {
                        fabricantesHtml += "<li><strong>Cantidad:</strong> " + fabricantes[i].CANTIDAD + "</li>";
                        fabricantesHtml += "<li><strong>Codigo País:</strong> " + fabricantes[i].ID_PAIS + "</li>";
                        fabricantesHtml += "<li><strong>País:</strong> " + fabricantes[i].NOMBRE + "</li>";
                        fabricantesHtml += "<br/>";
                    }
                    fabricantesHtml += "</ul>";
                    $("#divFabricantes").html(fabricantesHtml);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        

    </script>

<body>
    <form id="form1" runat="server">
        
        <hr />
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <label id="lblHora" class="form-control">Fecha y Hora</label>            
                    </td>
                    <td>
                        <input id="horaFecha" type="text" class="form-control" readonly="true" placeholder="Fecha y Hora" aria-label="Hora y fecha" />            
                    </td>
                    <td>
                        <button id="btnGethora" type="button" class="btn btn-primary" style="width:auto;">Obtener Hora</button>
                    </td>
                </tr>
            </table>
            <hr />
        </div>

        <div class="grid text center container">
            <h2>Nombre de la Base de datos</h2>
            <table class="table-secondary table">
                <tr>
                    <td>
                          <input id="btnObtenerNombre" type="button" class="btn btn-primary" style="width:auto;" value="Obtener Nombre" onclick="obtenerNombre()" />         
                    </td>
                    <td>
                        <label id="lblNombre" class="form-control">Nombre</label>            
                    </td>
                </tr>
            </table>
            <hr />
        </div>

        <div class="grid text center container">
            <h2>Conteo de fabricantes por País</h2>
            <table class="table-secondary table">
                <tr>
                    <td>
                          <input id="btnObtenerFabricantes" type="button" class="btn btn-primary" style="width:auto;" value="Contar Fabricantes" onclick="obtenerFabricantes()" />         
                    </td>
                    <td>
                        <div id="divFabricantes" class="form-control">Conteo</div>           
                    </td>
                </tr>
            </table>
            <hr />
        </div>



    </form>
</body>
</html>