<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Establecimientos.aspx.cs" Inherits="EjemploPrograV.Vistas.Establecimientos" %>

<<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.7.0/jquery-3.7.0.js"></script>
    <script src="../Scripts/bootstrap/js/bootstrap.min.js"></script>
    <title>Paises</title>
</head>

    <script type="text/javascript">

        $(document).ready(function () {
            getHora();

            $('#btnGethora').click(function () {
                getHora();
            });


        });

        //obtiene la hora
        function getHora() {
            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSEstablecimientos.asmx/getDate",
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

    </form>
</body>
</html>
