<!DOCTYPE html>
<script runat="server">


</script>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizar Compra</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/estilos.css" />
    <style>
        /* Estilos previos omitidos para mantener la simplicidad */
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-6">
                <h4 class="Titulo">Detalles de cobro</h4>
                <hr class="separador-seccion" />
                <form id="form1" runat="server">
                    <div class="form-group">
                        <label for="nombre">Nombre *</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido">Apellido *</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" required>
                    </div>
                    <div class="form-group">
                        <label for="empresa">Empresa</label>
                        <input type="text" class="form-control" id="empresa" name="empresa">
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono *</label>
                        <input type="tel" class="form-control" id="telefono" name="telefono" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Correo Electrónico *</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion">
                    </div>
                    <div class="form-group">
                        <label for="tipoEnvio">Tipo Envío</label>
                        <select class="form-control" id="tipoEnvio" name="tipoEnvio">
                            <option value="dom">A Domicilio</option>
                            <option value="farmacia">Recoger en Farmacia</option>
                        </select>
                    </div>
                      <div class="form-group">
         <label for="ddlDepartamentos">
        <asp:DropDownList ID="ddlDepartamentos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartamentos_SelectedIndexChanged">
    <asp:ListItem Text="Seleccionar Departamento" Value="0" />
</asp:DropDownList>
         </label>
  </div>
                                        <div class="form-group">
                        <label for="observaciones">
  
                                            Observaciones</label>
                        <textarea class="form-control" id="observaciones" name="observaciones" rows="4"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Forma Pago</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="formaPago" id="efectivo" value="efectivo">
                            <label class="form-check-label" for="efectivo">Efectivo</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="formaPago" id="tarjeta" value="tarjeta">
                            <label class="form-check-label" for="tarjeta">Tarjeta</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="formaPago" id="saludEmpresa" value="saludEmpresa">
                            <label class="form-check-label" for="saludEmpresa">Salud y Empresa</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Finalizar Compra</button>
                </form>
            </div>
             <!-- Tabla para el GridView -->
            <div class="col-12 col-md-6">
          
                 <h4 class="Titulo">Productos Seleccionados</h4>
                    <hr class="separador-seccion" />
    <table>
        <thead>
            <tr>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Limpieza Facial Jabon En Barra Normaderm Piel Grasa/acne X 70 G</td>
                <td>Q.50.00</td>
                <td>2</td>
                <td>Q.100.00</td>
            </tr>
            
            <tr>
                <td>Limpieza Facial Jabon En Barra Normaderm Piel Grasa/acne X 70 G</td>
                <td>Q.50.00</td>
                <td>2</td>
                <td>Q.100.00</td>
            </tr>


            <!-- Agrega más filas para otros productos si es necesario -->
        </tbody>
            
    </table>
                <hr class="separador-seccion" />
                    <div class="total-general">
        Total General: Q.100.00 <!-- Calcula y muestra el total aquí -->
    </div> 
                 </div>

        
    </div>
        </div>
  
</body>
</html>
