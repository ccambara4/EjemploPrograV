<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vehiculos.aspx.cs" Inherits="EjemploPrograV.Vistas.Vehiculos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.7.0/jquery-3.7.0.js"></script>
    <script src="../Scripts/bootstrap/js/bootstrap.min.js"></script>
    <title>Operaciones</title>
</head>
     <script type="text/javascript">
         $(document).ready(function () {
             getHora();
             getAllVehiculos();
             getAllVehiculosF();
             
             $('#btnGethora').click(function () {
                 getHora();
             });

             $('#btnInsVehi').click(function () {
                 insertaVehi();
             });

             $('#btnEditar').click(function () {
                 updateVehi();
                 getAllVehiculos();
             });

             $('#btnBorrar').click(function () {
                 deleteVehi();
                 getAllVehiculos();
             });


         });

        
         function getHora() {
             $.ajax({
                 type: 'POST',
                 url: "https://localhost:44344/Servicios/WSVehiculos.asmx/getDate",
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

         
         function insertaVehi() {
             var IdTipo = $('#idTipo').val();
             var IdCombu = $('#idCombu').val();
             var IdTrans = $('#idTrans').val();
             var IdFabri = $('#idFabri').val();
             var placa = $('#Placa').val();
             var anio = $('#Anio').val();
             var modelo = $('#Modelo').val();
             var color = $('#Color').val();
             var cilindrada = $('#Cilindrada').val();
             var costo = $('#Costo').val();
             var estado = $('#Estado').val();
             var rendimiento = $('#Rendimiento').val();
             var velocidad = $('#Velocidad').val();

             $.ajax({
                 type: 'POST',
                 url: "https://localhost:44344/Servicios/WSVehiculos.asmx/insertVehi",
                 cache: false,
                 contentType: "application/json; charset=utf-8",
                 dataType: 'json',
                 data: "{'ID_TIPO':'" + IdTipo + "','ID_COMBUSTIBLE':'" + IdCombu + "','ID_TRANSMISION':'" + IdTrans + "','ID_FABRICANTE':'" + IdFabri + "','PLACA':'" + placa + "','ANIO':'" + anio + "','MODELO':'" + modelo + "','COLOR':'" + color + "','CILINDRADA':'" + cilindrada + "','COSTO':'" + costo +"','ESTADO':'" + estado + "','RENDIMIENTO':'" + rendimiento + "','VELOCIDAD_MAXIMA':'" + velocidad + "'}",
                 success: function (resultado) {
                     console.log(resultado)
                     var items = resultado.d;
                     if (items == "SUCCESS") {
                         alert('Insertado correctamente');
                         getHora();
                         getAllVehi();
                     } else {
                         alert('Validar');
                         console.log(items);
                     }
                 },
             });
         }

         
         function updateVehi() {
             var IdVehi = $('#idVehitxt').val();
             var IdTipo = $('#idTipotxt').val();
             var IdCombu = $('#idCombutxt').val();
             var IdTrans = $('#idTranstxt').val();
             var IdFabri = $('#idFabritxt').val();
             var placa = $('#Placatxt').val();
             var anio = $('#Aniotxt').val();
             var modelo = $('#Modelotxt').val();
             var color = $('#Colortxt').val();
             var cilindrada = $('#Cilindradatxt').val();
             var costo = $('#Costotxt').val();
             var estado = $('#Estadotxt').val();
             var rendimiento = $('#Rendimientotxt').val();
             var velocidad = $('#Velocidadtxt').val();

             $.ajax({
                 type: 'POST',
                 url: "https://localhost:44344/Servicios/WSVehiculos.asmx/updateVehi",
                 cache: false,
                 contentType: "application/json; charset=utf-8",
                 dataType: 'json',
                 data: "{'ID_VEHICULO':'" + IdVehi + "','ID_TIPO':'" + IdTipo + "','ID_COMBUSTIBLE':'" + IdCombu + "','ID_TRANSMISION':'" + IdTrans + "','ID_FABRICANTE':'" + IdFabri + "','PLACA':'" + placa + "','ANIO':'" + anio + "','MODELO':'" + modelo + "','COLOR':'" + color + "','CILINDRADA':'" + cilindrada + "','COSTO':'" + costo + "','ESTADO':'" + estado + "','RENDIMIENTO':'" + rendimiento + "','VELOCIDAD_MAXIMA':'" + velocidad + "'}",
                 success: function (resultado) {
                     console.log(resultado)
                     var items = resultado.d;
                     if (items == "SUCCESS") {
                         alert('Actualizado correctamente');
                         getHora();
                         getAllVehi();
                     } else {
                         alert('Validar');
                         console.log(items);
                     }
                 },
             });
         }

         
         function getAllVehiculos() {
             $.ajax({
                 type: 'POST',
                 url: "https://localhost:44344/Servicios/WSVehiculos.asmx/getAllVehi",
                 cache: false,
                 contentType: "application/json; charset=utf-8",
                 dataType: 'json',
                 success: function (resultado) {
                     console.log(resultado)
                     var items = resultado.d;
                     $('.claseTabla').html('');
                     $.each(items, function (index, item) {
                         $('.claseTabla').append("<tr><th scope='row'>" + item.ID_VEHICULO + "</th><td>" + item.ID_COMBUSTIBLE + "</td><td>" + item.COMBUSTIBLE + "</td><td>" + item.ID_TIPO + "</td><td>" + item.TIPO + "</td><td>" + item.ID_TRANSMISION + "</td><td>" + item.TRANSMISION + "</td><td>" + item.ID_FABRICANTE + "</td><td>" + item.FABRICANTE + "</td><td>" + item.ID_PAIS + "</td><td>"
                             + item.PAIS + "</td><td>" + item.MODELO + "</td><td>" + item.PLACA + "</td><td>" + item.ANIO + "</td><td>" + item.COLOR + "</td><td>" + item.CILINDRADA + "</td><td>" + item.COSTO + "</td><td>" + item.ESTADO + "</td><td>" + item.RENDIMIENTO + "</td><td>" + item.VELOCIDAD_MAXIMA + "</td><td>" + item.USUARIO_GRABACION +
                             "</td><td>" + item.FECHA_GRABACION + "</td><td>" + item.USUARIO_EDITA + "</td><td>" + item.FECHA_EDITA +"</td>");
                     });
                 },
             });
         }

         function getAllVehiculosF() {
             $.ajax({
                 type: 'POST',
                 url: "https://localhost:44344/Servicios/WSVehiculos.asmx/getAllVehiF",
                 cache: false,
                 contentType: "application/json; charset=utf-8",
                 dataType: 'json',
                 success: function (resultado) {
                     console.log(resultado)
                     var items = resultado.d;
                     $('.claseTabla1').html('');
                     $.each(items, function (index, item) {
                         $('.claseTabla1').append("<tr><th scope='row'>" + item.ID_VEHICULO + "</th><td>" + item.COMBUSTIBLE + "</td><td>" + item.TIPO + "</td><td>" + item.TRANSMISION + "</td><td>" + item.FABRICANTE + "</td><td>"
                             + item.PAIS + "</td><td>" + item.ABREVIATURA_PAIS + "</td><td>" + item.MODELO + "</td><td>" + item.PLACA + "</td><td>" + item.ANIO + "</td><td>" + item.COLOR + "</td><td>" + item.CILINDRADA +
                             "</td><td>" + item.FECHA_GRABACION + "</td><td>" + item.FECHA_EDITA + "</td>");
                     });
                 },
             });
         }

         function deleteVehi() {
             var IdVehi = $('#idVehitxt').val();

             $.ajax({
                 type: 'POST',
                 url: "https://localhost:44344/Servicios/WSVehiculos.asmx/deleteVehi",
                 cache: false,
                 contentType: "application/json; charset=utf-8",
                 dataType: 'json',
                 data: "{'ID_VEHICULO':'" + IdVehi + "'}",
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

     </script>
<body>
    <form id="form1" runat="server">
        <h2 class ="text-center">Fecha y Hora</h2>
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
                </div>

                <h2 class ="text-center">Agegar Vehiculos</h2>
        <div class="grid text center container">
        <table class="table-primary table">
                <thead>
                    <tr>
                        <th scope="col">ID_TIPO</th>
                        <th scope="col">ID_COMBUSTIBLE</th>
                        <th scope="col">ID_TRANSMISION</th>
                        <th scope="col">ID_FABRICANTE</th>
                        <th scope="col">PLACA</th>
                        <th scope="col">AÑO</th>
                        <th scope="col">MODELO</th>
                        <th scope="col">COLOR</th>
                        <th scope="col">CILINDRADA</th>
                        <th scope="col">COSTO</th>
                        <th scope="col">ESTADO</th>
                        <th scope="col">RENDIMIENTO</th>
                        <th scope="col">VELOCIDAD_MÁXIMA</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input id="idTipo" type="text" class="form-control"/>
                        </td>
                        <td>
                            <input id="idCombu" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="idTrans" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="idFabri" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Placa" type="text" class="form-control" />
                         </td>
                        <td>
                            <input id="Anio" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Modelo" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Color" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Cilindrada" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Costo" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Estado" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Rendimiento" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Velocidad" type="text" class="form-control" />
                        </td>
                        <td>
                            <button id="btnInsVehi" type="button" class="btn btn-success" style="width: auto;">Guardar</button>
                        </td>
                    </tr>
                </tbody>
            </table>

             <h2 class ="text-center">Actualizar y Borrar Vehiculos</h2>
        <div class="grid text center container">
        <table class="table-primary table">
                <thead>
                    <tr>
                        <th scope="col">ID_VEHICULO</th>
                        <th scope="col">ID_TIPO</th>
                        <th scope="col">ID_COMBUSTIBLE</th>
                        <th scope="col">ID_TRANSMISION</th>
                        <th scope="col">ID_FABRICANTE</th>
                        <th scope="col">PLACA</th>
                        <th scope="col">AÑO</th>
                        <th scope="col">MODELO</th>
                        <th scope="col">COLOR</th>
                        <th scope="col">CILINDRADA</th>
                        <th scope="col">COSTO</th>
                        <th scope="col">ESTADO</th>
                        <th scope="col">RENDIMIENTO</th>
                        <th scope="col">VELOCIDAD_MÁXIMA</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input id="idVehitxt" type="text" class="form-control"/>
                        </td>
                        <td>
                            <input id="idTipotxt" type="text" class="form-control"/>
                        </td>
                        <td>
                            <input id="idCombutxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="idTranstxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="idFabritxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Placatxt" type="text" class="form-control" />
                         </td>
                        <td>
                            <input id="Aniotxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Modelotxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Colortxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Cilindradatxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Costotxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Estadotxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Rendimientotxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <input id="Velocidadtxt" type="text" class="form-control" />
                        </td>
                        <td>
                            <button id="btnEditar" type="button" class="btn btn-success" style="width: auto;">Editar</button>
                        </td>
                        <td>
                            <button id="btnBorrar" type="button" class="btn btn-success" style="width: auto;">Borrar</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <h2 class ="text-center">Tabla vehiculos sin japon ni alemania</h2>
             <div class="grid text-center container">
            <table class="table-secondary table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID_VEHICULO</th>
                        <th scope="col">ID_COMBUSTIBLE</th>
                        <th scope="col">COMBUSTIBLE</th>
                        <th scope="col">ID_TIPO</th>
                        <th scope="col">TIPO</th>
                        <th scope="col">ID_TRANSMISION</th>
                        <th scope="col">TRANSMISION</th>
                        <th scope="col">ID_FABRICANTE</th>
                        <th scope="col">FABRICANTE</th>
                        <th scope="col">ID_PAIS</th>
                        <th scope="col">PAIS</th>
                        <th scope="col">PLACA</th>
                        <th scope="col">AÑO</th>
                        <th scope="col">MODELO</th>
                        <th scope="col">COLOR</th>
                        <th scope="col">CILINDRADA</th>
                        <th scope="col">COSTO</th>
                        <th scope="col">ESTADO</th>
                        <th scope="col">RENDIMIENTO</th>
                        <th scope="col">VELOCIDAD_MÁXIMA</th>
                        <th scope="col">USUARIO_GRABACION</th>
                        <th scope="col">FECHA_GRABACION</th>
                        <th scope="col">USUARIO_EDICION</th>
                        <th scope="col">FECHA_EDICION</th>
                    </tr>
                </thead>
                <tbody
                    class="claseTabla" style="text-align-last: center;">
                </tbody>
            </table>
        </div>

            <h2 class ="text-center">Tabla vehiculos alfabeticamente</h2>
            <div class="grid text-center container">
            <table class="table-secondary table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID_VEHICULO</th>
                        <th scope="col">COMBUSTIBLE</th>
                        <th scope="col">TIPO</th>
                        <th scope="col">TRANSMISION</th>
                        <th scope="col">FABRICANTE</th>
                        <th scope="col">PAIS</th>
                        <th scope="col">ABREVIATURA</th>
                        <th scope="col">MODELO</th>
                        <th scope="col">PLACA</th>
                        <th scope="col">AÑO</th>
                        <th scope="col">COLOR</th>
                        <th scope="col">CILINDRADA</th>
                        <th scope="col">FECHA_GRABACION</th>
                        <th scope="col">FECHA_EDICION</th>
                    </tr>
                </thead>
                <tbody
                    class="claseTabla1" style="text-align-last: center;">
                </tbody>
            </table>
        </div>
        
                
            <hr />
        </div>
    </form>
</body>
</html>
