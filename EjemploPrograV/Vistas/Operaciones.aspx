<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Operaciones.aspx.cs" Inherits="EjemploPrograV.Vistas.Operaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.7.0/jquery-3.7.0.js"></script>
    <script src="../Scripts/bootstrap/js/bootstrap.min.js"></script>
    <title>Operaciones</title>
</head>
<body>
    <script type="text/javascript">
        function calcularSuma() {
            var num1 = $("#txtSumaA").val();
            var num2 = $("#txtSumaB").val();
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/Operaciones.asmx/Suma",
                data: JSON.stringify({ num1: num1, num2: num2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#lblSumaResultado").text(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        function calcularResta() {
            var num1 = $("#txtRestaA").val();
            var num2 = $("#txtRestaB").val();
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/Operaciones.asmx/Resta",
                data: JSON.stringify({ num1: num1, num2: num2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#lblRestaResultado").text(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        function calcularMulti() {
            var num1 = $("#txtMultiA").val();
            var num2 = $("#txtMultiB").val();
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/Operaciones.asmx/Multiplicacion",
                data: JSON.stringify({ num1: num1, num2: num2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#lblMultiResultado").text(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        function calcularDivi() {
            var num1 = $("#txtDiviA").val();
            var num2 = $("#txtDiviB").val();
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/Operaciones.asmx/Division",
                data: JSON.stringify({ num1: num1, num2: num2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#lblDiviResultado").text(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        function calcularResi() {
            var num1 = $("#txtResiA").val();
            var num2 = $("#txtResiB").val();
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/Operaciones.asmx/Residuo",
                data: JSON.stringify({ num1: num1, num2: num2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#lblResiResultado").text(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        function calcularFact() {
            var num = $("#txtFactA").val();
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/Operaciones.asmx/Factorial",
                data: JSON.stringify({ num: num}),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#lblFactResultado").text(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        function calcularEdad() {
            var anio_nacimiento = $("#txtEdadA").val();
            var anio_actual = $("#txtAnioB").val();
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/Operaciones.asmx/Edad",
                data: JSON.stringify({ anio_nacimiento: anio_nacimiento, anio_actual: anio_actual }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#lblEdadResultado").text(response.d);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }

        function calcularTabla() {
            var numero = $("#txtNumero").val();
            var lineas = $("#txtLineas").val();
            $.ajax({
                type: "POST",
                url: "https://localhost:44344/Servicios/Operaciones.asmx/Calcular_Tabla",
                data: JSON.stringify({ numero: numero, lineas: lineas }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var tabla = response.d;
                    var tablaHtml = "<h2>Tabla de multiplicar del número " + numero + "</h2><br/>";
                    tablaHtml += "<table>";
                    for (var i = 0; i < tabla.length; i++) {
                        tablaHtml += "<tr><td>" + tabla[i] + "</td></tr>";
                    }
                    tablaHtml += "</table>";
                    $("#divTablaMultiplicar").html(tablaHtml);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("Error: " + xhr.status + "\n" + thrownError);
                }
            });
        }
    </script>
    <form id="form1" runat="server">
        <hr />
         <!-- Suma -->
        <h2 class ="text-center">Suma</h2>
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <input id="txtSumaA" type="number" class="form-control" placeholder="Número A" aria-label="Numero A"/>           
                    </td>
                    <td>
                        <input id="txtSumaB" type="number" class="form-control" placeholder="Número B" aria-label="Numero B"/>            
                    </td>
                    <td>
                        <input id="btnSuma" type="button" class="btn btn-primary" style="width:auto;" value="Sumar" onclick="calcularSuma()" />
                    </td>
                    <td>
                     <span id="lblSumaResultado" class="form-control" placeholder="Resultado" aria-label="Resultado">Resultado</span>
                    </td>
                </tr>
            </table>
            <hr />
            </div>
        <!-- Resta -->
            <h2 class ="text-center">Resta</h2>
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <input id="txtRestaA" type="number" class="form-control" placeholder="Número A" aria-label="Numero A"/>           
                    </td>
                    <td>
                        <input id="txtRestaB" type="number" class="form-control" placeholder="Número B" aria-label="Numero B"/>            
                    </td>
                    <td>
                        <input id="btnResta" type="button" class="btn btn-primary" style="width:auto;" value="Resta" onclick="calcularResta()" />
                    </td>
                    <td>
                     <span id="lblRestaResultado" class="form-control" placeholder="Resultado" aria-label="Resultado">Resultado</span>
                    </td>
                </tr>
            </table>
            <hr />
        </div>
        <!-- Multiplicacion -->
        <h2 class ="text-center">Multiplicacion</h2>
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <input id="txtMultiA" type="number" class="form-control" placeholder="Número A" aria-label="Numero A"/>           
                    </td>
                    <td>
                        <input id="txtMultiB" type="number" class="form-control" placeholder="Número B" aria-label="Numero B"/>            
                    </td>
                    <td>
                        <input id="btnMulti" type="button" class="btn btn-primary" style="width:auto;" value="Multiplicar" onclick="calcularMulti()" />
                    </td>
                    <td>
                     <span id="lblMultiResultado" class="form-control" placeholder="Resultado" aria-label="Resultado">Resultado</span>
                    </td>
                </tr>
            </table>
            <hr />
        </div>

        <!-- Division -->
        <h2 class ="text-center">Division</h2>
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <input id="txtDiviA" type="number" class="form-control" placeholder="Número A" aria-label="Numero A"/>           
                    </td>
                    <td>
                        <input id="txtDiviB" type="number" class="form-control" placeholder="Número B" aria-label="Numero B"/>            
                    </td>
                    <td>
                        <input id="btnDivi" type="button" class="btn btn-primary" style="width:auto;" value="Dividir" onclick="calcularDivi()" />
                    </td>
                    <td>
                     <span id="lblDiviResultado" class="form-control" placeholder="Resultado" aria-label="Resultado">Resultado</span>
                    </td>
                </tr>
            </table>
            <hr />
        </div>

        <!-- Residuo -->
        <h2 class ="text-center">Residuo</h2>
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <input id="txtResiA" type="number" class="form-control" placeholder="Número A" aria-label="Numero A"/>           
                    </td>
                    <td>
                        <input id="txtResiB" type="number" class="form-control" placeholder="Número B" aria-label="Numero B"/>            
                    </td>
                    <td>
                        <input id="btnResi" type="button" class="btn btn-primary" style="width:auto;" value="Residuo" onclick="calcularResi()" />
                    </td>
                    <td>
                     <span id="lblResiResultado" class="form-control" placeholder="Resultado" aria-label="Resultado">Resultado</span>
                    </td>
                </tr>
            </table>
            <hr />
        </div>

        <!-- Factorial -->
        <h2 class ="text-center">Factorial</h2>
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <input id="txtFactA" type="number" class="form-control" placeholder="Número A" aria-label="Numero A"/>           
                    </td>
                    <td>
                        <input id="btnFact" type="button" class="btn btn-primary" style="width:auto;" value="Factorial" onclick="calcularFact()" />
                    </td>
                    <td>
                     <span id="lblFactResultado" class="form-control" placeholder="Resultado" aria-label="Resultado">Resultado</span>
                    </td>
                </tr>
            </table>
            <hr />
        </div>

        <!-- Edad -->
        <h2 class ="text-center">Edad</h2>
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <input id="txtEdadA" type="number" class="form-control" placeholder="Año de nacimiento" aria-label="Año de nacimiento"/>           
                    </td>
                    <td>
                        <input id="txtAnioB" type="number" class="form-control" placeholder="Año actual" aria-label="Año actual"/>            
                    </td>
                    <td>
                        <input id="btnEdad" type="button" class="btn btn-primary" style="width:auto;" value="Multiplicar" onclick="calcularEdad()" />
                    </td>
                    <td>
                     <span id="lblEdadResultado" class="form-control" placeholder="Resultado" aria-label="Resultado">Resultado</span>
                    </td>
                </tr>
            </table>
            <hr />
        </div>

        <!-- Tablas-->
        <h2 class ="text-center">Tablas Multiplicar</h2>
        <div class="grid text center container">
            <table class="table-secondary table">
                <tr>
                    <td>
                        <input id="txtNumero" type="number" class="form-control" placeholder="Numero a Multiplicar" aria-label="Numero a Multiplicar"/>           
                    </td>
                    <td>
                        <input id="txtLineas" type="number" class="form-control" placeholder="Cantidad de Lineas" aria-label="Cantidad de Lineas"/>            
                    </td>
                    <td>
                        <input id="btnTablaMultiplicar" type="button" class="btn btn-primary" style="width:auto;" value="Calcular" onclick="calcularTabla()" />
                    </td>
                    <td>
                     <div id="divTablaMultiplicar" class="form-control">Tabla</div>
                    </td>
                </tr>
            </table>
            <hr />
        </div>
    </form>
</body>

</html>