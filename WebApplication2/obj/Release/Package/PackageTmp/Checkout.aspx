<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApplication2.Checkout" %>

<%@ Register assembly="DevExpress.Web.v23.1, Version=23.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
      <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Checkout</title>
        <link rel="shortcut icon" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
    </head>
    <body>
        <form id="form1" runat="server">
            <section class="h-100" style="background-color: #eee;">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="card">
                                <div class="card-body p-4">

                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <h4 class="Titulo">&nbsp;Datos Generales</h4>
                                                        </div>
                                                        <div class="col-8">
                                                            <hr class="separador-seccion" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 col-sm-4">
                                                            <label class="Titulo">NIT <span style="color:#ff0000">*</span></label><br />
                                                            <asp:TextBox ID="txtClienteNit" runat="server" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                        <div class="col-6 col-sm-4">
                                                            <label class="Titulo">Nombre <span style="color:#ff0000">*</span></label><br />
                                                            <asp:TextBox ID="txtClienteNombre" runat="server" CssClass="form-control" placeholdere=""></asp:TextBox>
                                                        </div>
                                                        <div class="col-6 col-sm-4">
                                                            <label class="Titulo">Apellido <span style="color:#ff0000">*</span></label><br />
                                                            <asp:TextBox ID="txtClienteApellido" runat="server" CssClass="form-control" placeholdere=""></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="row">
                                                        <div class="col-12 col-sm-12">
                                                            <label class="Titulo">Empresa</label><br />
                                                            <asp:TextBox ID="txtClienteEmpresa" runat="server" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="row">
                                                        <div class="col-12 col-sm-4">
                                                            <label class="Titulo">Tel&eacute;fono <span style="color:#ff0000">*</span></label><br />
                                                            <asp:TextBox ID="txtClienteTelefono" runat="server" CssClass="form-control" MaxLength="8" TextMode="Number"
                                                                         onkeypress="return ValidadorNumerico(event, this);" oninput="validarLongitud(this);"></asp:TextBox>
                                                        </div>
                                                        <div class="col-12 col-sm-8">
                                                            <label class="Titulo">Correo Electr&oacute;nico <span style="color:#ff0000">*</span></label><br />
                                                            <asp:TextBox ID="txtClienteDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <h4 class="Titulo">Direcci&oacute;n</h4>
                                                        </div>
                                                        <div class="col-8">
                                                            <hr class="separador-seccion" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <label class="Titulo">Tipo Envio</label><br />
                                                            <dx:ASPxComboBox ID="ddlTipoEnvio" runat="server" CssClass="form-control" EnableSynchronization="False"
                                                                             OnSelectedIndexChanged="ddlTipoEnvio_SelectedIndexChanged" AutoPostBack="True"
                                                                             IncrementalFilteringMode="None" DropDownStyle="DropDown">
                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
                                                        LoadingPanel.Show();
                                                    }" />
                                                            </dx:ASPxComboBox>
                                                            <asp:RadioButton ID="RadioButton_SeleccionarDireccion" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton_SeleccionarDireccion_CheckedChanged" Text="Seleccionar Dirección" />
                                                            <asp:RadioButton ID="RadioButton_RecogerFarmacia" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButton_RecogerFarmacia_CheckedChanged" Text="Recoger en Farmacia" />
                                                        </div>
                                                    </div>

                                                    <div id="divDireccionesFarmacia" runat="server" class="row" visible="false" style="padding-top:10px;">
                                                        <div class="col-12">
                                                            <label class="Titulo">Departamento</label><br />
                                                            <dx:ASPxComboBox ID="ddlDireccionesSitioDepartamento" CssClass="form-control" runat="server" EnableSynchronization="False"
                                                                             IncrementalFilteringMode="StartsWith" DropDownStyle="DropDown" OnSelectedIndexChanged="ddlDireccionesSitioDepartamento_SelectedIndexChanged"
                                                                             AutoPostBack="true"></dx:ASPxComboBox>
                                                            <br />
    <asp:DropDownList ID="ddlDepartamentos" runat="server" AppendDataBoundItems="true">
    <asp:ListItem Text="Seleccionar Departamento" Value="0" />
