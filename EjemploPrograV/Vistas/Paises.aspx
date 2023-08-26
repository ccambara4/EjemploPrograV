<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paises.aspx.cs" Inherits="EjemploPrograV.Vistas.Paises" %>

<!DOCTYPE html>

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
            fillPaises();
            getAllPaises();

            $('#btnGethora').click(function () {
                getHora();
            });

            $('#btnInsPais').click(function () {
                insertaPais();
                clearFields();
            });

            $('#btnEditar').click(function () {
                updatePais();
                getAllPaises();
            });

            $('#btnBorrar').click(function () {
                deltePais();
                getAllPaises();
            });

            $('#IdPais2').change(function () {
                //alert($('#IdPais2 option:selected').val());
                getPais();
            });


        });

        //limpia campos
        function clearFields() {
            $('#estPais').prop('selectedIndex', 0);
            $('#nombrePais').val("");
            $('#abrePais').val("");
        };

        //obtiene la hora
        function getHora() {
            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSPaises.asmx/getDate",
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

        //inserta pais
        function insertaPais() {
            var estadoPais = $('#estPais option:selected').val();
            var nombrePais = $('#nombrePais').val();
            var abrePais = $('#abrePais').val();

            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSPaises.asmx/insertPais",
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                data: "{'pais':'" + nombrePais + "','abreviatura':'" + abrePais + "','estado':'" + estadoPais + "'}",
                success: function (resultado) {
                    console.log(resultado)
                    var items = resultado.d;
                    if (items == "SUCCESS") {
                        alert('Insertado correctamente');
                        getHora();
                        getAllPaises();
                    } else {
                        alert('Validar');
                        console.log(items);
                    }
                },
            });
        }

        //Update Paises
        function updatePais() {
            var idPais = $('#IdPais2 option:selected').val();
            var estadoPais = $('#stdEdit option:selected').val();
            var nombrePais = $('#txtNombreEdt').val();
            var abrePais = $('#txtAbrePais').val();

            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSPaises.asmx/updatePais",
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                data: "{'pais':'" + nombrePais + "','abreviatura':'" + abrePais + "','idPais':'" + idPais + "','estado':'" + estadoPais + "'}",
                success: function (resultado) {
                    console.log(resultado)
                    var items = resultado.d;
                    if (items == "SUCCESS") {
                        alert('Actualizado correctamente');
                        getHora();
                    } else {
                        alert('Validar');
                        console.log(items);
                    }
                },
            });
        }

        //delete Paises
        function deltePais() {
            var idPais = $('#IdPais2 option:selected').val();

            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSPaises.asmx/deletePais",
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                data: "{'idPais':'" + idPais + "'}",
                success: function (resultado) {
                    console.log(resultado)
                    var items = resultado.d;
                    if (items == "SUCCESS") {
                        alert('Borrado correctamente');
                        getHora();
                    } else {
                        alert('Validar');
                        console.log(items);
                    }
                },
            });
        }

        //llena combo paises
        function fillPaises() {
            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSPaises.asmx/getAllPaisesCMB",
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (resultado) {
                    console.log(resultado)
                    var items = resultado.d;
                    $.each(items, function (index, item) {
                        $('#IdPais2').append($("<option></option>").val(item.idPaid).html(item.nombrePais));
                    });
                },
            });
        }

        //llena Ccampos
        function getPais() {
            var pais = $('#IdPais2 option:selected').val();
            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSPaises.asmx/getPais",
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                data: "{'idPais':'" + pais + "'}",
                success: function (resultado) {
                    console.log(resultado)
                    var items = resultado.d;
                    $.each(items, function (index, item) {
                        $('#txtNombreEdt').val(item.nombrePais);
                        $('#txtAbrePais').val(item.abreviaturaPais);
                        $('#stdEdit').val(item.estadoPais);
                    });
                },
            });
        }

        //Muestra todos los paises
        function getAllPaises() {
            $.ajax({
                type: 'POST',
                url: "https://localhost:44344/Servicios/WSPaises.asmx/getAllPaises",
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (resultado) {
                    console.log(resultado)
                    var items = resultado.d;
                    /*.claseTable es la clase utilizada para llenar dinamicamente la tabla*/
                    $('.claseTabla').html('');
                    $.each(items, function (index, item) {
                        $('.claseTabla').append("<tr><th scope='row'>" + item.idPaid + "</th><td>" + item.nombrePais + "</td><td>" + item.abreviaturaPais + "</td><td>" + item.estadoPais + "</td><td>" + item.usuarioGraba + "</td><td>" + item.fechaGraba + "</td><td>" + item.usuarioEdita + "</td><td>" + item.fechaEdita + "</td>");
                    });
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

        <h2 class ="text-center">Agegar paises</h2>
        <div class="grid text center container">
        <table class="table-primary table">
                <thead>
                    <tr>
                        <th scope="col">Nombre País</th>
                        <th scope="col">Abreviatura País</th>
                        <th scope="col">Estado País</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input id="nombrePais" type="text" class="form-control" placeholder="Nombre Pais" aria-label="Nombre Pais" />
                        </td>
                        <td>
                            <input id="abrePais" type="text" class="form-control" placeholder="Abreviatura" aria-label="Abreviatura" />
                        </td>
                        <td>
                            <select id="estPais" class="form-control" aria-label="Default select example">
                                <option value="0">Seleccionar estado</option>
                                <option value="A">Activo</option>
                                <option value="I">Inactivo</option>
                            </select>
                        </td>
                        <td>
                            <button id="btnInsPais" type="button" class="btn btn-success" style="width: auto;">Guardar</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        
        </div>


        <h2 class ="text-center">Editar / Borrar Paises</h2>
        <div class="grid text center container">
        <table class="table-secondary table">
                <thead>
                    <tr>
                        <th scope="col">Seleccione País</th>
                        <th scope="col">Nombre País</th>
                        <th scope="col">Abreviatura País</th>
                        <th scope="col">Estado País</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <select id="IdPais2" class="form-control" aria-label="Default select example">
                            </select>
                        </td>
                        <td>
                            <input id="txtNombreEdt" type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" />
                        </td>
                        <td>
                            <input id="txtAbrePais" type="text" class="form-control" placeholder="Abreviatura" aria-label="Abreviatura" />
                        </td>
                        <td>
                            <select id="stdEdit" class="form-control" aria-label="Default select example">
                                <option value="selected">Seleccionar estado</option>
                                <option value="A">Activo</option>
                                <option value="I">Inactivo</option>
                            </select>
                        </td>
                        <td>
                            <button id="btnEditar" type="button" class="btn btn-warning" style="width: auto;">Editar</button>
                            <button id="btnBorrar" type="button" class="btn btn-danger" style="width: auto;">Borrar</button>
                        </td>
                    </tr>
                </tbody>
            </table>        
        </div>

        <div class="grid text-center container">
            <table class="table-secondary table table-striped">
                <thead>
                    <tr>
                        <th scope="col">idPais</th>
                        <th scope="col">nombrePais</th>
                        <th scope="col">abreviaturaPais</th>
                        <th scope="col">estadoPais</th>
                        <th scope="col">usuarioGraba</th>
                        <th scope="col">fechaGraba</th>
                        <th scope="col">usuarioEdita</th>
                        <th scope="col">fechaEdita</th>
                    </tr>
                </thead>
                <tbody
                    class="claseTabla" style="text-align-last: center;">
                </tbody>
            </table>
        </div>



    </form>
</body>
</html>