</asp:DropDownList>
                                                        </div>
                                                        <div class="col-7" style="padding-top:10px;">
                                                            <label class="Titulo">Municipio</label><br />
                                                            <dx:ASPxComboBox ID="ddlDireccionesSitioMunicipio" CssClass="form-control" runat="server" EnableSynchronization="False"
                                                                             IncrementalFilteringMode="StartsWith" DropDownStyle="DropDown" OnSelectedIndexChanged="ddlDireccionesSitioMunicipio_SelectedIndexChanged"
                                                                             AutoPostBack="true"></dx:ASPxComboBox>
                                                        </div>
                                                        <div class="col-5" style="padding-top:10px;">
                                                            <label class="Titulo">Zona</label><br />
                                                            <dx:ASPxComboBox ID="ddlDireccionesSitioZona" CssClass="form-control" runat="server" EnableSynchronization="False"
                                                                             IncrementalFilteringMode="StartsWith" DropDownStyle="DropDown" OnSelectedIndexChanged="ddlDireccionesSitioZona_SelectedIndexChanged"></dx:ASPxComboBox>
                                                        </div>
                                                        <div class="col-12" style="padding-top:10px;">
                                                            <label class="Titulo">Farmacias</label><br />
                                                            <dx:ASPxComboBox ID="ddlDireccionesSitioFarmacia" CssClass="form-control" runat="server" EnableSynchronization="False"
                                                                             IncrementalFilteringMode="StartsWith" DropDownStyle="DropDown" OnSelectedIndexChanged="ddlDireccionesSitioFarmacia_SelectedIndexChanged"></dx:ASPxComboBox>
                                                        </div>
                                                    </div>
                                                    <div id="divDireccionesCliente" runat="server" class="row" visible="false" style="padding-top:10px;">
                                                        <div class="col-12">
                                                            <label class="Titulo">Dirección</label><br />
                                                            <dx:ASPxComboBox ID="ddlDireccionesCliente" CssClass="form-control" runat="server" EnableSynchronization="False"
                                                                             OnSelectedIndexChanged="ddlDireccionesCliente_SelectedIndexChanged" AutoPostBack="true"
                                                                             IncrementalFilteringMode="StartsWith" DropDownStyle="DropDown">
                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
                                                        LoadingPanel.Show();
                                                    }" />
                                                            </dx:ASPxComboBox>
                                                        </div>

                                                        <div id="divDireccionesClienteNueva" runat="server" class="col-12" style="padding-top:10px;" visible="false">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <label class="Titulo">Departamento</label><br />
                                                                    <dx:ASPxComboBox ID="ddlDireccionesClienteDepartamento"
                                                                                     CssClass="form-control"
                                                                                     runat="server"
                                                                                     IncrementalFilteringMode="StartsWith"
                                                                                     DropDownStyle="DropDown"
                                                                                     EnableSynchronization="False"
                                                                                     OnSelectedIndexChanged="ddlDireccionesClienteDepartamento_SelectedIndexChanged"
                                                                                     AutoPostBack="true">
                                                                    </dx:ASPxComboBox>
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-7">
                                                                    <label class="Titulo">Municipio</label><br />
                                                                    <dx:ASPxComboBox ID="ddlDireccionesClienteMunicipio" CssClass="form-control" runat="server" EnableSynchronization="False"
                                                                                     IncrementalFilteringMode="StartsWith" DropDownStyle="DropDown" OnSelectedIndexChanged="ddlDireccionesClienteMunicipio_SelectedIndexChanged"
                                                                                     AutoPostBack="true"></dx:ASPxComboBox>
                                                                </div>
                                                                <div class="col-5">
                                                                    <label class="Titulo">Zona</label><br />
                                                                    <dx:ASPxComboBox ID="ddlDireccionesClienteZona" CssClass="form-control" runat="server" EnableSynchronization="False"
                                                                                     IncrementalFilteringMode="StartsWith" DropDownStyle="DropDown"></dx:ASPxComboBox>
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-7">
                                                                    <label class="Titulo">Direcci&oacute;n</label><br />
                                                                    <textarea id="txtDireccionesClienteDireccion" runat="server" class="form-control" style="resize:none;" rows="2"></textarea>
                                                                </div>
                                                                <div class="col-5">
                                                                    <label class="Titulo">Indicaciones</label><br />
                                                                    <textarea id="txtDireccionesClienteIndicaciones" runat="server" class="form-control" style="resize:none;" rows="2"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <h4 class="Titulo">Observaciones</h4>
                                                        </div>
                                                        <div class="col-8">
                                                            <hr class="separador-seccion" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <textarea id="txtClienteObservacion" runat="server" class="form-control" style="resize:none;" rows="2"></textarea>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <h4 class="Titulo">Forma Pago</h4>
                                                        </div>
                                                        <div class="col-8">
                                                            <hr class="separador-seccion" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" Theme="Mulberry" Width="100%">
                                                                <TabPages>
                                                                    <dx:TabPage Text="Efectivo" ActiveTabStyle-Font-Bold="true">
                                                                        <ContentCollection>
                                                                            <dx:ContentControl>
                                                                                <div class="row">
                                                                                    <div class="col-8">
                                                                                        <label class="Titulo">Dinos tu pago en efectivo para calcular tu vuelto</label><br />
                                                                                        <asp:TextBox ID="txtFormaPagoEfectivo" runat="server" CssClass="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                    <div class="col-4">
                                                                                        <label class="Titulo">&nbsp;</label><br />
                                                                                        <dx:ASPxButton ID="btnFormaPagoEfectivoPedido" runat="server" Text="Crear Pedido"
                                                                                                       CssClass="form-control btn btn-success"
                                                                                                       OnClick="btnFormaPagoEfectivoPedido_Click">

                                                                                            <ClientSideEvents Click="function(s, e) {
                                                                                LoadingPanel.Show();
                                                                            }" />
                                                                                        </dx:ASPxButton>
                                                                                    </div>
                                                                                </div>
                                                                            </dx:ContentControl>
                                                                        </ContentCollection>
                                                                    </dx:TabPage>
                                                                    <dx:TabPage Text="Tarjeta" ActiveTabStyle-Font-Bold="true">
                                                                        <ContentCollection>
                                                                            <dx:ContentControl>
                                                                                <div class="row">
                                                                                    <div class="col-sm-12" style="text-align:right;">
                                                                                        <img src="images/visa.png" />
                                                                                        <img src="images/mastercard.png" />
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-sm-2">
                                                                                        <label class="Titulo">Nombre</label>
                                                                                    </div>
                                                                                    <div class="col-sm-10">
                                                                                        <asp:TextBox ID="txtPasarelaTarjetaNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <br />
                                                                                <div class="row">
                                                                                    <div class="col-sm-2">
                                                                                        <label class="Titulo">Apellido</label>
                                                                                    </div>
                                                                                    <div class="col-sm-10">
                                                                                        <asp:TextBox ID="txtPasarelaTarjetaApellido" runat="server" CssClass="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <br />
                                                                                <div class="row">
                                                                                    <div class="col-sm-2">
                                                                                        <label class="Titulo">No. Tarjeta</label>
                                                                                    </div>
                                                                                    <div class="col-sm-10">
                                                                                        <asp:TextBox ID="txtTarjetaNvaNumero" runat="server" CssClass="form-control"
                                                                                                     onkeypress="return ValidadorTarjeta(event, this);" onkeydown="ValidaCopiarPegarNumericos();" onkeyup="CasteoTarjeta(this);" MaxLength="19"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <br />
                                                                                <div class="row">
                                                                                    <div class="col-sm-2">
                                                                                        <label class="Titulo">Mes</label>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <asp:DropDownList ID="ddlTarjetaInfoMes" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                                    </div>
                                                                                    <div class="col-sm-1">&nbsp;</div>
                                                                                    <div class="col-sm-1">
                                                                                        <label class="Titulo">Año</label>
                                                                                    </div>
                                                                                    <div class="col-sm-4">
                                                                                        <asp:DropDownList ID="ddlTarjetaInfoAnio" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                                    </div>
                                                                                </div>
                                                                                <br />
                                                                                <div class="row">
                                                                                    <div class="col-8">
                                                                                        &nbsp;
                                                                                    </div>
                                                                                    <div class="col-4">
                                                                                        <dx:ASPxButton ID="btnFormaPagoTarjetaCobrar" runat="server" Text="Crear Pedido"
                                                                                                       CssClass="form-control btn btn-success"
                                                                                                       OnClick="btnFormaPagoTarjetaCobrar_Click">
                                                                                            <ClientSideEvents Click="function(s, e) {
                                                                                LoadingPanel.Show();
                                                                            }" />
                                                                                        </dx:ASPxButton>
                                                                                    </div>
                                                                                </div>
                                                                            </dx:ContentControl>
                                                                        </ContentCollection>
                                                                    </dx:TabPage>
                                                                    <dx:TabPage Text="Salud y Empresa" ActiveTabStyle-Font-Bold="true">
                                                                        <ContentCollection>
                                                                            <dx:ContentControl>
                                                                                <div class="row">
                                                                                    <div class="col-5">
                                                                                        <label class="Titulo">DPI</label><br />
                                                                                        <asp:TextBox ID="txtFormaPagoSyEDpi" runat="server" CssClass="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                    <div class="col-4">
                                                                                        <label class="Titulo">PIN</label><br />
                                                                                        <asp:TextBox ID="txtFormaPagoSyEPin" runat="server" CssClass="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                    <div class="col-3">
                                                                                        <label class="Titulo">&nbsp;</label><br />
                                                                                        <dx:ASPxButton ID="btnFormaPagoSyEValidar" runat="server" Text="Validar"
                                                                                                       CssClass="btn btn-primary form-control"
                                                                                                       OnClick="btnFormaPagoSyEValidar_Click">
                                                                                            <ClientSideEvents Click="function(s, e) {
                                                                                    LoadingPanel.Show();
                                                                                }" />
                                                                                        </dx:ASPxButton>
                                                                                    </div>
                                                                                </div>
                                                                                <br />
                                                                                <div id="divFormaPagoSyEDatos" runat="server" class="row" visible="false">
                                                                                    <div class="col">
                                                                                        <div class="row">
                                                                                            <div class="col-12">
                                                                                                <label class="Titulo">Empresa</label><br />
                                                                                                <asp:TextBox ID="txtFormaPagoSyEEmpresa" runat="server" CssClass="form-control"
                                                                                                             ReadOnly="true" Enabled="true"></asp:TextBox>
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col-12">
                                                                                                <label class="Titulo">Disponible</label><br />
                                                                                                <asp:TextBox ID="txtFormaPagoSyEDisponible" runat="server" CssClass="form-control"
                                                                                                             ReadOnly="true" Enabled="true"></asp:TextBox>
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                        <div class="row">
                                                                                            <div class="col-12">
                                                                                                <label class="Titulo">Observaci&oacute;n</label><br />
                                                                                                <asp:TextBox ID="txtFormaPagoSyEObservacion" runat="server" CssClass="form-control"
                                                                                                             ReadOnly="true" Enabled="true"></asp:TextBox>
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                                                                                            <div class="row">
                                                                                            <div class="col-7">
                                                                                                <label class="Titulo">Cuotas</label>
                                                                                                <asp:DropDownList ID="ddlFormaPagoSyECuotas" runat="server" CssClass="form-control"></asp:DropDownList>
                                                                                            </div>
                                                                                            <div class="col-1">
                                                                                                &nbsp;
                                                                                            </div>
                                                                                            <div class="col-4">
                                                                                                <label>&nbsp;</label><br />
                                                                                                <dx:ASPxButton ID="btnFormaPagoSyEPedido" runat="server" Text="Crear Pedido"
                                                                                                               CssClass="form-control btn btn-success" OnClick="btnFormaPagoSyEPedido_Click">
                                                                                                    <ClientSideEvents Click="function(s, e) {
                                                                                        LoadingPanel.Show();
                                                                                    }" />
                                                                                                </dx:ASPxButton>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </dx:ContentControl>
                                                                        </ContentCollection>
                                                                    </dx:TabPage>
                                                                </TabPages>
                                                            </dx:ASPxPageControl>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="row separador">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col-5">
                                                            <h4 class="Titulo">Carrito</h4>
                                                        </div>
                                                        <div class="col-7">
                                                            <hr class="separador-seccion" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <table class="producto_listado">
                                                                <thead>
                                                                    <tr class="producto_encabezado">
                                                                        <th class="producto_nombre">Producto</th>
                                                                        <th class="producto_espacio">&nbsp</th> <%--espacio en blanco--%>
                                                                        <th class="producto_precio">Subtotal</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr class="producto_fila">
                                                                        <td class="producto_nombre">
                                                                            Limpieza Facial Jabon En Barra Normaderm Piel Grasa/acne X 70 G<strong class="producto_cant">&nbsp;&nbsp;×&nbsp;1</strong>
                                                                        </td>
                                                                        <td class="producto_espacio">&nbsp</td> <%--espacio en blanco--%>
                                                                        <td class="producto_precio">
                                                                            <span>Q.</span>111.45
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr class="producto_pie">
                                                                        <td class="producto_nombre">Subtotal</td>
                                                                        <td class="producto_espacio">&nbsp</td> <%--espacio en blanco--%>
                                                                        <td class="producto_precio"><span>Q.</span> <label>111.45</label></td>
                                                                    </tr>

                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                       
            </section>

            <script type="text/javascript" src="js/jquery-3.7.0.min.js"></script>
            <script type="text/javascript" src="js/bootstrap.min.js"></script>
            <script type="text/javascript" src="js/dermacenterCheckout.js"></script>
        </form>
    </body>
</html>
 