.0<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="PAYMENT.aspx.cs" Inherits="WebApplication2.PAYMENT" %>
<%@ Register assembly="DevExpress.Web.v23.1, Version=23.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %><%@ Register assembly="DevExpress.Web.Bootstrap.v23.1, Version=23.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %><%@ Register assembly="DevExpress.Web.ASPxTreeList.v23.1, Version=23.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %><%@ Register assembly="DevExpress.Web.ASPxRichEdit.v23.1, Version=23.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRichEdit" tagprefix="dx" %><!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head runat="sCheckout</title>
    <link rel="shortcut icon" /><link rel="stylesheet" href="css/bootstrap.min.css"/><link rel="stylesheet" href="css/estilos.css" /><%--<link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/PasarelaPago.css" />--%><script type="text/javascript" src="js/jquery-3.6.0.min.js">

    </script><script type="text/javascript" src="js/bootstrap.min.js">
   </script><script type="text/javascript" src="js/PasarelaPago.js">
   </script><link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"><link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"rel="stylesheet"><script src="https://code.jquery.com/jquery-3.6.4.min.js"></script><!-- Asegúrate de que DevExpress Client-Side Libraries esté cargado antes de tu script --><script src="https://cdn3.devexpress.com/jslib/20.1.6/js/dx.web.js"></script><style type="text/css">
      .boton-profesional {
          background-color: #007bff;
          color: #fff;
          padding: 10px 20px;
          font-size: 16px;
          border: none;
          border-radius: 5px;
          cursor: pointer;
      }


       .button-container button {
    border: none;
    outline: none;
    background: transparent;
  }
    
        /* table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
       */   
          input[type=number]::-webkit-inner-spin-button,
  input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }
  input[type=number] {
    -moz-appearance: textfield;
  }

        #totalformateado {
  font-weight: bold;
}

          .box4 span {
    font-size: 19px;
    font-weight: bold;
    border-bottom: 2px double black; /* Ajusta el grosor, estilo y color según tus preferencias */
    display: inline-grid; /* Asegura que el borde no se extienda por toda la línea */
    padding-bottom: 5px; /* Ajusta el espacio entre el texto y las líneas */
       text-align: right; /* Alinea todo el contenido a la derecha */
       
  }

    #tablaArticulos {
        width: 100%;
        border-collapse: collapse;
        margin-top: 0px;
    }

    #tablaArticulos th, #tablaArticulos td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    #tablaArticulos th {
        background-color: #f2f2f2;
    }

    #tablaArticulos tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    #tablaArticulos tbody tr:hover {
        background-color: #e5e5e5;
    }

    #tablaArticulos img {
        max-width: 50px;
        max-height: 50px;
    }



    th, td {
       
        border-collapse:collapse;
                
        /*text-align: center;
        border: 1px solid #ddd;  Add borders to cells */
    }

   #tablaArticulos input[type="number"] {
    width: 60px; /* Adjust the width as needed */
    text-align: left;
}

    .button-container {
        display: flex;
        justify-content: space-around;
    }

  
     
      #total_saludEmpresa {
          display: none;
      }
      .button-container {
    display: flex; /* Para que los botones se muestren en línea */
    gap: 5px; /* Espacio entre los botones */
}
      .small-image {
    width: 100px; /* Cambia el tamaño de acuerdo a tus preferencias */
    height: auto; /* Autoajusta la altura para mantener la proporción */
}
      .container {
          width: 200px;
          margin: 20px auto;
          background-color: #f0f0f0;
          padding: 10px;
          border: 2px solid #ccc;
          border-radius: 5px;
          text-align: center;
      }
      .box span:first-child {
  margin-right: 5px; /* Espacio entre el símbolo "Q" y el texto */
}
  .box {
  display: flex;
  align-items: center; /* Para alinear verticalmente los elementos */
}

         .box2 {
     background-color: white;
     color: black;
     
 }        .box3 {
    background-color: white;
    font-size: 16px;
color: black;
}

      .total-label {
          font-size: 16px;
          color: blue; /* Cambiar el color de la etiqueta a azul */
      }
        
      #total {
          font-size: 24px;
          font-weight: bold;
          color: black;
          margin-top: 5px;
          align-content:flex-end;
      }

      .boton-profesional:hover {
          background-color: #0056b3;
      }

      .dxeCheckBoxChecked {
          background-color: orange !important;
      }

      .align-right {
          display: flex;
          justify-content: flex-end;
          align-items: center;
      }
      /* Estilos para tarjetas o elementos de lista */
      /* Estilos para tarjetas o elementos de lista */
      .card {
          border: 1px solid #ccc;
          padding: 10px;
          margin: 5px;
          cursor: pointer;
      }

      .checkbox-container {
          display: flex;
          flex-direction: column;
      }

      .auto-style10 {
          /* Establecer para pantalla completa */
          position: fixed;
          top: 0;
          left: 20px;
          right: 20px;
          bottom: 0;
          border: 1px solid #ddd; /* Ejemplo de borde */
          padding: 10px; /* Ejemplo de espacio interno */
      }

       .checkbox-group {
        display: flex;
        flex-direction: column;
    }
    .checkbox-group div {
        margin-bottom: 5px;
    }
    .checkbox-group label {
        margin-left: 5px;
    }
      .container-wrapper {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-around;
      }

      .container {
          flex: 1 1 200px; /* Ajusta el ancho máximo de cada contenedor según tus necesidades */
          margin: 10px;
      }


      .pago {
          background-color: white;
          height: 100%;
          text-align: center;
          font-weight: bold;
          font-size: 16px;
          color: black;
          
          /*padding: 5px;*/
      }

      .total {
          height: 50px;
          text-align: center;
          font-weight: bold;
          font-size: 16px;
          color: black;
          padding: 5px;
          background-color: white;
      }

      .sinfondo {
          height: 50px;
          text-align: center;
          font-weight: bold;
          font-size: 16px;
          color: black;
          padding: 5px;
          background-color: white;
      }

      @media screen and (max-width: 768px) {
          .container {
              flex-basis: calc(50% - 20px);
          }
      }

      @media screen and (max-width: 480px) {
          .container {
              flex-basis: calc(100% - 20px);
          }

          .box {
              text-align: left;
              height: 50px;
          }

          .button {
              display: inline-block;
              padding: 5px;
              margin-left: 10px;
              cursor: pointer;
              background-color: #4caf50;
              color: black;
              border: none;
              border-radius: 5px;
          }


          .responsive-button {
              width: 100%; /* Ajustar el ancho del botón al 100% del contenedor */
          }


      }
                                                                                                                                                                                                                                                                                                                                                                                                                                                      .auto-style11 {
                                                                                                                                                                                                                                                                                                                                                                                                                                                          position: relative;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          width: 100%;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          -ms-flex: 0 0 100%;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          flex: 0 0 100%;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          max-width: 100%;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          text-align: center;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          padding-left: 15px;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          padding-right: 15px;
                                                                                                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                                                                                                      .auto-style12 {
                                                                                                                                                                                                                                                                                                                                                                                                                                                          display: flex;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          align-items: center;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          font-family: 'poppins',Sans-serif;
                                                                                                                                                                                                                                                                                                                                                                                                                                                          text-align: center;
                                                                                                                                                                                                                                                                                                                                                                                                                                                      }
  </style></head><body><!-- Tu barra de navegación o cualquier otro contenido --><!-- Tabs de Bootstrap --><!-- Tabs navs --><!-- Tabs content --><!-- Tus scripts de Bootstrap y otros scripts --><form id="form1" runat="server">
        
              <div class="auto-style10">
            
    <!-- Aquí se mostrarán los datos en etiquetas -->
      
                    <div id="perfilLabels"/>
                     
    <dx:ASPxPageControl ID="ASPxPageControl5"  runat="server" ActiveTabIndex="1" CssClass="dxtcAligned horizontal-center-aligned" TabAlign="Justify" Width="100%" Theme="Mulberry" EnableTheming="True">
           <TabPages>
            <dx:TabPage Text="Datos de Envío" Visible="False">
               
                <TabStyle>
                    <BackgroundImage ImageUrl="~/imagenes/carrito.png" Repeat="NoRepeat" VerticalPosition="center" />
                </TabStyle>
               
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                      
                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" AlignItemCaptionsInAllGroups="True" ClientInstanceName="FormLayout" ColCount="2" ColumnCount="2" Height="80%" RequiredMarkDisplayMode="Auto" Theme="Mulberry" UseDefaultPaddings="False" Width="100%">
                            <SettingsAdaptivity>
                                <GridSettings ChangeCaptionLocationAtWidth="400">
                                    <Breakpoints>
                                        <dx:LayoutBreakpoint ColumnCount="1" MaxWidth="790" Name="s" />
                                    </Breakpoints>
                                </GridSettings>
                            </SettingsAdaptivity>
                            <Items>
                                <dx:LayoutGroup Caption="" ColSpan="1" GroupBoxDecoration="Box" Width="100%">
                                    <GridSettings ChangeCaptionLocationAtWidth="400">
                                    </GridSettings>
                                    <Items>
                                        <dx:LayoutItem Caption="" ColSpan="1" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                             <dx:ASPxPageControl ID="ASPxPageControl4" runat="server" ActiveTabIndex="2" CssClass="dxtcFixed dxtcAligned horizontal-center-aligned" TabAlign="Justify" Width="100%" Theme="Default" OnActiveTabChanged="ASPxPageControl4_ActiveTabChanged1">
    
                                                                                                                <TabPages>
                                                            <dx:TabPage Text="Domicilio">
                                                                <ContentCollection>
                                                                    <dx:ContentControl runat="server">
                                                                        <dx:ASPxFormLayout ID="FormLayout0" runat="server" AlignItemCaptionsInAllGroups="True" ClientInstanceName="FormLayout" ColCount="3" ColumnCount="3" Height="568px" RequiredMarkDisplayMode="Auto" UseDefaultPaddings="False" Width="100%">
                                                                            <SettingsAdaptivity>
                                                                                <GridSettings ChangeCaptionLocationAtWidth="400">
                                                                                    <Breakpoints>
                                                                                        <dx:LayoutBreakpoint ColumnCount="1" MaxWidth="790" Name="s" />
                                                                                    </Breakpoints>
                                                                                </GridSettings>
                                                                            </SettingsAdaptivity>
                                                                            <Items>
                                                                                <dx:LayoutItem Caption="" ColSpan="1">
                                                                                    <LayoutItemNestedControlCollection>
                                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                                            <h4><strong style="border: 0px solid rgb(217, 217, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
                                                                                                Detalles de facturación</strong></h4>
                                                                                            &nbsp;&nbsp;&nbsp;&nbsp;<div id="consolidadoDatos">
        <h3>Resumen de Datos</h3>
        <div id="resumen"></div>
    </div>
                                                                                            &nbsp;<br /></dx:LayoutItemNestedControlContainer>
                                                                                    </LayoutItemNestedControlCollection>
                                                                                </dx:LayoutItem>
                                                                                <dx:LayoutItem Caption="" ColSpan="1">
                                                                                    <LayoutItemNestedControlCollection>
                                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                                            <h4>Mis Nits</h4>
                                                                                            <dx:ASPxSplitter ID="ASPxSplitter4" runat="server" Height="100%">
                                                                                                <Panes>
                                                                                                    <dx:SplitterPane AllowResize="True" AutoHeight="True" Size="30%" AutoWidth="True" ScrollBars="Auto">
                                                                                                        <ContentCollection>
                                                                                                            <dx:SplitterContentControl runat="server">
                                                                                                                
                                                                                                                
                                                                                                                <section id="tarjetasContainerNit">
                                                                                                                 
                                                                                                                </section>
                                                                                                               
                                                                                                                
  

                                                                                                            </dx:SplitterContentControl>
                                                                                                        </ContentCollection>
                                                                                                    </dx:SplitterPane>
                                                                                                </Panes>
                                                                                            </dx:ASPxSplitter>
                                                                                        </dx:LayoutItemNestedControlContainer>
                                                                                    </LayoutItemNestedControlCollection>
                                                                                </dx:LayoutItem>
                                                                                <dx:LayoutItem Caption="" ColSpan="1">
                                                                                    <LayoutItemNestedControlCollection>
                                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                                            
                                                                                            <h4>
                                                                                                <asp:Button ID="actualizarBtn" runat="server" Text="Mis Direcciones" OnClientClick="ejecutarDesdeHTML()" Width="100%" />
                                                                                                &nbsp;</h4>

                                                                                            <dx:ASPxSplitter ID="ASPxSplitter5" runat="server" Height="100%" FullscreenMode="True" Width="100%">
                                                                                                <Panes>
                                                                                                    <dx:SplitterPane AllowResize="False" ScrollBars="Vertical" Collapsed="True">
                                                                                                        <ContentCollection>
                                                                                                            <dx:SplitterContentControl runat="server">
                                                                                                                <section id="tarjetasContainer">
                                                                                                                    <!-- Agrega más cards según sea necesario -->
                                                                                                                    <!-- Agrega más cards según sea necesario -->
                                                                                                                </section>
                                                                                                                
                                                                                                            </dx:SplitterContentControl>
                                                                                                        </ContentCollection>
                                                                                                    </dx:SplitterPane>
                                                                                                </Panes>
                                                                                            </dx:ASPxSplitter>
                                                                                        </dx:LayoutItemNestedControlContainer>
                                                                                    </LayoutItemNestedControlCollection>
                                                                                    <BorderLeft BorderWidth="0px" />
                                                                                    <BorderBottom BorderWidth="0px" />
                                                                                    <Border BorderWidth="0px" />
                                                                                </dx:LayoutItem>
                                                                                <dx:LayoutGroup Caption="Enviar a Domicilio" ColSpan="1">
                                                                                </dx:LayoutGroup>
                                                                                <dx:LayoutItem ColSpan="1">
                                                                                    <LayoutItemNestedControlCollection>
                                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                                            <dx:ASPxMemo ID="FormLayout0_E1" runat="server">
                                                                                            </dx:ASPxMemo>
                                                                                        </dx:LayoutItemNestedControlContainer>
                                                                                    </LayoutItemNestedControlCollection>
                                                                                </dx:LayoutItem>
                                                                            </Items>
                                                                            <Paddings PaddingBottom="30px" PaddingTop="10px" />
                                                                            <Styles>
                                                                                <LayoutGroupBox CssClass="fullWidth fullHeight">
                                                                                </LayoutGroupBox>
                                                                                <LayoutGroup>
                                                                                    <Cell CssClass="fullHeight">
                                                                                    </Cell>
                                                                                </LayoutGroup>
                                                                            </Styles>
                                                                        </dx:ASPxFormLayout>
                                                                    </dx:ContentControl>
                                                                </ContentCollection>
                                                            </dx:TabPage>
                                                            <dx:TabPage Text="xxxx">
                                                                <ContentCollection>
                                                                    <dx:ContentControl runat="server">
                                                                        
                                                                       
                                                                        <dx:ASPxFormLayout ID="FormLayout" runat="server" AlignItemCaptionsInAllGroups="True" ClientInstanceName="FormLayout" ColCount="3" ColumnCount="3" Height="292px" RequiredMarkDisplayMode="Auto" UseDefaultPaddings="False" Theme="Default">
                                                                            <SettingsAdaptivity>
                                                                                <GridSettings ChangeCaptionLocationAtWidth="400">
                                                                                    <Breakpoints>
                                                                                        <dx:LayoutBreakpoint ColumnCount="1" MaxWidth="790" Name="s" />
                                                                                    </Breakpoints>
                                                                                </GridSettings>
                                                                            </SettingsAdaptivity>
                                                                            <Items>
                                                                                <dx:LayoutGroup Caption="" ColSpan="1" GroupBoxDecoration="Box" Width="100%">
                                                                                    <GridSettings ChangeCaptionLocationAtWidth="400">
                                                                                    </GridSettings>
                                                                                    <Items>
                                                                                        <dx:LayoutItem Caption="Departamentos" ColSpan="1">
                                                                                            <LayoutItemNestedControlCollection>
                                                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                     
      <dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="False">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
    <Columns>
        <dx:GridViewDataTextColumn FieldName="IDDepartamento" Caption="ID Departamento" />
        <dx:GridViewDataTextColumn FieldName="IDMunicipio" Caption="ID Municipio" />
        <dx:GridViewDataTextColumn FieldName="IDZona" Caption="ID Zona" />
        <dx:GridViewDataTextColumn FieldName="Farmacias" Caption="Farmacias" />
    </Columns>
</dx:ASPxGridView>                                                                                      <h4>Seleccione la farmacia mas cercana</h4>
                                                                                                    <asp:DropDownList ID="ddlDepartamentos_New" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlDepartamentos_SelectedIndexChanged1">
                                                                                                        <asp:ListItem Text="Seleccionar Departamento" Value="0"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </dx:LayoutItemNestedControlContainer>
                                                                                            </LayoutItemNestedControlCollection>
                                                                                        </dx:LayoutItem>
                                                                                        <dx:LayoutItem Caption="" ColSpan="1" Visible="False">
                                                                                            <LayoutItemNestedControlCollection>
                                                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                </dx:LayoutItemNestedControlContainer>
                                                                                            </LayoutItemNestedControlCollection>
                                                                                        </dx:LayoutItem>
                                                                                        <dx:LayoutItem Caption="Municipios" ColSpan="1">
                                                                                            <LayoutItemNestedControlCollection>
                                                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                    <asp:DropDownList ID="ddlMunicipios_New" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlMunicipios_SelectedIndexChanged1">
                                                                                                        <asp:ListItem Text="Seleccionar Municipio" Value="0"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </dx:LayoutItemNestedControlContainer>
                                                                                            </LayoutItemNestedControlCollection>
                                                                                        </dx:LayoutItem>
                                                                                        <dx:LayoutItem Caption=" Zonas" ColSpan="1">
                                                                                            <LayoutItemNestedControlCollection>
                                                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                    <asp:DropDownList ID="ddlDireccionesSitioZona_New" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlDireccionesSitioZona_New_SelectedIndexChanged">
                                                                                                        <asp:ListItem Selected="True" Text="Seleccionar Zona" Value="0"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </dx:LayoutItemNestedControlContainer>
                                                                                            </LayoutItemNestedControlCollection>
                                                                                        </dx:LayoutItem>
                                                                                        <dx:LayoutItem Caption="Farmacias" ColSpan="1">
                                                                                            <LayoutItemNestedControlCollection>
                                                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                    <asp:DropDownList ID="ddlFarmacias" runat="server" AutoPostBack="True" CssClass="form-control">
                                                                                                        <asp:ListItem Selected="True" Text="Seleccionar Farmacia" Value="0"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </dx:LayoutItemNestedControlContainer>
                                                                                            </LayoutItemNestedControlCollection>
                                                                                        </dx:LayoutItem>
                                                                                        <dx:LayoutItem Caption="Direccion" ColSpan="1">
                                                                                            <LayoutItemNestedControlCollection>
                                                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                    <asp:TextBox ID="txtdireccionCliente_New" runat="server" Width="100%"></asp:TextBox>
                                                                                                    &nbsp;</dx:LayoutItemNestedControlContainer>
                                                                                            </LayoutItemNestedControlCollection>
                                                                                        </dx:LayoutItem>
                                                                                    </Items>
                                                                                    <SpanRules>
                                                                                        <dx:SpanRule BreakpointName="s" ColumnSpan="1" RowSpan="1" />
                                                                                    </SpanRules>
                                                                                </dx:LayoutGroup>
                                                                            </Items>
                                                                            <Paddings PaddingBottom="30px" PaddingTop="10px" />
                                                                            <Styles>
                                                                                <LayoutGroupBox CssClass="fullWidth fullHeight">
                                                                                </LayoutGroupBox>
                                                                                <LayoutGroup>
                                                                                    <Cell CssClass="fullHeight">
                                                                                    </Cell>
                                                                                </LayoutGroup>
                                                                            </Styles>
                                                                        </dx:ASPxFormLayout>
                                                                        <br />
                                                                    </dx:ContentControl>
                                                                </ContentCollection>
                                                            </dx:TabPage>
                                                            <dx:TabPage Text="Crear Direccion">
                                                                <ContentCollection>
                                                                    <dx:ContentControl runat="server">
                                                                        <div>
                                                                            <br />
                                                                            <input onclick="enviarDatosAPI_NuevaDireccion()" type="button" value="Grabar"/>
                                                                            &nbsp;<dx:ASPxFormLayout ID="FormLayout1" runat="server" AlignItemCaptionsInAllGroups="True" ClientInstanceName="FormLayout" ColCount="4" ColumnCount="4" Height="268px" RequiredMarkDisplayMode="Auto" UseDefaultPaddings="False" Width="100%" Theme="Default">
                                                                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit">
                                                                                    <GridSettings ChangeCaptionLocationAtWidth="400">
                                                                                        <Breakpoints>
                                                                                            <dx:LayoutBreakpoint ColumnCount="1" MaxWidth="790" Name="s" />
                                                                                        </Breakpoints>
                                                                                    </GridSettings>
                                                                                </SettingsAdaptivity>
                                                                                <Items>
                                                                                    <dx:LayoutGroup Caption="" ColSpan="1" GroupBoxDecoration="Box" Width="100%">
                                                                                        <GridSettings ChangeCaptionLocationAtWidth="400">
                                                                                        </GridSettings>
                                                                                        <Items>
                                                                                            <dx:LayoutItem Caption="Alias" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        &nbsp;<asp:TextBox ID="txtAliasClienteNew" runat="server" Width="100%"></asp:TextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Departamentos" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <asp:DropDownList ID="ddlDepartamentos_Nuevo" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlDepartamentos_Nuevo_SelectedIndexChanged">
                                                                                                            <asp:ListItem Text="Seleccionar Departamento" Value="0"></asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                        &nbsp;</dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Municipios" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <asp:DropDownList ID="ddlMunicipios_Nuevo" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlMunicipios_Nuevo_SelectedIndexChanged">
                                                                                                            <asp:ListItem Text="Seleccionar Municipio" Value="0"></asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption=" Zonas" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <asp:DropDownList ID="ddlDireccionesSitioZona_NuevoCliente" runat="server" AutoPostBack="True" CssClass="form-control">
                                                                                                            <asp:ListItem Selected="True" Text="Seleccionar Zona" Value="0"></asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Colonia" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        &nbsp;
                                                                                                        <asp:TextBox ID="txtColonia_New" runat="server"></asp:TextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Numero de Casa" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <asp:TextBox ID="txtNumeroCasaCliente_New" runat="server" Width="100%"></asp:TextBox>
                                                                                                        &nbsp;</dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Direccion" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <asp:TextBox ID="txtDireccionClienteNew" runat="server" Width="100%"></asp:TextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Indicaciones" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <asp:TextBox ID="txtIndicacionesCliente_New" runat="server" Width="100%"></asp:TextBox>
                                                                                                        &nbsp;</dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                        </Items>
                                                                                        <SpanRules>
                                                                                            <dx:SpanRule BreakpointName="s" ColumnSpan="1" RowSpan="1" />
                                                                                        </SpanRules>
                                                                                    </dx:LayoutGroup>
                                                                                </Items>
                                                                                <Paddings PaddingBottom="30px" PaddingTop="10px" />
                                                                                <Styles>
                                                                                    <LayoutGroupBox CssClass="fullWidth fullHeight">
                                                                                    </LayoutGroupBox>
                                                                                    <LayoutGroup>
                                                                                        <Cell CssClass="fullHeight">
                                                                                        </Cell>
                                                                                    </LayoutGroup>
                                                                                </Styles>
                                                                            </dx:ASPxFormLayout>
                                                                            <br />
                                                                            &nbsp;</div>
                                                                    </dx:ContentControl>
                                                                </ContentCollection>
                                                            </dx:TabPage>
                                                        </TabPages>
                                                        <ContentStyle>
                                                            <Paddings PaddingLeft="40px" />
                                                        </ContentStyle>
                                                    </dx:ASPxPageControl>
                                                                                                             <br />
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                    <SpanRules>
                                        <dx:SpanRule BreakpointName="s" ColumnSpan="1" RowSpan="1" />
                                    </SpanRules>
                                </dx:LayoutGroup>
                            </Items>
                            <Paddings PaddingBottom="30px" PaddingTop="10px" />
                            <Styles>
                                <LayoutGroupBox CssClass="fullWidth fullHeight">
                                </LayoutGroupBox>
                                <LayoutGroup>
                                    <Cell CssClass="fullHeight">
                                    </Cell>
                                </LayoutGroup>
                            </Styles>
                        </dx:ASPxFormLayout>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="">
                <TabStyle Width="100%">
                    <BackgroundImage ImageUrl="~/imagenes/identity.png" Repeat="NoRepeat" VerticalPosition="center" />
                </TabStyle>
                <ContentCollection>
                    <dx:ContentControl runat="server">
   
                        <dx:ASPxSplitter ID="ASPxSplitter6" runat="server" FullscreenMode="True" Height="100%" Width="100%" Theme="Mulberry" BackColor="#FDE9E8" PaneMinSize="">
                            <Panes>
                                <dx:SplitterPane ScrollBars="Auto" Size="35%">
                                    <ContentCollection>
                                        <dx:SplitterContentControl runat="server">
          <h4 class="auto-style13"> 1. Datos de facturación</h4>
       <div class="row">
       <div class="col-sm-2">
           <label>Nit</label>
       </div>
       <div class="col-sm-8">
           <asp:TextBox ID="txtnitpasarela" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
       </div>
           <button type="button" class="btn btn-primary" onclick="abrirPopupNits()" style="width: 30px; height:30px; display: flex; align-items: center; justify-content: center;" onkeydown="handleEnterButton(event)">
    <i class="material-icons">search</i> 
</button>
   </div>
 <div class="row">
    <div class="col-sm-2">
        UUID</div>
    <div class="col-sm-8">
        <asp:TextBox ID="txtuuidpasarela" runat="server" CssClass="form-control" Width="100%" Visible="False"></asp:TextBox>
    </div>
</div>
                                             <div class="row">
    <div class="col-sm-2">
        <label>Nombre Cliente</label>
    </div>
    <div class="col-sm-8">
        <asp:TextBox ID="txtnombrepasarela" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
    </div>
</div>
                                             <div class="row">
    <div class="col-sm-2">
        Razon Social</div>
    <div class="col-sm-8">
        <asp:TextBox ID="txtrazonpasarela" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="col-sm-2">
        <label>Direccion</label>
    </div>
    <div class="col-sm-8">
        <asp:TextBox ID="txtdireccionpasarela" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
    </div>
</div>
 
                                            <div class="column" style="height: 1239px with:100%" >
    <div class="contenedor">

        

    </div>
                                                <div class="contenedor">
                                                 <h4 class="auto-style13">2. Dirección de entrega</h4>
                                                    </div>
                                                <div class="auto-style12">
                                                

                                                <dx:ASPxFormLayout ID="ASPxFormFormaPago0" runat="server" EnableTheming="True" Theme="Office2010Blue" Width="100%" Height="90px" style="margin-bottom: 0px">
                                                                                                    <Items>
                                                        <dx:TabbedLayoutGroup Caption="Tarjeta de credito" ClientInstanceName="myTabbedLayoutGroup" ColSpan="1" Width="100%" TabAlign="Center" ActiveTabIndex="1">
                                                            <Border BorderWidth="0px" />
                                                            
                                                            <BorderLeft BorderWidth="0px" />
                                                            
                                                            <BorderTop BorderWidth="0px" />
                                                            
                                                            <BorderRight BorderWidth="0px" />
                                                            
                                                            <BorderBottom BorderWidth="0px" />
                                                            
                                                            <Styles>
                                                                <ActiveTabStyle BackColor="#B66B78">
                                                                    <BackgroundImage Repeat="NoRepeat" VerticalPosition="center" />
                                                                </ActiveTabStyle>
                                                                <TabStyle>
                                                                    <Border BorderStyle="None" />
                                                                    <BorderLeft BorderWidth="0px" />
                                                                    <BorderTop BorderWidth="0px" />
                                                                    <BorderRight BorderWidth="0px" />
                                                                    <BorderBottom BorderWidth="0px" />
                                                                </TabStyle>
                                                            </Styles>
                                                            <Items>
                                                                <dx:LayoutItem Caption="A Domicilio" ColSpan="1">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
 

<div style="display: grid; grid-template-columns: 1fr auto; align-items: center; gap: 10px;">
    <!-- Contenido izquierdo con texto -->
    <div class="row">
        <div class="auto-style11">
            <asp:TextBox ID="txtDireccionDomicilio" runat="server" CssClass="form-control" panding="5px" TextMode="MultiLine" Rows="3" Visible="True"></asp:TextBox>
        </div>
    </div>

    <!-- Contenedor derecho con el botón a la derecha -->
    <div style="grid-column: 2; display: flex; align-items: center; justify-content: flex-start;">
        <button id="btnbuscardireccionescliente" class="btn btn-primary" type="button" onclick="abrirPopupDirecciones(this)"  style="width: 30px; height:30px; display: flex; align-items: center; justify-content: center;" onkeydown="handleEnterButton(event)">
            <i class="material-icons">search</i>
        </button>
    </div>
</div>
 <div class="col-sm-8">
 </div>





<%--                                                                            <dx:ASPxFormLayout ID="FormularioEfectivo0" runat="server" CssClass="th td" Width="100%" Height="34px" Visible="False">
                                                                                <Items>
                                                                                    <dx:LayoutItem Caption="" ColSpan="1" CssClass="dxgv th td">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                <dx:ASPxTextBox ID="txtDireccionEntregaClienteUUID" runat="server" Caption="UUID:" ClientInstanceName="txtDireccionEntregaClienteUUID" Width="100%">
                                                                                                </dx:ASPxTextBox>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                        <BorderTop BorderWidth="0px" />
                                                                                        <BorderBottom BorderWidth="0px" />
                                                                                        <Border BorderWidth="0px" />
                                                                                        <CaptionStyle>
                                                                                            <Border BorderWidth="0px" />
                                                                                                                                                                                        <BorderBottom BorderWidth="0px" />
                                                                                        </CaptionStyle>
                                                                                    </dx:LayoutItem>
                                                                                </Items>
                                                                                <Styles>
                                                                                    <LayoutGroup>
                                                                                        <Cell>
                                                                                           
                                                                                        </Cell>
                                                                                                                                                                                <BorderTop BorderWidth="0px" />
                                                                                                                                                                                <BorderBottom BorderWidth="0px" />
                                                                                    </LayoutGroup>
                                                                                </Styles>
                                                                            </dx:ASPxFormLayout>--%>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionCellStyle BackColor="#FF66CC">
                                                                    </CaptionCellStyle>
                                                                    <TabImage Width="100%">
                                                                    </TabImage>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="Recoger en Farmacia" ColSpan="1">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">


                                                                            
<div style="display: grid; grid-template-columns: 1fr auto; align-items: center; gap: 10px;">
    <!-- Contenido izquierdo con texto -->
    <div class="row">
        <div class="auto-style11">
            <asp:TextBox ID="txtDireccionFarmacia" runat="server" CssClass="form-control" panding="5px" TextMode="MultiLine" Rows="3" Visible="True"></asp:TextBox>
                
        </div>
    </div>

    <!-- Contenedor derecho con el botón a la derecha -->
    <div style="grid-column: 2; display: flex; align-items: center; justify-content: flex-start;">
<button id="btnbuscardireccionesfarmacia" class="btn btn-primary" type="button" onclick="abrirPopupFarmacias(this)"  style="width: 30px; height:30px; display: flex; align-items: center; justify-content: center;" onkeydown="handleEnterButton(event)">
    <i class="material-icons">search</i> 
</button>
 


    </div>
</div>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <TabImage Width="100%">
                                                                    </TabImage>
                                                                </dx:LayoutItem>
                                                            </Items>
                                                            <ParentContainerStyle>
                                                                <Border BorderStyle="None" BorderWidth="0px" />
                                                            </ParentContainerStyle>
                                                        </dx:TabbedLayoutGroup>
                                                    </Items>
                                                    
                                                                                                    <Styles>
                                                                                                        <LayoutGroupBox>
                                                                                                            <Border BorderWidth="0px" />
                                                                                                            <BorderLeft BorderWidth="0px" />
                                                                                                            <BorderTop BorderWidth="0px" />
                                                                                                            <BorderRight BorderWidth="0px" />
                                                                                                            <BorderBottom BorderWidth="0px" />
                                                                                                        </LayoutGroupBox>
                                                                                                        <LayoutItem>
                                                                                                            <Border BorderWidth="0px" />
                                                                                                            <BorderLeft BorderWidth="0px" />
                                                                                                            <BorderTop BorderWidth="0px" />
                                                                                                            <BorderRight BorderWidth="0px" />
                                                                                                            <BorderBottom BorderWidth="0px" />
                                                                                                        </LayoutItem>
                                                                                                    </Styles>
                                                                                                    <Border BorderWidth="0px" />
                                                    
                                                                                                    <BorderLeft BorderWidth="0px" />
                                                                                                    <BorderTop BorderWidth="0px" />
                                                                                                    <BorderRight BorderWidth="0px" />
                                                                                                    <BorderBottom BorderWidth="0px" />
                                                    
                                                </dx:ASPxFormLayout>
                                             
   </div>
                                                       
                                             
                                                   <div class="contenedor" >
        <h4 class="auto-style13">3. Seleccione la forma de pago</h4>
           </div>
 
<!-- Opciones de Radio -->
 
<div class="contenedor" style="background-color: #fde9e8;">
    <div class="container-wrapper">
        <div class="box">
            <button type="button" onclick="VisibleTJ()" class="btn btn-primary btn-md" style="background-color:  #cdffff; margin-left: 2px; color: #000000;" onsubmit="false">
                <i class="material-icons"></i>Tarjeta
            </button>
            

        </div>

        <div class="box">
            <button type="button" onclick="VisibleSalud()" class="btn btn-primary btn-md" style="background-color: #cdffff; margin-left: 2px; color: #000000;" onsubmit="false">
                <i class="material-icons"></i>Salud Empresa
            </button>
        </div>

        <div class="box">
            <button type="button" onclick="VisibleEFECTIVO()" class="btn btn-primary btn-md" style="background-color: #cdffff; margin-left: 2px; color: #000000;" onsubmit="false">
                <i class="material-icons"></i>Efectivo
            </button>
        </div>
    </div>
</div>

 
      
                                                <dx:ASPxFormLayout runat="server" Theme="Default" Width="100%" Height="471px" CssClass="th td" EnableTheming="True" ID="ASPxFormFormaPago" style="margin-bottom: 0px" ClientInstanceName="ASPxFormFormaPago"><Items>
<dx:TabbedLayoutGroup Caption="Tarjeta de credito" ClientInstanceName="myTabbedLayoutGroup" ColSpan="1" Width="100%">
<Border BorderWidth="0px"></Border>



<BorderTop BorderWidth="0px"></BorderTop>



<BorderBottom BorderWidth="0px"></BorderBottom>
     
<Items>
<dx:LayoutItem Caption="SALUD EMPRESA" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxFormLayout runat="server" UseDefaultPaddings="False" Theme="Default" Width="100%" Height="426px" EnableTheming="True" ID="FormularioSaludEmpresa"><Items>
<dx:LayoutGroup Caption="" ColSpan="1">
<BorderTop BorderWidth="0px"></BorderTop>

<BorderBottom BorderWidth="0px"></BorderBottom>

<Border BorderWidth="0px"></Border>

<GroupBoxStyle>
<Caption>

</Caption>

<Border BorderWidth="0px"></Border>

<BorderTop BorderWidth="0px"></BorderTop>

<BorderBottom BorderWidth="0px"></BorderBottom>
</GroupBoxStyle>

<CellStyle>

<BorderTop BorderWidth="0px"></BorderTop>

<BorderBottom BorderWidth="0px"></BorderBottom>
</CellStyle>
<Items>
<dx:LayoutItem Caption="Ingrese el DPI" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox runat="server" Width="100%" Font-Bold="True" ID="ASPxFormLayout2_E1"></dx:ASPxTextBox>

                                                                                                    </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
<dx:LayoutItem Caption="Ingrese el PIN" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox runat="server" Width="100%" Font-Bold="True" ID="ASPxFormLayout2_E2"></dx:ASPxTextBox>

                                                                                                    </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
<dx:LayoutItem Caption="" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        
<%--<dx:ASPxButton runat="server" AutoPostBack="False" Text="Validar Salud y Empresa" Theme="Office2003Olive" CssClass=" " ID="xbtnvalidarSaludempresa" ClientSideEvents-Click="function(s, e) { btnValidarSaludEmpresaClick(s, e); }">
    <ClientSideEvents Init="function(s, e) {
        s.GetMainElement().addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
            }
        });
    }" />
</dx:ASPxButton>--%>

    <button id="btnvalidarSaludempresa" class="btn btn-primary" type="button" onclick="btnValidarSaludEmpresaClick(this)" onkeydown="handleEnterButton(event)">
    <i class="material-icons">search</i> Validar Saldo
</button>





                                                                                                    </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
</Items>

<ParentContainerStyle>

</ParentContainerStyle>
</dx:LayoutGroup>
<dx:LayoutGroup Caption="Respuesta:" ColSpan="1">
<GroupBoxStyle>
<Caption>


<BackgroundImage VerticalPosition="0"></BackgroundImage>

<Border BorderWidth="0px"></Border>
     

<BorderTop BorderWidth="0px"></BorderTop>

<BorderRight BorderWidth="0px"></BorderRight>

<BorderBottom BorderWidth="0px"></BorderBottom>
</Caption>

<Border BorderWidth="0px"></Border>

 
<BorderTop BorderWidth="0px"></BorderTop>

<BorderRight BorderWidth="0px"></BorderRight>

<BorderBottom BorderWidth="0px"></BorderBottom>
</GroupBoxStyle>

<CellStyle>


<Border BorderWidth="0px"></Border>
     

<BorderTop BorderWidth="0px"></BorderTop>
     

<BorderBottom BorderWidth="0px"></BorderBottom>
</CellStyle>
<Items>
<dx:LayoutItem Caption="Fecha de Nacimiento" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox runat="server" Width="100%" Font-Bold="True" ID="nitSalud" Enabled="False"></dx:ASPxTextBox>

                                                                                                    </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>

<CaptionCellStyle>

</CaptionCellStyle>
</dx:LayoutItem>
<dx:LayoutItem Caption="Nit" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox runat="server" Width="100%" Font-Bold="True" ID="ASPxFormLayout2_E3" Enabled="False"></dx:ASPxTextBox>

                                                                                                    </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>

<CaptionCellStyle>

</CaptionCellStyle>
</dx:LayoutItem>
<dx:LayoutItem Caption="Nombre de Afiliado" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox runat="server" Width="100%" Font-Bold="True" ID="ASPxFormLayout2_E4" Enabled="False"></dx:ASPxTextBox>

                                                                                                    </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>

<CaptionCellStyle>

</CaptionCellStyle>
</dx:LayoutItem>
<dx:LayoutItem Caption="Empresa" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox runat="server" Width="100%" Font-Bold="True" ID="ASPxFormLayout2_E15" Enabled="False"></dx:ASPxTextBox>

                                                                                                    </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>

<CaptionCellStyle>

</CaptionCellStyle>
</dx:LayoutItem>
<dx:LayoutItem Caption="Monto Disponible" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
<dx:ASPxTextBox runat="server" Width="100%" Font-Bold="True" Font-Size="Large" ID="ASPxFormLayout2_E7" ClientInstanceName="ASPxFormLayout2_E7" Enabled="False"></dx:ASPxTextBox>

                                                                                                    </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>

<CaptionCellStyle>

</CaptionCellStyle>
</dx:LayoutItem>
<dx:LayoutItem Caption="Aplica Descuento" ColSpan="1"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">

<dx:ASPxTextBox runat="server" Width="100%" ID="ASPxFormLayout2_E6" Enabled="False"></dx:ASPxTextBox>

</dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>

<CaptionCellStyle>

</CaptionCellStyle>
</dx:LayoutItem>
    <dx:LayoutItem Caption="No Cuotas" ColSpan="1">
        <LayoutItemNestedControlCollection>
            <dx:LayoutItemNestedControlContainer runat="server">
                <dx:ASPxTextBox ID="txtnocuotasSaludEmpresa" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </dx:LayoutItemNestedControlContainer>
        </LayoutItemNestedControlCollection>
    </dx:LayoutItem>
</Items>

<ParentContainerStyle>


<Border BorderWidth="0px"></Border>

<BorderLeft BorderWidth="0px"></BorderLeft>

<BorderTop BorderWidth="0px"></BorderTop>

<BorderRight BorderWidth="0px"></BorderRight>

<BorderBottom BorderWidth="0px"></BorderBottom>
</ParentContainerStyle>
</dx:LayoutGroup>
</Items>


</dx:ASPxFormLayout>

                                                                            <br />
                                                                            <br />
                                                                        </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
</Items>
</dx:TabbedLayoutGroup>
</Items>


</dx:ASPxFormLayout>

                                                <dx:ASPxFormLayout ID="ASPxFormFormaPago_Efectivo" runat="server" ClientInstanceName="ASPxFormFormaPago_Efectivo" CssClass="th td" EnableTheming="True" Height="123px" style="margin-bottom: 0px" Theme="Default" Width="100%">
                                                    <Items>
                                                        <dx:LayoutItem Caption="" ColSpan="1" Width="100%">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Total Efectivo:" ColSpan="1">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="txttotalefectivo" runat="server" ClientInstanceName="txttotalefectivo" Width="100%" ReadOnly="True">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Vuelto Para:" ColSpan="1">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="txtvueltoefectivo" runat="server" ClientInstanceName="txtvueltoefectivo" Width="100%">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                  
                                                </dx:ASPxFormLayout>
                                                <!-- Columna derecha: Formulario de Artículos -->
                                                <dx:ASPxFormLayout ID="ASPxFormFormaPago_TC" runat="server" CssClass="th td" EnableTheming="True" Height="547px" style="margin-bottom: 0px" Theme="Default" Width="100%" ClientInstanceName="ASPxFormFormaPago_TC">
                                                    <Items>
                                                        <dx:TabbedLayoutGroup Caption="Tarjeta de credito" ClientInstanceName="myTabbedLayoutGroup" ColSpan="1" Width="100%">
                                                            <Border BorderWidth="0px" />
                                                           
                                                            <BorderTop BorderWidth="0px" />
                                                            <BorderRight BorderWidth="0px" />
                                                            <BorderBottom BorderWidth="0px" />
                                                            
                                                            <Items>
                                                                <dx:LayoutItem Caption="TARJETA DE CREDITO" ColSpan="1" Width="100%">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxFormLayout ID="FormularioSaludEmpresa4" runat="server" CssClass="th td" EnableTheming="True" Height="483px" Theme="Default" UseDefaultPaddings="False" Width="100%">
                                                                                <Items>
                                                                                    <dx:LayoutGroup Caption="" ColSpan="1">
                                                                                        <GroupBoxStyle>
                                                                                            <Caption>
                                                                                               
                                                                                                <BackgroundImage VerticalPosition="0" />
                                                                                                <Border BorderWidth="0px" />
                                                                                               
                                                                                                <BorderTop BorderWidth="0px" />
                                                                                            
                                                                                                <BorderBottom BorderWidth="0px" />
                                                                                            </Caption>
                                                                                            <Border BorderWidth="0px" />
                                                                                            
                                                                                            <BorderTop BorderWidth="0px" />
                                                                                            <BorderRight BorderWidth="0px" />
                                                                                            <BorderBottom BorderWidth="0px" />
                                                                                        </GroupBoxStyle>
                                                                                        <CellStyle>
                                                                                            
                                                                                            <Border BorderWidth="0px" />
                                                                                            
                                                                                            <BorderTop BorderWidth="0px" />
                                                                                            
                                                                                            <BorderBottom BorderWidth="0px" />
                                                                                        </CellStyle>
                                                                                        <Items>
                                                                                            <dx:LayoutItem Caption="Monto a pagar" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <div class="text-left">
                                                                                                            <dx:ASPxTextBox ID="txtmontotarjeta" runat="server" ClientInstanceName="txtmontotarjeta" Width="100%" OnTextChanged="txtPasarelaCobroTarjetaMontoPago_TextChanged">
                                                                                                            </dx:ASPxTextBox>
                                                                                                        </div>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Nombre" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox ID="txtPasarelaTarjetaNombre" runat="server" ClientInstanceName="txtPasarelaCobroTarjetaNombre" Width="100%"  AutoComplete="off">
                                                                                                        </dx:ASPxTextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Apellido" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox ID="txtPasarelaCobroTarjetaApellido" runat="server" ClientInstanceName="txtPasarelaCobroTarjetaApellido" Width="100%"  AutoComplete="off">
                                                                                                        </dx:ASPxTextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Nombre Tarjeta" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox ID="txtPasarelaNombreTarjeta" runat="server" ClientInstanceName="txtPasarelaNombreTarjeta" Width="100%"  AutoComplete="off">
                                                                                                        </dx:ASPxTextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                                <CaptionCellStyle>
                                                                                                    
                                                                                                </CaptionCellStyle>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Numero Tarjeta" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <asp:TextBox ID="txtTarjetaNvaNumero" runat="server" CssClass="form-control" MaxLength="19" onkeydown="ValidaCopiarPegarNumericos();" onkeypress="return ValidadorTarjeta(event, this);" onkeyup="CasteoTarjeta(this);" OnTextChanged="txtTarjetaNvaNumero_TextChanged"  AutoComplete="off"></asp:TextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                                <CaptionCellStyle>
                                                                                                    
                                                                                                </CaptionCellStyle>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Fecha Vencimiento" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        Mes<asp:DropDownList ID="ddlTarjetaInfoMes" runat="server" CssClass="form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        Año<asp:DropDownList ID="ddlTarjetaInfoAnio" runat="server" CssClass="form-control">
                                                                                                        </asp:DropDownList>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                                <CaptionCellStyle>
                                                                                                    
                                                                                                </CaptionCellStyle>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Codigo CCV" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox ID="txtPedidoCodigoCCV" runat="server" ClientInstanceName="txtPedidoCodigoCCV" Width="100%"  AutoComplete="off">
                                                                                                        </dx:ASPxTextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                                <CaptionCellStyle>
                                                                                                    
                                                                                                </CaptionCellStyle>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="No Cuotas" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox ID="txtNoCuotas" runat="server" ClientInstanceName="txtNoCuotas" Width="100%"  AutoComplete="off">
                                                                                                        </dx:ASPxTextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                                <CaptionCellStyle>
                                                                                                    
                                                                                                </CaptionCellStyle>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Tipo de Tarjeta" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxTextBox ID="txtTarjetaTipo" runat="server" ClientInstanceName="txtTarjetaTipo" Width="100%"  AutoComplete="off">
                                                                                                        </dx:ASPxTextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                                <CaptionCellStyle>
                                                                                                    
                                                                                                </CaptionCellStyle>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="Correo Electronico" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <asp:CheckBox ID="chkTarjetaInfoCorreoNo" runat="server" Text="No Tiene"  AutoComplete="off"/>
                                                                                                        <dx:ASPxTextBox ID="txtTarjetaInfoCorreo" runat="server" Width="100%">
                                                                                                        </dx:ASPxTextBox>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                            <dx:LayoutItem Caption="" ColSpan="1">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                        <dx:ASPxButton ID="ASPxButton3" runat="server" OnClick="ASPxButton3_Click" Text="Probar pago">
                                                                                                        </dx:ASPxButton>
                                                                                                        <img src="imagenes/mastercard.png" />
                                                                                                        <img src="imagenes/visa.png" />
                                                                                                     
                                                                                                      
                                                                                                        <asp:HiddenField ID="hdJWT" runat="server" />
                                                                                                     
                                                                                                      
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                        </Items>
                                                                                        <ParentContainerStyle>
                                                                                            
                                                                                            <Border BorderWidth="0px" />
                                                                                            <BorderLeft BorderWidth="0px" />
                                                                                            <BorderTop BorderWidth="0px" />
                                                                                            <BorderRight BorderWidth="0px" />
                                                                                            <BorderBottom BorderWidth="0px" />
                                                                                        </ParentContainerStyle>
                                                                                    </dx:LayoutGroup>
                                                                                </Items>
                                                                                
                                                                            </dx:ASPxFormLayout>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                            </Items>
                                                        </dx:TabbedLayoutGroup>
                                                    </Items>
                                                    
                                                </dx:ASPxFormLayout>
                                            </div>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane ScrollBars="Auto" Size="65%">
                                    <ContentCollection>
                                   
                                        <dx:SplitterContentControl runat="server">
                                      
                                          
                                           <%--  <dx:ASPxButton ID="btnEnviarSolicitud" runat="server" AutoPostBack="False" ClientInstanceName="btnEnviarSolicitud" Text="Finalizar Compra" Visible="False">
                                                 <ClientSideEvents Click="function(s, e) { grabarpedido(); }" />
                                             </dx:ASPxButton--%>
                                             <%--<input onclick="grabarpedido()" type="button" value="Grabar"/>--%>
                                      
                                          
 <div class="contenedor">
     <h4 class="Titulo"> 4. Carrito de compras</h4>
  </div>
                                            
                                            

                                            &nbsp;
                                            
   
                                            <table class="default">

 

</table>
 <table id="tablaArticulos">
     <thead>
       <tr>
           <th>Artículo</th>
           <th>Nombre</th>
           <th>Cantidad</th>
           <th>Precio</th>
           <th>Subtotal</th>
                        <th>Acciones</th>
           <th>Mensaje</th>
           <th>No</th>
       </tr>
   </thead>
    <tbody>
           
        <!-- Filas se llenarán dinámicamente con JavaScript -->
    </tbody>
</table>


                                            <script>
                                                function handleEnterButton(event) {
                                                    // Si la tecla presionada es "Enter", prevenir el comportamiento predeterminado
                                                    if (event.key === "Enter") {
                                                        event.preventDefault();
                                                    }
                                                }
                                            </script>

<script>
    function desencripta(pass) {
        const clave = "%ü&/@#$A";
        let pass2 = "";
        let j = 1;

        for (let i = 0; i < pass.length; i += 2) {
            const car = pass.substr(i, 2);
            const codigo = clave.charAt(((j - 1) % clave.length));
            pass2 += String.fromCharCode(codigo.charCodeAt(0) ^ parseInt(car, 16));
            j++;
        }

        return pass2;
    }

    // Ejemplo de uso
    ///const cadenaEncriptada = "49e947fa627f95e3a080f2a810a8ef9cfa27a893a8f70d4f8b1092aafe24a1eb3c6a0fefa2";
    //const cadenaDesencriptada = desencripta(cadenaEncriptada);
    // console.log(cadenaDesencriptada);
 
</script>
 <div class="container-wrapper" >
  
 <%--   <div class="box4">
  <span style="font-size: 19px; font-weight: bold;">TOTAL Q</span>
  <span class="box4" id="" style="font-size: 19px; font-weight: bold;">0.00</span>
   
        <span>Saldo Salud y Empresa</span> <span id="saldoSaludEmpresaTotal">
        <strong>0.00</strong></span>
        <label id="saldoSaludEmpresa" style="font-size: 19px; font-weight: bold;">
  <span>Diferencia</span> <span id="Saldo"><strong>0.00</strong></span>
</label>
</div>--%>
      
     
                                            
<table class="default">
     

  <colgroup span="2" style="background: rgba(128, 255, 0, 0.3); border: 1px solid rgba(100, 200, 0, 0.3);">

  <colgroup span="2" style="background: rgba(255, 128, 0, 0.3); border: 1px solid rgba(200, 100, 0, 0.3);">

 
 
        <tr>

    <th>Total Pedido Q</th>
             <td id="totalformateado" style class="auto-style21"></td>

 

   

  </tr>

       <tr>

    <th>Salud y Empresa Q</th>

    <td id="saldoSaludEmpresa" class="auto-style21"></td>
 
 
 

  </tr>
       <tr>

    <th>Diferencia Q</th>
           
  
      <td id="Saldo" class="auto-style21"></td>
 

  </tr>
  
</table>

         <%--<script>
             var saldoElement = document.getElementById("saldo");

             // Obtén el valor actual del saldo
             var saldo = parseFloat(saldoElement.textContent);

             // Aplica el color y estilo según la condición
             if (saldo > 0.00) {
                 saldoElement.style.color = "red"; // Si el saldo es mayor a 0, el texto será rojo
                 saldoElement.style.fontWeight = "bold"; // Si el saldo es mayor a 0, el texto será en negrita
             } else if (saldo == 0.00 || saldo < 0.00) {
                 saldoElement.style.color = "black"; // Si el saldo es 0 o menor, el texto será verde
                 saldoElement.style.fontWeight = "bold"; // Si el saldo es 0 o menor, el texto será en negrita
             } else {
                 // Otro caso, si es necesario

             }

         </script> --%>  
  <script>

      function enviarSolicitudPOST_Preview() {


          // Mostrar un cuadro de diálogo de confirmación
          if (window.confirm('¿Estás seguro de que deseas finalizar la compra?  \u2713')) {
              // Si el usuario confirma, ejecutar la función enviarSolicitudPOST()
              enviarSolicitudPOST();
          } else {
              // Si el usuario cancela, no hacer nada

              alert('¡Compra cancelada! \u274C'); // Icono de Material Design para "X"
          }



      }
  </script>

<%--        <button type="button" onclick="enviarSolicitudPOST()" class="alert-primary">FINALIZAR COMPRA</button>--%>
           
  <button type="button" onclick="enviarSolicitudPOST_Preview()" class="btn btn-primary btn-lg">Finalizar Compra</button>

          
           <table style="width: 100%; border-collapse: collapse; color: black;">
               <tr>
    <th class="auto-style15">&nbsp;</th>
                       <tr>
                           <th class="auto-style15">FORMA DE PAGO </th>
                           <th class="auto-style20">&nbsp;</th>
                           <td id="separador6"></td>
                           <td id="separador2"></td>
                   </tr>
                      <tr>
                          <td colspan="4">
                              <div class="checkbox-group">
                                  <dx:ASPxCheckBox ID="ASPxCheckBox1_Tarjeta" runat="server" CheckState="Unchecked" ClientInstanceName="ASPxCheckBox1_Tarjeta" ReadOnly="True" Text="Tarjeta de Crédito" Theme="Office365">
                                  </dx:ASPxCheckBox>
                              </div>
                              <div class="dx-ac">
                                  <dx:ASPxCheckBox ID="ASPxCheckBox2_SaludEmpresa" runat="server" CheckState="Unchecked" ClientInstanceName="ASPxCheckBox2_SaludEmpresa" ReadOnly="True" Text="Salud y Empresa" Theme="Office365">
                                  </dx:ASPxCheckBox>
                                  <div class="dx-ac">
                                     
                                  </div>
                                  <div class="dx-ac">

       


</div>

                              </div>
                              <div class="dx-al">
                                  <dx:ASPxCheckBox ID="ASPxCheckBox3_Efectivo" runat="server" CheckState="Unchecked" ClientInstanceName="ASPxCheckBox3_Efectivo" ReadOnly="True" Text="Pago con Efectivo" Theme="Office365">
                                  </dx:ASPxCheckBox>
                              </div>
                          </td>
                   </tr>
                   <tr>
                       <th class="auto-style15">TIPO DE ENTREGA </th>
                       <th class="auto-style20">&nbsp;</th>
                       <td id="separador1"></td>
                   </tr>
                   <tr>
                       <th class="auto-style18">
                           <div class="dxeBoxWithBorders">
                               <dx:ASPxCheckBox ID="ASPxCheckBox_recoger_farmacia" runat="server" CheckState="Unchecked" ClientInstanceName="ASPxCheckBox_recoger_farmacia" ReadOnly="True" Text="Recoger en Farmacia" Theme="Office365">
                               </dx:ASPxCheckBox>
                               <div class="dx-al">
                                   <dx:ASPxCheckBox ID="ASPxCheckBox_domicilio" runat="server" CheckState="Unchecked" ClientInstanceName="ASPxCheckBox_domicilio" ReadOnly="True" Text="Entrega a Domicilio " Theme="Office365">
                                   </dx:ASPxCheckBox>
                               </div>
                           </div>
                       </th>
                   </tr>
                   <tr>
                       <th class="auto-style17">RESPUESTA&nbsp;</th>
                       <td id="separador5" class="auto-style21"></td>
                   </tr>
                   <tr>
                       <td class="auto-style17">Resultado</td>
                       <td id="resultadoResultado" class="auto-style21"></td>
                   </tr>
                   <tr>
                       <td class="auto-style17">Mensaje</td>
                       <td id="resultadoMensaje" class="auto-style21"></td>
                   </tr>
                   <tr>
                       <td class="auto-style17">Número de Pedido</td>
                       <td id="resultadoNoPedido" class="auto-style21"></td>
                   </tr>
                   <tr>
                       <td class="auto-style15">Código de Orden</td>
                       <td id="resultadoCodigoOrden" class="auto-style20"></td>
                   </tr>
                   <tr>
                       <td class="auto-style15">Tiempo de Llegada</td>
                       <td id="resultadoTiempoLlegada" class="auto-style20"></td>
                   </tr>
                   <tr>
                       <td class="auto-style22">Status</td>
                       <td id="resultadoStatus" class="auto-style23"></td>
                   </tr>
                   <tr>
                       <td class="auto-style15">Descripción</td>
                       <td id="resultadoDescripcion" class="auto-style20"></td>
                   </tr>
                   <tr>
                       <td class="auto-style15">Resultado Cobro</td>
                       <td id="resultadoResultadoCobro" class="auto-style20"></td>
                   </tr>
                   <tr>
                       <td class="auto-style15">Reference_number</td>
                       <td id="pReference_number" class="auto-style20"></td>
                   </tr>
                   <tr>
                       <td class="auto-style15">Auth banco</td>
                       <td id="pAuth_banco" class="auto-style20"></td>
                   </tr>
                              
                               
                     
                   </tr>
               
       

    </table>
                                            <div class="box3">
                                                <span>TOTAL Q</span> <span id="total" class="box3">0.00</span>
                                            </div>
                                              

                                            <p class="dx-ac"><img alt="Dermacenter Logo" class="auto-style16" src="https://dermacentergt.com/wp-content/uploads/2020/03/logo-dermacenter-1.jpg?w=150&h=36" />
                                                <asp:TextBox ID="txtcodcadenafarmaciaSeleccionada0" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                                                <asp:TextBox ID="txtcodfarmacia" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                                                <asp:TextBox ID="txtDireccionEntregaClienteUUID" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                                                &nbsp;</p>
 <dx:ASPxMemo ID="txtLog" runat="server" ClientInstanceName="txtLog" Font-Size="X-Large" ForeColor="Red" Height="16px" HorizontalAlign="Center" RightToLeft="False" Width="100%" Visible="False">
 </dx:ASPxMemo>
                                        
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                            </Panes>

                        </dx:ASPxSplitter>
                        <br />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
              
</div>
  
     <%--                                                                            <dx:ASPxFormLayout ID="FormularioEfectivo0" runat="server" CssClass="th td" Width="100%" Height="34px" Visible="False">
                                                                                <Items>
                                                                                    <dx:LayoutItem Caption="" ColSpan="1" CssClass="dxgv th td">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                <dx:ASPxTextBox ID="txtDireccionEntregaClienteUUID" runat="server" Caption="UUID:" ClientInstanceName="txtDireccionEntregaClienteUUID" Width="100%">
                                                                                                </dx:ASPxTextBox>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                        <BorderTop BorderWidth="0px" />
                                                                                        <BorderBottom BorderWidth="0px" />
                                                                                        <Border BorderWidth="0px" />
                                                                                        <CaptionStyle>
                                                                                            <Border BorderWidth="0px" />
                                                                                                                                                                                        <BorderBottom BorderWidth="0px" />
                                                                                        </CaptionStyle>
                                                                                    </dx:LayoutItem>
                                                                                </Items>
                                                                                <Styles>
                                                                                    <LayoutGroup>
                                                                                        <Cell>
                                                                                           
                                                                                        </Cell>
                                                                                                                                                                                <BorderTop BorderWidth="0px" />
                                                                                                                                                                                <BorderBottom BorderWidth="0px" />
                                                                                    </LayoutGroup>
                                                                                </Styles>
                                                                            </dx:ASPxFormLayout>--%><%--<dx:ASPxButton runat="server" AutoPostBack="False" Text="Validar Salud y Empresa" Theme="Office2003Olive" CssClass=" " ID="xbtnvalidarSaludempresa" ClientSideEvents-Click="function(s, e) { btnValidarSaludEmpresaClick(s, e); }">
    <ClientSideEvents Init="function(s, e) {
        s.GetMainElement().addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
            }
        });
    }" />
</dx:ASPxButton>--%>
      
       
<script>
    document.addEventListener('DOMContentLoaded', function () {
       // calcularTotal();
    });


</script>
 
                                            <script>
                                                function encripta(pass) {
                                                    const clave = "%ü&/@#$A";
                                                    let pass2 = "";

                                                    for (let i = 0; i < pass.length; i++) {
                                                        const car = pass.charAt(i);
                                                        const codigo = clave.charAt((i % clave.length));
                                                        pass2 += ('00' + (parseInt(codigo.charCodeAt(0), 10) ^ car.charCodeAt(0)).toString(16)).slice(-2);
                                                    }

                                                    return pass2;
                                                }

                                                // console.log(cadenaEncriptada);
                                            </script>

 
<script>
 
    function mostrarOverlay() {
        var overlay = document.createElement('div');
        overlay.setAttribute('id', 'overlay');
        overlay.style.position = 'fixed';
        overlay.style.top = '0';
        overlay.style.left = '0';
        overlay.style.width = '100%';
        overlay.style.height = '100%';
        overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
        overlay.style.zIndex = '9999'; // Asegúrate de que el z-index sea mayor que el de otros elementos

        // Agregar el contenedor del mensaje
        var mensaje = document.createElement('div');
        mensaje.style.color = '#fff';
        mensaje.style.fontSize = '20px';
        mensaje.style.textAlign = 'center';
        mensaje.style.position = 'absolute';
        mensaje.style.top = '50%';
        mensaje.style.left = '50%';
        mensaje.style.transform = 'translate(-50%, -50%)';

        // Agregar el logo centrado
        var logo = document.createElement('img');
        logo.src = 'https://dermacentergt.com/wp-content/uploads/2020/03/logo-dermacenter-1.jpg';
        logo.alt = 'Dermacenter Logo';
        logo.style.width = '200px'; // Ajusta el ancho según sea necesario
        mensaje.appendChild(logo);

        // Agregar el mensaje de procesamiento
        var mensajeTexto = document.createElement('div');
        mensajeTexto.textContent = 'Validando la existencia y el tiempo de entrega de tu pedido. Por favor, espera un momento.';
        mensaje.appendChild(mensajeTexto);

        overlay.appendChild(mensaje);

        document.body.appendChild(overlay);
    }
 

    function ocultarOverlay() {
        var overlay = document.getElementById('overlay');
        if (overlay) {
            overlay.parentNode.removeChild(overlay);
        }
    }

    function obtenerCodigoProducto() {
        const tabla = document.getElementById('tablaArticulos');
        const filas = tabla.getElementsByTagName('tr');

        // Empezamos desde 1 para saltar la fila de encabezado
        for (let i = 1; i < filas.length; i++) {
            const celdas = filas[i].getElementsByTagName('td');
            const codigoProducto = celdas[0].innerText; // Suponiendo que la primera celda contiene el código del producto
            // Puedes realizar cualquier validación adicional aquí
            if (codigoProducto) {
                return codigoProducto; // Retornamos el código del primer producto encontrado
            }
        }

        return null; // Retornamos null si no se encuentra ningún código de producto
    }

    function obtenerCantidadTotal() {
        const tabla = document.getElementById('tablaArticulos');
        const filas = tabla.getElementsByTagName('tr');
        let cantidadTotal = 0;

        // Empezamos desde 1 para saltar la fila de encabezado
        for (let i = 1; i < filas.length; i++) {
            const celdas = filas[i].getElementsByTagName('td');
            const cantidad = parseInt(celdas[2].getElementsByTagName('input')[0].value); // Suponiendo que la tercera celda contiene un input con la cantidad
            // Validamos que la cantidad sea un número válido
            if (!isNaN(cantidad)) {
                cantidadTotal += cantidad;
            }
        }

        return cantidadTotal;
    }

    const incrementarCantidad = (index, valproducto) => {
        const cantidadInput = document.getElementById(`cantidad-${index}`);
        const cantidad = parseInt(cantidadInput.value) + 1;
        cantidadInput.value = cantidad;

        
        actualizarSubtotal(index, 0);
         //validaExistencia(valproducto, cantidadInput.value, index, 'SINCRONA');

        //alert('incrementarCantidad');
    };

    const decrementarCantidad = (index, valproducto) => {
        const cantidadInput = document.getElementById(`cantidad-${index}`);
        const cantidad = parseInt(cantidadInput.value);
        if (cantidad > 1) {
            cantidadInput.value = cantidad - 1;
                        
            actualizarSubtotal(index-1,0);
            //validaExistencia(valproducto, cantidadInput.value, index, 'SINCRONA');
            //alert('decrementarCantidad');
        }
    };

    function actualizarSubtotal(index, _cantidad) {

        
        //const cantidad = parseInt(document.getElementById(`cantidad-${index}`).value);
       // alert('cantidad subtotal actualizar' + _cantidad);
        const cantidad = _cantidad;
        const precio = parseFloat(tablaArticulos.rows[index].cells[3].innerText);
        const subtotal = cantidad * precio;

        //alert(cantidad + '*' + precio );
        tablaArticulos.rows[index].cells[4].innerText = subtotal.toFixed(2);

        actualizarTotal(); // Call actualizarTotal() after updating subtotal
    }

    function actualizarTotal() {
        let totalSubtotal = 0.00;
        const filas = tablaArticulos.rows;

        for (let i = 0; i < filas.length; i++) {
            const subtotal = parseFloat(filas[i].cells[4].innerText);

            if (subtotal > 0) {
                totalSubtotal += subtotal;
            }
        }
        console.log('Total Subtotal:', totalSubtotal);

        // Actualizar los totales
        document.getElementById('total').innerText = totalSubtotal.toFixed(2);
        document.getElementById('ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo_txttotalefectivo_I').value = totalSubtotal.toFixed(2);
        document.getElementById('ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_TC_PC_0_FormularioSaludEmpresa4_txtmontotarjeta_I').value = totalSubtotal.toFixed(2);

        // Formatear el total y mostrarlo
        const cantidadFormateada = totalSubtotal.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        document.getElementById('totalformateado').innerText = cantidadFormateada;

        // Obtener el valor del saldo de manera segura
 
        const saldoSaludEmpresaValue = parseFloat(document.getElementById('saldoSaludEmpresa').innerText);



        console.log('Saldo Salud Empresa:', saldoSaludEmpresaValue.value);

        // Validar si el valor del saldo es un número válido
        if (!isNaN(saldoSaludEmpresaValue)) {
            // Calcular la diferencia y establecer el color
            const diferencia = totalSubtotal - saldoSaludEmpresaValue;

            console.log('Diferencia:', diferencia);

            document.getElementById('Saldo').innerText = diferencia.toFixed(2);
            document.getElementById('Saldo').style.color = (saldoSaludEmpresaValue < totalSubtotal) ? 'red' : 'blue';
        } else {
            // Manejar el caso donde el valor no es un número válido
            document.getElementById('Saldo').innerText = 'Error';
            document.getElementById('Saldo').style.color = 'black'; // o cualquier color por defecto
        }

        // Mostrar o ocultar elementos según la condición del checkbox
        const checkBox1SaludID = '<%= ASPxCheckBox2_SaludEmpresa.ClientInstanceName %>';
        const checkBox1Salud = ASPxClientControl.GetControlCollection().GetByName(checkBox1SaludID);

        if (checkBox1Salud.GetChecked()) {
            document.getElementById('Saldo').style.display = 'block';
            document.getElementById('saldoSaludEmpresa').style.display = 'block';



        } else {
            document.getElementById('Saldo').style.display = 'none';
            document.getElementById('saldoSaludEmpresa').style.display = 'none';
        }
}
   
    // Declarar combinacionesProcesadas en el ámbito global
    //const combinacionesProcesadas = {};

    function validaExistencia(_codigoProducto, _cantidad, _index, _tipo)
    {

        console.log(`Cantidad funcion: ${_cantidad}, Código de Producto: ${_codigoProducto}, Índice: ${_index}`);
        console.log('cantidad solicitadas: ' + _cantidad, +  ' produto' + _codigoProducto)




        const backgroundColorError = '#FF0033 ';
        const defaultBackgroundColor = '#D1F2EB';
        const fontbackgroundColorError = 'white ';
        const fontdefaultBackgroundColor = 'black';

        //alert(_tipo);
        // Crear una clave única para la combinación de parámetros
        const claveCombinacion = `${_codigoProducto}_${_cantidad}_${_index}`;
       // console.log('Inicio de la función con clave:', claveCombinacion);

         
        //if (combinacionesProcesadas[claveCombinacion]) {
        //    // Si ya ha sido procesada, muestra una alerta (o realiza otra acción) y luego sale de la función
        //    console.log("Esta combinación ya ha sido procesada.");
        //    return;
        //}
       
        //alert('actualizarSubtotal' + _index);
        actualizarSubtotal(_index, _cantidad);

        if (_cantidad === null || _cantidad < 0) {
            ///alert('ocultarOverlay');
            ocultarOverlay();
            return;
        }

        if (_tipo === 'SINCRONO') {
           // alert('sinctono');
            mostrarOverlay();
        }
        //console.time('validaExistencia'); // Inicia el temporizador
       //alert(_codigoProducto + '' + _cantidad + '' + _index)
        //alert('xxxx');
        const url = `https://farmappcia.bofasa.com/api/producto/favoritos?listaSku[0].sku=${_codigoProducto}&listaSku[0].cantidad=${_cantidad}&codigoCadena=2&codigoDireccion=24fc2368-f552-400e-a7a8-6ea8303b9e91&FlagInventario=true`;
        console.log(url);
        //alert(url);
        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'accept': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        })
            .then(response => response.json())
            .then(data => {
                //alert('yyyy');
               //alert(JSON.stringify(data, null, 2));
                 console.log(_cantidad +'json ' +  JSON.stringify(data, null, 2));
                data.data.productos.forEach(producto => {


                    
                    const currentRow = tablaArticulos.rows[_index];
                    const cells = currentRow.cells;
                    
                    //cells[5].innerText = producto.cantidadInventario;

                    console.log('cantidad solicitada' +' '+ _cantidad);
                    console.log('existencia' + ' ' + producto.cantidadInventario);
                    console.log(_cantidad - producto.cantidadInventario );

                    // if (producto.tiempoMinutos > 45) {

                    //alert('hay mas de: ' + producto.tiempoMinutos);
                    //console.log('Condición 1 cumplida - TiempoMinutos más de 45 - Fila ' + (_index + 1));
                    const diferenciaCantidad = _cantidad - producto.cantidadInventario;
                    const tiempoMinutos = parseInt(producto.tiempoMinutos);
                    
                    if (diferenciaCantidad > 0 && tiempoMinutos > 45) {
                        //// Ambas condiciones se cumplen
                        //cells[7].innerText = 'El producto no se encuentra en tu área. ' +
                        //    'Se solicitan ' + _cantidad + ' unidades, pero solo hay ' + producto.cantidadInventario + ' unidades disponibles. ' +
                        //    'Si lo incluyes en tu orden, será enviado en aproximadamente ' + tiempoMinutos + ' minutos.';
                        cells[6].innerText = 'Por favor, ajusta la cantidad solicitada, ya que no disponemos de la existencia requerida.';
                        //cells[7].innerText = 'ademas este producto no se encuentra en tu área. Si lo incluyes en tu orden, será enviado en aproximadamente ' + tiempoMinutos + ' minutos';
                        currentRow.style.backgroundColor = backgroundColorError;
                    } else if (diferenciaCantidad > 0) {
                        // Solo la primera condición se cumple
                        //cells[7].innerText = 'No hay suficiente inventario. Se solicitan ' + _cantidad + ' unidades, pero solo hay ' + producto.cantidadInventario + ' unidades disponibles.';
                        cells[6].innerText = 'Por favor, ajusta la cantidad solicitada, ya que no disponemos de la existencia requerida.';
                        currentRow.style.backgroundColor = backgroundColorError;
                    } else if (tiempoMinutos > 45) {
                        // Solo la segunda condición se cumple
                        cells[6].innerText = 'Este producto no se encuentra en tu área. Si lo incluyes en tu orden, será enviado en aproximadamente ' + tiempoMinutos + ' minutos';

                        currentRow.style.backgroundColor = backgroundColorError;
                    } else if (
                        diferenciaCantidad < 0 || diferenciaCantidad === 0) {

                        //alert(tiempoMinutos + ' cantidad ' + diferenciaCantidad);
                        cells[6].innerText = '';
                        currentRow.style.backgroundColor = defaultBackgroundColor;
                         
                    }
                    else {


                        //cells[7].innerText = 'caca2';
                    }
                        // ...
                   
 

                    // alert('Condición 1 cumplida - TiempoMinutos más de 45 - Fila' + ' ' + producto.tiempoMinutos );
                    // } 

                   
                  
                    //else {
                    //    console.log('Ninguna condición cumplida - Fila ' + (_index + 1));
                    //    cells[7].innerText = 'Sin problemas';
                    //    currentRow.style.backgroundColor = 'violet';
                    //}
                    
                    // Marcar la combinación como procesada
                   // combinacionesProcesadas[claveCombinacion] = true;
                     
                    //const finEjecucion = new Date(); // Obtiene la hora actual al finalizar la ejecución
                    //console.timeEnd('validaExistencia'); // Detiene el temporizador y muestra el tiempo en consola
                    //console.log(`Hora de fin: ${finEjecucion.toLocaleTimeString()}`);
                    //console.log(_cantidad + 'json ' + JSON.stringify(data, null, 2));


                   /// cells[7].innerText = 'Error: Nprobando'; // Set the error message to cells[7]
                    //console.log(claveCombinacion);
                });
                //console.log('JSON de respuesta:');
                //console.log('Total de registros:', data.data.totalRegistros);
               // combinacionesProcesadas[claveCombinacion] = true;

                if (_tipo === 'SINCRONO') {
                    ocultarOverlay();
                }

            })
            .catch(error => {
            

               // console.error('Hubo un error al obtener los datos:', error);

                //// Accessing the properties of the error object
                //var mensaje = error.message;
                //var stackTrace = error.stack;

                //// Imprimir los valores
                //console.log("Mensaje de error:", mensaje);
                //console.log("Stack Trace:", stackTrace);
                //const currentRow = tablaArticulos.rows[_index];
                //const cells = currentRow.cells;
                //currentRow.style.backgroundColor = 'red';
 
                //cells[7].innerText = 'Error: No se encontraron los productos solicitados'; // Set the error message to cells[7]
                //cells[5].innerText = 0;
                ocultarOverlay();

            });

        //alert('4');
    }
 
    

    let datosCargados = false;

    function actualizarInformacion() {
        let contador = 0;
        let numeroRegistro = 1;
        ///alert('actualizarInformacion');
        const queryString = window.location.search;
        const cadenaSinDatos = queryString.replace('?datos=', '');
        const cadenaencriptada = encripta(cadenaSinDatos);
        const cadenaDesencriptada = desencripta(cadenaSinDatos);
        const urlParams = new URLSearchParams('?datos=' + cadenaDesencriptada);
        const datosJson = urlParams.get('datos');
        const datos = JSON.parse(decodeURIComponent(datosJson));

        while (tablaArticulos.rows.length > 0) {
            tablaArticulos.deleteRow(0);
        }

         //Agregar encabezado de la tabla
        tablaArticulos.innerHTML = `
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Subtotal</th>
                                <th>Eliminar</th>
                <th>Observaciones</th>
                                <th style="display:none;">No</th>
            </tr>
        `;
        
        datos.productos.forEach((producto, indexProducto) => {

           
         
            const newRow = tablaArticulos.insertRow();
            const cells = [
                newRow.insertCell(0),
                newRow.insertCell(1),
                newRow.insertCell(2),
                newRow.insertCell(3),
                newRow.insertCell(4),
                newRow.insertCell(5),
                newRow.insertCell(6),
                newRow.insertCell(7)
            ];

            cells[7].style.display = 'none'
            //for (let i = index; i < tablaArticulos.rows.length; i++) {
            //    const currentRow = tablaArticulos.rows[i];

            //    currentRow.cells[8].innerText = i;
            //    nuevoValorSeleccionado = currentRow.cells[8].innerText; // Ajusta según tu estructura HTML
            //    // alert(nuevoValorSeleccionado);

            //    cells[8].innerText = i;
            //    // Resto del código...
            //    ///alert('aqui' + `cantidad-${nuevoValorSeleccionado}`);

            //}
            contador++; // Incrementar el contador
             
            const index = tablaArticulos.rows.length - 1;

            cells[0].innerText = producto.codigoProducto;
            cells[1].innerText = producto.nombreProducto;
             
            //cells[2].innerHTML = `<input id="cantidad-${index}" type="number" value="${producto.cantidad}" min="1" onkeydown="handleKey(event, '${producto.codigoProducto}', ${index})">`;
            cells[7].innerText = numeroRegistro++;

            //cells[2].innerHTML = `<input id="cantidad-${contador}" type="number" value="${producto.cantidad}" min="1" onkeydown="handleKey(event,'${producto.codigoProducto}', ${cells[8].innerText},${producto.cantidad})" onwheel="return false;">`;

            cells[2].innerHTML = `<input id="cantidad-${contador}" type="number" value="${producto.cantidad}" min="1" onkeydown="handleKey(event, '${producto.codigoProducto}', ${contador})" onwheel="return false;" onclick="mostrarAlerta('${producto.cantidad}', '${producto.codigoProducto}', ${contador})">`;


            cells[3].innerText = producto.precioVenta.toFixed(2);
            cells[4].innerText = (producto.cantidad * producto.precioVenta).toFixed(2);
            cells[6].innerText = 'No existe el articulo';
            
           //cells[8].innerText = contador; 

            
            //<button type="button" onclick="incrementarCantidad(${index}, '${producto.codigoProducto}')">+</button>
            //<button type="button" onclick="decrementarCantidad(${index}, '${producto.codigoProducto}')">-</button>

            
                // ... (código existente)

                // Agregar el botón "Eliminar Fila" con el índice actual como argumento
            cells[5].innerHTML = `
          <div class="button-container">
  <button type="button" onclick="confirmarEliminarFila(this)">
    <i class="material-icons">delete_forever</i> 
  </button>
</div>
`;
            
             const valorCelda8 = document.getElementById(`cantidad-${contador}`).closest('tr').cells[7].innerText;

                // ... (código existente)
            //alert(producto.codigoProducto + ' cantidad ' + producto.cantidad + ' index ' + indexProducto);
            ///alert('contador' + contador + ' ' + valorCelda8 + ' producto ' + producto.codigoProducto);
             validaExistencia(producto.codigoProducto, producto.cantidad, cells[7].innerText, 'ASINCRONA');

            // actualizarSubtotal(indexProducto);
             //actualizarTotal();
        });
        actualizarTotal();
    }
    function mostrarAlerta(cantidad, codigoProducto, contador) {
        // Agregamos una pequeña demora de 100 milisegundos antes de obtener el valor de la celda 8
        setTimeout(() => {
            const valorCelda8 = document.getElementById(`cantidad-${contador}`).closest('tr').cells[7].innerText;
            //alert(`Cantidad: ${cantidad}, Código de Producto: ${codigoProducto}, Índice: ${valorCelda8}`);
        }, 100);
    }
    function confirmarEliminarFila(button) {
        // Obtener la fila actual a través del botón que desencadenó el evento
        const row = button.closest('tr');

        // Obtener el índice actual de la fila
        const index = row.rowIndex;

        // Mostrar un cuadro de diálogo de confirmación
        if (confirm("¿Estás seguro de que quieres eliminar esta fila?")) {
            // Si el usuario confirma, llamar a la función eliminarFila
            eliminarFila(button);

            // Regenerar los índices en la columna 8 desde el principio
            for (let i = 0; i < tablaArticulos.rows.length; i++) {
                const currentRow = tablaArticulos.rows[i];

                // Actualizar el índice visual en la columna 8
                currentRow.cells[7].innerText = i-1 + 1;
            }

            // Actualizar total después de eliminar la fila
            actualizarTotal();
        }
    }

    function eliminarFila(button) {
        // Obtener la fila actual a través del botón que desencadenó el evento
        const row = button.closest('tr');

        // Obtener el índice actual de la fila
        const index = row.rowIndex;

        // Eliminar la fila correspondiente
        tablaArticulos.deleteRow(index);

        // Actualizar los índices visuales y los IDs de las filas restantes
        for (let i = index; i < tablaArticulos.rows.length; i++) {
            const currentRow = tablaArticulos.rows[i];

            // Actualizar el índice visual en la primera celda (ajústalo según tu estructura HTML)
            //currentRow.cells[7].innerText = i;

            // Actualizar el ID del input de cantidad (ajústalo según tu estructura HTML)
            const inputCantidad = currentRow.querySelector('input[type="text"][id^="cantidad-"]');
            if (inputCantidad) {
                const newId = `cantidad-${i}`;
                inputCantidad.id = newId;
            }
            // También puedes actualizar otros atributos o identificadores si es necesario
        }
        // Actualizar el total después de reiniciar los índices
        actualizarTotal();
    }
    function handleKey(event, codigoProducto, index, cantidadActual) {
        if (event.key === "Enter") {
            // Evitar la acción de envío predeterminada del formulario
            event.preventDefault();
            console.log(`Índice recibido: ${index}`);

            // Obtener el input de cantidad específico para la fila actual
            const inputCantidad = document.getElementById(`cantidad-${index}`);

            setTimeout(() => {
                // Utilizar index en lugar de contador
                const valorCelda8 = document.getElementById(`cantidad-${index}`).closest('tr').cells[7].innerText;
                console.log(`Índice recibido después de la demora: ${valorCelda8}`);

                // Resto del código...
                // Asegúrate de que el valor de nuevaCantidad se define correctamente
                const nuevaCantidad = parseInt(inputCantidad.value);
      
                validaExistencia(codigoProducto, nuevaCantidad, valorCelda8, 'SINCRONO');
                //alert(valorCelda8);
                //actualizarSubtotal(valorCelda8);
            }, 100);
        }
        totalSubtotal();
        actualizarTotal();
    }

       
    // Función para obtener la cantidad específica para la fila actual
    function obtenerCantidad(index) {
        console.log(`Índice recibido: ${index}`);
        const inputCantidad = document.getElementById(`cantidad-${index}`);
        if (inputCantidad) {
            return parseInt(inputCantidad.value);
        } else {
            console.error(`No se encontró el input de cantidad para la fila ${index}`);
            return 0; // Otra acción por defecto según tu lógica de negocio
        }
    }


    let timeoutId;

    document.addEventListener('DOMContentLoaded', function () {
        actualizarInformacion();

        // Agregar event listener para el evento keyup
        const cantidadInput = document.getElementById('cantidad');
        cantidadInput.addEventListener('keyup', function (event) {
            clearTimeout(timeoutId);

            // Establecer un nuevo temporizador para llamar a la función después de un breve retraso
            timeoutId = setTimeout(function () {
                const valorInput = cantidadInput.value;
                // Verificar si el valor ha cambiado antes de llamar a la función
                if (valorInput !== cantidadInput.dataset.lastValue) {
                    cantidadInput.dataset.lastValue = valorInput;
                    // Llamar a la función validaExistencia con los parámetros necesarios
                   // validaExistencia(,valorInput, /*otros parámetros necesarios*/);
                }
            }, 300); // El valor 300 representa el tiempo de espera en milisegundos
        });
    });
   

    //function llamarFuncionEnCodeBehind() {
    //    // alert('caca');
    //    // Realiza una solicitud AJAX al servidor
    //    $.ajax({
    //        type: "POST",
    //        url: "PAYMENT.aspx/FinalizarCompra", // Quita los paréntesis de la función
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (response) {
    //            // Maneja la respuesta del servidor aquí
    //            console.log(response.d);
    //        },
    //        error: function (error) {
    //            // Maneja el error aquí
    //            console.error("Error al llamar a la función en code-behind", error);
    //        }
    //    });
    //}
</script>

<!-- Tabs navs -->
    
<!-- Derecha -->
             
    <script>
        function mostrarFormaPago() {
            const formasPago = document.getElementsByName('formaPago');
            let seleccionado = '';

            for (let i = 0; i < formasPago.length; i++) {
                if (formasPago[i].checked) {
                    seleccionado = formasPago[i].value;
                    break;
                }
            }

            if (seleccionado !== '') {
                alert('Forma de pago seleccionada: ' + seleccionado);
            } else {
                //alert('Por favor, seleccione una forma de pago');
            }
        }
    </script>
                 
                    

                 <script>
                     function ejecutarDespuesDeActualizar(Direcciones) {
                         obtenerDirecciones(); // Llamar a la función obtenerDirecciones() después de hacer clic en el botón del servidor
                         // Puedes agregar más lógica aquí si es necesario después de actualizar
                     }

                     // Otra parte de tu código JavaScript...
                 </script>

<script>

    function ejecutarDesdeHTML() {
        // Realiza una operación en el lado del servidor
        // Aquí puedes hacer una llamada AJAX a tu servidor o realizar cualquier otra acción necesaria

        // Luego, después de que se complete la operación del servidor, llama a la función JavaScript
        ejecutarDespuesDeActualizar();
    }
</script>
                   
<script>

    async function obtenerDirecciones() {
        try {
            const response = await fetch('https://farmappcia.bofasa.com/api/direccion', {
                headers: {
                    'Authorization': `Bearer ${accessToken}`
                }
            });

            const data = await response.json();

            if (data.resultado && data.data) {
                mostrarTarjetas(data.data);
            } else {
                console.error('Error al obtener los datos');
            }
        } catch (error) {
            console.error('Error al realizar la solicitud:', error);
        }
    }

    function mostrarTarjetas(data) {


    }



</script>
  <script>
                           // Función para obtener los datos y llenar las tarjetas
                           async function obtenerNit() {
                               try {
                                   const response_nit = await fetch('https://farmappcia.bofasa.com/api/nit', {
                                       headers: {
                                           'Authorization': `Bearer ${accessToken}` // Utilizando la variable accessToken
                                       }
                                   });

                                   const data = await response_nit.json();

                                   if (data.resultado && data.data) {
                                       mostrarTarjetasNit(data.data);
                                   } else {
                                       console.error('Error al obtener los datos');
                                   }
                               } catch (error) {
                                   console.error('Error al realizar la solicitud:', error);
                               }
                           }

                           // Función para mostrar las tarjetas con los datos de NIT
                           function mostrarTarjetasNit(data) {
                               const tarjetasContainerNit = document.getElementById('tarjetasContainerNit');

                               data.forEach(item => {
                                   const card = document.createElement('div');
                                   card.classList.add('card');

                                   card.innerHTML = '<div class="card-body">' +
                                       '<h5 class="card-title">' + item.nit + '</h5>' +
                                       '<p class="card-text">Nombre: ' + item.nombre + '<br>Razón: ' + item.razon + '<br>Dirección: ' + item.direccion + '</p>' +
                                       '<button onclick="seleccionar(\'' + item.nit + '\')" class="seleccionarBtn2 btn btn-primary">Seleccionar</button>' +
                                       '</div>';


                                   tarjetasContainerNit.appendChild(card);

                                   const seleccionarBtn2 = card.querySelector('.seleccionarBtn2');
                                   seleccionarBtn2.addEventListener('click', function () {

                                       // Resto del código...

                                       const valortarget = `${item.nit}`;
                                       // Resto del código...
                                       // alert(valortarget);


                                       document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout0_FormLayout2_txtnit').value = valortarget;
                                       document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout0_FormLayout2_txtNombreCliente').value = `${item.nombre}`;

                                       document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout0_FormLayout2_txtRazonSocialCliente').value = item.razon;

                                       document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout0_FormLayout2_txtDireccionCliente').value = item.direccion;                           //document.getElementById('txtDireccionEntrega').value = item.direccion;
                                       const pcAlert = window["pcAlert"];

                                       pcAlert.SetHeaderText('Se ha seleccionado el nit de facturación satisfactoriamente.');
                                       //            var valorAEnviar = valortarget;




                                       //                                    // Modificar el texto del Label con JavaScript

                                       ////          //document.getElementBtxtnitte.valuete 'cacacaca' ? `${item.direccion}` : 'N/A';

                                       //            //document.getElementById('txtDireccionClienteNit').textContent = 'caca';
                                       //   pcAlert.Show();

                                       try {
                                           const popupControl = window["pcAlert"];
                                           if (popupControl) {
                                               ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_ModalAlertas_lblModalTestNotificacion.innerHTML = 'La direccion fue registrada con éxito'
                                               //alert('2');
                                               //popupControl.Show();
                                               //{

                                               //    pcAlert.SetHeaderText('Se ha seleccionado el nit de facturación satisfactoriamente.');
                                               //}
                                           }
                                       }
                                       catch (error) {
                                           console.error('Error al intentar mostrar el pcAlert:', error);
                                           alert('Error al intentar mostrar el pcAlert: ' + error.message);
                                       }
                                   });
                               });

                           }

                           // Cargar los datos al cargar la página

                 </script>
        <script>
                                      async function obtenerDatosPerfil() {
                                          try {
                                              const response = await fetch('https://farmappcia.bofasa.com/api/perfil', {
                                                  headers: {
                                                      'Accept': 'application/json',
                                                      'Authorization': `Bearer ${accessToken}`
                                                  }
                                              });

                                              const data = await response.json();

                                              if (data.resultado && data.data) {
                                                  mostrarDatosEnLabels(data.data);
                                              } else {
                                                  console.error('Error al obtener los datos');
                                              }
                                          } catch (error) {
                                              console.error('Error al realizar la solicitud:', error);
                                          }
                                      }

                                      function mostrarDatosEnLabels(datos) {
                                          const perfilLabels = document.getElementById('DatosdelUsuario');

                                          //// Limpiar el contenido actual
                                          //perfilLabels.innerHTML = '';

                                          //const nombreLabel = document.createElement('label');
                                          //nombreLabel.textContent = `${datos.nombreCompleto} ${datos.correo} ${datos.telefono}`;
                                          //perfilLabels.appendChild(nombreLabel);


                                          // Limpiar el contenido actual
                                          perfilLabels.innerHTML = '';


                                          const saludoLabel = document.createElement('label');
                                          saludoLabel.innerHTML = `Hola <span class="negrita">${datos.nombreCompleto}</span>, tu correo registrado es: <span class="negrita">${datos.correo}</span> y el número de teléfono asociado es: <span class="negrita">${datos.telefono}</span>`;
                                          perfilLabels.appendChild(saludoLabel);
                                      }
                          </script>

                  
        <script type="text/javascript">
            function ClosePopup() {
                pcAlert.Hide(); // pcAlert es el ClientInstanceName del ASPxPopupControl

            }
            //function SendpagoVisa() {
            //    // ... tu lógica actual ...

            //    // Llamada al método en el código detrás
            //    PageMethods.FinalizarCompra(onSuccess, onError);

            //}


            function grabarpedido() {






            }
        </script>



        <script>



            function enviarDatosAPI_NuevaDireccion() {

                // Recuperación del token en JavaScript
                var accessToken = '<%= Session["AccessToken"] %>'; // Verifica si esta sintaxis es la correcta para tu contexto en particular



                var data = {
                    direccion: document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout1_txtDireccionClienteNew').value,
                    alias: document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout1_txtAliasClienteNew').value,

                    colonia: document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout1_txtColonia_New').value,
                    numeroCasa: document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout1_txtNumeroCasaCliente_New').value,
                    indicaciones: document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout1_txtIndicacionesCliente_New').value,
                    codigoZona: document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout1_ddlDireccionesSitioZona_NuevoCliente').value,
                    codigoMunicipio: document.getElementById('ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_FormLayout1_ddlMunicipios_Nuevo').value
                    // Actualiza estos valores con los datos correctos del formulario
                };

                var jsonData = JSON.stringify(data);
                // Mostrar el JSON en un alert

                var headersInfo = 'Encabezados enviados:\n';
                headersInfo += 'Content-Type: application/json\n';
                headersInfo += 'Authorization: Bearer ' + accessToken + '\n\n';

                var infoToShow = headersInfo + 'JSON enviado:\n' + jsonData;
                console.log(jsonData);

                // Mostrar la información (encabezados y JSON) en un alert
                // alert(infoToShow);
                var xhr = new XMLHttpRequest();
                var url = 'https://farmappcia.bofasa.com/api/direccion';
                xhr.open('POST', url, true);
                xhr.setRequestHeader('Content-type', 'application/json');
                //xhr.setRequestHeader('Authorization', `Bearer '' + accessToken + ');
                xhr.setRequestHeader('Authorization', `Bearer ${accessToken}`);


                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            // Después, dentro del bloque 'xhr.onreadystat click del botón 'actualizarBtn' 


                            // document.getElementById('txtD
                            // Obtén una referencia al ASPxPopupControl mediante su ClientInstanceName 
                            const popupControl = window["pcAlert"];
                            if (popupControl) {


                                ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_ModalAlertas_lblModalTestNotificacion.innerHTML = 'La direccion fue registrada con éxito'
                                //alert('1');
                                //popupControl.Show();

                                var pageControl4 = ASPxClientControl.GetControlCollection().GetByName("ASPxPageControl4");
                                if (pageControl4) {
                                    pageControl4.SetTab(0);
                                } else {
                                    console.error('No se pudo encontrar el ASPxPageControl4');
                                }
                                // Verificar si el control ASPxPageControl se encuentra en la página
                                if (pageControl) {
                                    // Cambiar al tab con nombre "AT0"
                                    pageControl.SetTabByName("AT0");
                                } else {
                                    console.error('No se pudo encontrar el ASPxPageControl');
                                }


                            } else {
                                console.error('No se pudo encontrar el ASPxPopupControl');
                            }


                            // Aquí puedes realizar acciones adicionales después de enviar la solicitud con éxito
                        } else {
                            alert('Error al enviar la solicitud. Estado: ' + xhr.status);
                            // Aquí puedes manejar el error de la solicitud
                        }


                    }
                };

                xhr.send(jsonData);
            }
             
        </script>
        
            <script>

                function btnValidarSaludEmpresaClick(s, e) {
                    var dpiValue = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E1_I").value;
                    var pinValue = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E2_I").value;
                    console.log('pin' + pinValue.length);
                    if (dpiValue == 0 || pinValue == 0) {
                        alert("Debe ingresar los campos DPI y PIN para poder continuar")
                    }

                    else {
                        document.getElementById('Saldo').style.display = 'block';
                        document.getElementById('saldoSaludEmpresa').style.display = 'block';
                        var url = 'https://farmappcia.bofasa.com/api/salud-empresa?Dpi=' + dpiValue + '&Pin=' + pinValue;
                        // alert(url);
                        var requestHeaders = {
                            'Accept': 'application/json',
                            'Authorization': `Bearer ${accessToken}`
                        };

                        var requestOptions = {
                            method: 'GET',
                            headers: requestHeaders
                        };

                        fetch(url, requestOptions)
                            .then(response => response.json())
                            .then(data => {

                                const fechaNacimiento = new Date(data.data.fecha_nacimiento);

                                // Obtenemos los componentes de la fecha
                                const dia = fechaNacimiento.getDate();
                                const mes = fechaNacimiento.getMonth() + 1; // Meses en JavaScript son de 0 a 11
                                const ano = fechaNacimiento.getFullYear();

                                // Creamos una cadena con el formato deseado "DD/MM/YYYY"
                                const fechaFormateada = `${dia < 10 ? '0' : ''}${dia}/${mes < 10 ? '0' : ''}${mes}/${ano}`;
                                // Asignamos la fecha formateada al control
                                ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_nitSalud_I.value = fechaFormateada;
                                ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E4_I.value = data.data.nombre_afiliado;
                                ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E3_I.value = data.data.nit;
                                ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E15_I.value = data.data.empresa;
                                ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E7_I.value = data.data.monto_disponible;
                                saldoSaludEmpresa.innerText = data.data.monto_disponible;


                                 

                                if (data.resultado) {
                                    // El resultado es true, por lo que establecemos el valor
                                    ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E6_I.value = "SI";
                                } else {
                                    // El resultado es false, puedes realizar otras acciones aquí si es necesario
                                    console.log("El resultado es false");
                                    ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E6_I.value = "NO";
                                }

                                //document.getElementById('total_saludEmpresa').textContent = data.data.monto_disponible
 
                                if (data.data.monto_disponible > 0) {
                                    
                                    document.getElementById('Saldo').innerText = data.data.monto_disponible - document.getElementById('total').innerText;
                                    // Do something else if the condition is not met
                                    // For example:
                                    console.log("Total salud empresa is not zero.");
                                }
                                if (data.data.monto_disponible === 0) {

                                    document.getElementById('Saldo').innerText = 0.00
                                    // Do something else if the condition is not met
                                    // For example:
                                    console.log("Total salud empresa is not zero.");
                                }

                                //SumarDetalles();
                                //document.addEventListener("DOMContentLoaded", SumarDetalles);
                                //window.onload = SumarDetalles;
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                //alert(error);
                            });

                    }
                }
            </script>
        
          <script>
              function SumarDetalles() {

                  
                  //alert('saludEmpresa');

                  var checkBox1SaludID = '<%= ASPxCheckBox2_SaludEmpresa.ClientInstanceName %>';
                  var checkBox1Salud = ASPxClientControl.GetControlCollection().GetByName(checkBox1SaludID);
                  const totalAPagar = parseFloat(document.getElementById('total').innerText) || 0.00;
                  const saludEmpresa = parseFloat(document.getElementById('total_saludEmpresa').innerText) || 0.00;

                  /// document.getElementById('ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo_PC_0_FormularioEfectivo1_ASPxFormLayout2_E23_I').value = totalAPagar.toFixed(2);
                  // Añadir una clase CSS condicionalmente



                  if (checkBox1Salud.GetChecked().toString() === 'true') {
                     // alert('checkBox1Salud');

                      //const saldoElement = document.getElementById('Saldo').value;
                      //const saldo = saludEmpresa - totalAPagar;
                      //saldoElement = saldo.toFixed(2);
                      //console.log('saldo total - salud empresa: ' + saldoElement);
                      //if (saldo > 0.00) {
                      //    // Resto de tu lógica aquí...
                      //}

                  }
                   
              
              }

              document.addEventListener('DOMContentLoaded', function () {
                 // actualizarInformacion();
                  //SumarDetalles();
              });
          </script>
        
        
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script><script>
                                                                                        async function fetchData(url) {
                                                                                            try {
                                                                                                const response = await fetch(url, {
                                                                                                    headers: {
                                                                                                        'accept': 'application/json',
                                                                                                        'Authorization': `Bearer ${accessToken}` // Utilizando la variable accessToken
                                                                                                    }
                                                                                                });
                                                                                                const data = await response.json();
                                                                                                return data.data || [];
                                                                                            } catch (error) {
                                                                                                console.error('caca Error al obtener datos:', error);
                                                                                                return [];
                                                                                            }
                                                                                        }

                                                                                        function cargarDesdeElInicio() {
                                                                                            //obtenerDatosPerfil();

                                                                                            //obtenerDirecciones();
                                                                                            // inicializarActualizacionDireccion();

                                                                                            /// actualizarDireccion();
                                                                                            //obtenerNit();
                                                                                            //showDataInCards();
                                                                                            //cargarDatosCompletos();
                                                                                            // Llamar a la función para mostrar los datos

                                                                                        }

                                                                                        // Ejecutar cuando el DOM esté completamente cargado
                                                                                        document.addEventListener("DOMContentLoaded", cargarDesdeElInicio);

                                                                                        // Opcionalmente, puedes utilizar window.onload para asegurarte de que todo, incluidos los recursos externos, haya cargado completamente
                                                                                        window.onload = cargarDesdeElInicio;
        </script>

                <%--  <dx:ASPxButton ID="btnEnviarSolicitud" runat="server" AutoPostBack="False" ClientInstanceName="btnEnviarSolicitud" Text="Finalizar Compra" Visible="False">
                                                 <ClientSideEvents Click="function(s, e) { grabarpedido(); }" />
                                             </dx:ASPxButton--%><script type="text/javascript" src="js/jquery-3.7.0.min.js"></script><script type="text/javascript" src="js/bootstrap.min.js"></script><script type="text/javascript" src="js/dermacenterCheckout.js"></script><script>


                                                                                                                                                                                                                                                                                   function AbrirListaNITs() {
                                                                                                                                                                                                                                                                                       window.location.href = 'nitList.aspx';

                                                                                                                                                                                                                                                                                   }
                                             </script>
        
        <script>
            var popup = null;

            function abrirPopupNits() {

                var accessToken = '<%= Session["AccessToken"] %>';
                var width = screen.width;
                var height = screen.height;
                var left = 0;
                var top = 0;

                // Abre la ventana emergente en pantalla completa
                var url = 'nitList.aspx?accessToken=' + encodeURIComponent(accessToken);
                popup = window.open(url, 'popupWindow', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left + ', fullscreen=yes');


                // Verifica si la ventana emergente se abrió correctamente
                if (!popup) {
                    alert('El bloqueador de ventanas emergentes puede estar impidiendo abrir la ventana en pantalla completa.');
                }
            }

            function obtenerValorNIT(nit, nombre, razon, direccion, codigoNit) {
                // Verifica si se ha seleccionado un NIT
                if (nit !== undefined && nombre !== undefined && razon !== undefined && direccion !== undefined && codigoNit !== undefined) {
                    // Obtén el elemento por su ID
                   // var txtNombreCliente = document.getElementById('ASPxPageControl5_ASPxSplitter6_FormularioSaludEmpresa2_txtNombreCliente_I');
                    var txtNombreCliente_pasarela = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtnombrepasarela');


                   // var txtnit = document.getElementById('ASPxPageControl5_ASPxSplitter6_FormularioSaludEmpresa2_txtNit_I');
                    var txtnit_pasarela = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtnitpasarela');

                   // var txtrazon = document.getElementById('ASPxPageControl5_ASPxSplitter6_FormularioSaludEmpresa2_txtRazonSocialCliente_I');
                    var txtrazon_pasarela = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtrazonpasarela');

                   // var txtdireccion = document.getElementById('ASPxPageControl5_ASPxSplitter6_FormularioSaludEmpresa2_txtDireccionFacturaCliente_I');
                    var txtdireccion_pasarela = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtdireccionpasarela');

                    //var txtuuidNit = document.getElementById('ASPxPageControl5_ASPxSplitter6_FormularioSaludEmpresa2_txtuuidNit_I');
                    var txtuuidNit_pasarela = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtuuidpasarela');

                    // Asigna los valores a los campos correspondientes
                    //txtNombreCliente.value = nombre;
                    txtNombreCliente_pasarela.value = nombre;

                    //txtnit.value = nit;
                    txtnit_pasarela.value = nit;

                   // txtrazon.value = razon;
                    txtrazon_pasarela.value = razon;

                   // txtdireccion.value = direccion;
                    txtdireccion_pasarela.value = direccion;

                  //  txtuuidNit.value = codigoNit;
                    txtuuidNit_pasarela.value = codigoNit;
                    ///alert(codigoNit);

                    // Cierra la ventana emergente
                    popup.close();
                } else {
                    alert('Por favor, seleccione un NIT antes de cerrar la ventana emergente.');
                }
            }
        </script>



    

        <script>



            function abrirPopupDirecciones(button) {
                //alert(button.id);

                // Verificar si el botón es el correcto
                if (button.id !== 'btnbuscardireccionescliente') {
                    alert('Botón incorrecto');
                    return;
                }



                var popup = null;

                var width = screen.width;
                var height = screen.height;
                var left = 0;
                var top = 0;

                //alert('abrirPopupDirecciones2');

                // ASPxCheckBox_recoger_farmacia.GetChecked();

                var accessToken = '<%= Session["AccessToken"] %>';

                var url = 'DireccionesList.aspx?accessToken=' + encodeURIComponent(accessToken);

                popup = window.open(url, 'popupWindow', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left + ', fullscreen=yes');

                // Verifica si la ventana emergente se abrió correctamente
                if (!popup) {
                    alert('El bloqueador de ventanas emergentes puede estar impidiendo abrir la ventana en pantalla completa.');
                }
            }
            function obtenerDireccion(alias, direccion, uuid) {

                // Verifica si se ha seleccionado un NIT
                 
                var txtDireccionEntregaCliente = document.getElementById('ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago0_PC_0_txtDireccionDomicilio');
                //var txtDireccionEntregaCliente = document.getElementById('ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago0_PC_0_FormularioEfectivo0_txtDireccionEntregaCliente_I');
                var txtDireccionEntregaClienteUUID = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtDireccionEntregaClienteUUID');

                var ASPxCheckBox_domicilio_id = '<%= ASPxCheckBox_domicilio.ClientInstanceName %>';
                var RecogerenaDomicilio = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox_domicilio_id);

                // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                if (RecogerenaDomicilio && RecogerenaDomicilio instanceof ASPxClientCheckBox) {
                    RecogerenaDomicilio.SetChecked(true);

                } else {
                    console.error('No se pudo encontrar o el control no es una casilla de verificación.');
                }


                txtDireccionEntregaCliente.value = alias + ' ' + direccion;//txtDireccionEntregaCliente;
                txtDireccionEntregaClienteUUID.value = uuid;// txtDireccionEntregaClienteUUID;
                txtDireccionEntregaClienteAlias.value = alias;// txtDireccionEntregaClienteUUID;
                // alert(txtDireccionEntregaClienteAlias);
                //  alert(numeroCasa);
                // Cierra la ventana emergente
                popup.close();

                const popupControl = window["pcAlert"];
                if (popupControl) {
                    ///   ASPxPageControl5_ASPxFormLayout1_ASPxPageControl4_ModalAlertas_lblModalTestNotificacion.innerHTML = valortarget2
                    //alert('1');
                    //popupControl.Show();

                } else {
                    console.error('No se pudo encontrar el ASPxPopupControl');
                }


            }
        </script>

        
<script type="text/javascript">
   <%-- document.getElementById("<%= ASPxButton4.ClientID %>").addEventListener("click", function (event) {
        event.preventDefault();
        // Aquí puedes realizar cualquier lógica adicional que necesites antes de procesar el clic del botón.
        // ...
        // Finalmente, puedes llamar a la función de servidor si es necesario.
        <%= Page.ClientScript.GetPostBackEventReference(ASPxButton4, "") %>;
    });--%>
</script>
         <script>


             function abrirPopupFarmacias(button) {
                 if (button.id !== 'btnbuscardireccionesfarmacia') {
                     //alert('Botón incorrecto');
                     return;
                 }

                  
                 //alert('abrirPopupFarmacias');
                 var popup = null;
                 var width = screen.width;
                 var height = screen.height;
                 var left = 0;
                 var top = 0;

                 popup = window.open('FarmaciasList.aspx', 'popupWindow', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left + ', fullscreen=yes');

                 if (!popup) {
                     alert('El bloqueador de ventanas emergentes puede estar impidiendo abrir la ventana en pantalla completa.');
                 }
             }
             function obtenerValorFarmacia(codigoCadena, codigoFarmacia, nombre, direccion) {

                 try {
                 // Mueve estas líneas dentro de la función
                 var txtNomFarmacia = document.getElementById('ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago0_PC_0_txtDireccionFarmacia');
                 var txtCodFarmacia = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtcodfarmacia');
                 var txtCodCadena = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtcodcadenafarmaciaSeleccionada0');
                     

                 var ASPxCheckBox_recoger_farmacia_id = '<%= ASPxCheckBox_recoger_farmacia.ClientInstanceName %>';
                 var RecogerenFarmacia = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox_recoger_farmacia_id);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (RecogerenFarmacia && RecogerenFarmacia instanceof ASPxClientCheckBox) {
                     RecogerenFarmacia.SetChecked(true);
                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación.');
                 }

                 var txtNomFarmacia = document.getElementById('ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago0_PC_0_txtDireccionFarmacia')
                                                               
                 var txtCodFarmacia = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtcodfarmacia')
                 var txtCodCadena = document.getElementById('ASPxPageControl5_ASPxSplitter6_txtcodcadenafarmaciaSeleccionada0')


                 var ASPxCheckBox_recoger_farmacia_id = '<%= ASPxCheckBox_recoger_farmacia.ClientInstanceName %>';
                 var RecogerenFarmacia = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox_recoger_farmacia_id);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (RecogerenFarmacia && RecogerenFarmacia instanceof ASPxClientCheckBox) {
                     RecogerenFarmacia.SetChecked(true);
                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación.');
                 }

                 // valorSeleccionado = nombreDireccionConcatenados;
                 console.log(nombre);
                 //document.getElementById('labelResultado').value = nombre;
                 txtNomFarmacia.value = 'Nombre Farmacia: ' + nombre + ', Direccion: ' + direccion;
                 txtCodFarmacia.value = codigoFarmacia;
                 txtCodCadena.value = codigoCadena;

                  

                 } catch (error) {
                     // Log the error to the console
                     console.error('Error in obtenerValorFarmacia:', error);
                 }
                 // alert(nombreDireccionConcatenados);

                 //ASPxPageControl5_ASPxSplitter6_FormularioSaludEmpresa2_txtDireccionFarmacia_I.value = nombreDireccionConcatenados;
                 //ASPxPageControl5_ASPxSplitter6_FormularioSaludEmpresa2_txtcodigofarmacia_I.value = codigoFarmacia;
                 //txtnombrefarmacia.value = nombre;
                 //txtdireccionfarmacia.value = direccion;

                 // No cierres la ventana emergente aquí
             }
         </script>
                  <%--<input onclick="grabarpedido()" type="button" value="Grabar"/>--%><%--        <button type="button" onclick="enviarSolicitudPOST()" class="alert-primary">FINALIZAR COMPRA</button>--%>
  

        <script>
            function finalizarComprax() {

                //alert('finalizarComprax entrando....');
                var hdJWT = document.getElementById('hdJWT');
                hdJWT.value = generaToken(_Usuario);

                var validaConexionBD = false;
                var validaCorreoFunciona = false;
                var validaCorreoExiste = 0;

                var pNombre = document.getElementById('txtPasarelaTarjetaNombre').value;
                var pApellido = document.getElementById('txtPasarelaCobroTarjetaApellido').value;
                var chkTarjetaInfoCorreoNo = document.getElementById('chkTarjetaInfoCorreoNo');
                var pEmail = (chkTarjetaInfoCorreoNo.checked === false ? document.getElementById('txtTarjetaInfoCorreo').value.toLowerCase() : 'null@cybersource.com');
                var pTarjeta = '';
                var pMesExpira = '12'; // ddlTarjetaInfoMes.value;
                var pAnioExpira = '2024'; // ddlTarjetaInfoAnio.value;
                var pCvv = '';
                var pCodigoCliente = document.getElementById('txtuuidNit').value;
                var pMonto = document.getElementById('txtPasarelaCobroTarjetaMontoPago').value;
                var pIdBanco = '';
                var pCC = '1001'; // _CC;
                var pJwt = hdJWT.value;
                var pDireccionId = document.getElementById('txtDireccionEntregaClienteUUID').value;
                var pTelefonoId = 'C719DA85-2FC4-4645-AF5F-EA689EC4BC02'; // _telefonoId;
                var pDireccionEntrega = '4 AV LOTE 9 1 - 50 LOTIFICACION CAÑADA Z.2 CAÑADA SUCHITEPEQU'; // _direccionEntrega;
                var pTelefonoEntrega = _telefonoEntrega;
                var pTarjetaInicia = '';
                var pValTarjeta = '';
                var pIpEquipo = '';

                pValTarjeta = document.getElementById('txtTarjetaNvaNumero').value;
                pTarjetaInicia = pValTarjeta.substring(0, 1);
                pTarjeta = pValTarjeta.replace(/\s/g, '');

                try {
                    validaConexionBD = validaConexionBaseDatos();
                } catch (ex) {
                    console.error('Error btnTarjetaCobroCobrar ValidaConexionBaseDatos: ' + ex.message);
                }

                try {
                    validaCorreoExiste = perfilCorreoValidaExiste();
                } catch (ex) {
                    console.error('Error btnTarjetaCobroCobrar PerfilCorreoValidaExiste: ' + ex.message);
                }

                try {
                    validaCorreoFunciona = perfilCorreoValidaFuncionamiento();
                } catch (ex) {
                    console.error('Error btnTarjetaCobroCobrar PerfilCorreoValidaFuncionamiento: ' + ex.message);
                }

                if (!validaConexionBD) {
                    alert('Error al comunicarse con el servidor interno');
                    return;
                }
                if (validaCorreoExiste !== 1) {
                    alert('Error al comunicarse con el perfil de notificación');
                    return;
                }
                if (!validaCorreoFunciona) {
                    alert('Error problemas en envío de notificación');
                    return;
                }

                try {
                    recuperaDatosIP();
                    pIpEquipo = sessionStorage.getItem('PC_IP');
                } catch (ex) {
                    recuperaDatosIP();

                    try {
                        pIpEquipo = sessionStorage.getItem('PC_IP');
                    } catch (ex2) {
                        pIpEquipo = '';
                    }
                }

                // Resto del código ...

                // Asegúrate de que las funciones llamadas existan o proporciona implementaciones para ellas
                function generaToken(usuario) {
                    // Implementa la lógica para generar el token
                }

                function validaConexionBaseDatos() {
                    // Implementa la lógica de validación de conexión a la base de datos
                }

                function perfilCorreoValidaExiste() {
                    // Implementa la lógica de validación de existencia de correo en el perfil
                }

                function perfilCorreoValidaFuncionamiento() {
                    // Implementa la lógica de validación de funcionamiento del correo
                }

                function recuperaDatosIP() {
                    // Implementa la lógica para recuperar datos de IP
                }

                // ... Resto de las funciones ...

                function postcredit() {
                    // Implementa la lógica para postcredit
                }
            }
        </script>

<script>



    function enviarSolicitudPOST() {
        ///  
        ///alert('enviarSolicitudPOST');
        var accessToken = '<%= Session["AccessToken"] %>';

 

         var ASPxCheckBox_domicilio_id = '<%= ASPxCheckBox_domicilio.ClientInstanceName %>';
         var RecogerenaDomicilio = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox_domicilio_id);

         var ASPxCheckBox_recoger_farmacia_id2 = '<%= ASPxCheckBox_recoger_farmacia.ClientInstanceName %>';
         var RecogerenFarmacia2 = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox_recoger_farmacia_id2);

        const valorVuelto = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo_txtvueltoefectivo_I");

         const mensajeElement = document.getElementById("resultadoMensaje");

        const resultadoElementval = document.getElementById("resultadoResultado");


        alert('1');
         //alert(resultadoElementval.innerHTML);
         if (resultadoElementval.innerHTML === 'true') {

             mensajeElement.innerText = 'El pedido ya fue enviado';
             mensajeElement.style.backgroundColor = '#fe0419';
             mensajeElement.style.color = 'white';
         } else {

             alert('2');

          
             //llamarPagoDesdeJavaScript();

             const txtnitx = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtnitpasarela").value;
             const val_resultadoResultadoCobro = document.getElementById("resultadoResultadoCobro").value;
             const val_resultadoResultado = document.getElementById("resultadoResultado").value;

             alert('3');
             const txtcodigofarmacia = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtcodfarmacia").value;
                                                                
             var CodDireccionDomicilio = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtDireccionEntregaClienteUUID").value;

             var checkBox1TarjetaID = '<%= ASPxCheckBox1_Tarjeta.ClientInstanceName %>';

             alert('4');
         var checkBox1Tarjeta = ASPxClientControl.GetControlCollection().GetByName(checkBox1TarjetaID);

         var checkBox1SaludID = '<%= ASPxCheckBox2_SaludEmpresa.ClientInstanceName %>';
         var checkBox1Salud = ASPxClientControl.GetControlCollection().GetByName(checkBox1SaludID);
           
         var checkBoxEfectivoID = '<%=  ASPxCheckBox3_Efectivo.ClientInstanceName %>';
         var checkBoxEfectivo = ASPxClientControl.GetControlCollection().GetByName(checkBoxEfectivoID);

         //const valorde = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo_ASPxFormLayout2_E23_I").value;

             alert('5');
         var valor_forma_pago = 0;
         var tipo_forma_pago = 0;

         var saldo = parseFloat(document.getElementById('Saldo').textContent);
             
             if (val_resultadoResultado == true) {
                 alert('val_resultadoResultado == true');
             }
             
             if (checkBoxEfectivo.GetChecked().toString() === 'true') {
                 
             valor_forma_pago = 1;
             // alert('forma de pago seleccionada efectivo ' + valor_forma_pago);
             tipo_forma_pago = 1;
             //const saldoElement = document.getElementById('Saldo').value;
                 //saldoElement = 0.00;
                 alert('checkBoxEfectivo inicia');
         }
            if (checkBox1Tarjeta.GetChecked().toString() === 'true') {
                 alert('checkBox1Tarjeta');
             //alert('forma de pago seleccionada tarjeta ' + valor_forma_pago);
             valor_forma_pago = 1;
             tipo_forma_pago = 2;
             const saldoElement1 = document.getElementById('Saldo').value;
             saldoElement1 = 0.00;

         }
             if (checkBox1Salud.GetChecked().toString() === 'true') {
                 alert('checkBox1Salud');
             // alert('forma de pago seleccionada checkBox1Salud ' + valor_forma_pago);
             valor_forma_pago = 1;
             tipo_forma_pago = 3;
         }

         if (txtnitx === '') {

             //alert('txtnitx');
             const resultadoElement = document.getElementById("resultadoResultado");
             resultadoElement.innerText = 'Seleccione el NIT';
             resultadoElement.style.backgroundColor = '#fe0419';
             resultadoElement.style.color = 'white';

         }
         if (RecogerenFarmacia2.GetChecked().toString() === 'false' && RecogerenaDomicilio.GetChecked().toString() === 'false') {



             const resultadoElement = document.getElementById("resultadoResultado");
             resultadoElement.innerText = 'Elija su método de entrega: a domicilio o recoger en farmacia.';
             resultadoElement.style.backgroundColor = '#fe0419';
             resultadoElement.style.color = 'white';

         }


         else if (valor_forma_pago === 0) {
             //alert('else if  valor_forma_pago' + valor_forma_pago);
             const resultadoElement = document.getElementById("resultadoResultado");
             resultadoElement.innerText = 'Seleccione una forma de pago';
             resultadoElement.style.backgroundColor = '#fe0419';
             resultadoElement.style.color = 'white';

         }

         //else if (checkBox1Tarjeta.GetChecked().toString() === 'true' && (val_resultadoResultadoCobro === null || val_resultadoResultadoCobro === undefined)) {
         else if (checkBox1Tarjeta.GetChecked().toString() === 'true' && (val_resultadoResultadoCobro !== true)) {

             // alert('El cobro no fue realizado, revise los campos e intente de nuevo: ');
             const resultadoElement = document.getElementById("resultadoResultado");
             resultadoElement.innerText = 'El cobro no fue realizado, revise los campos e intente de nuevo: ';
             resultadoElement.style.backgroundColor = '#fe0419';
             resultadoElement.style.color = 'white';

         }
         else if (checkBox1Tarjeta.GetChecked().toString() === 'true' && (val_resultadoResultadoCobro.innerText === 'false')) {

             //alert('El cobro no fue realizado, revise los campos e intente de nuevo: ');

             const resultadoElement = document.getElementById("resultadoResultado");
             resultadoElement.innerText = 'No es posible enviar el pedido debido a que el cobro con tarjeta fue rechazado: ';
             resultadoElement.style.backgroundColor = '#fe0419';
             resultadoElement.style.color = 'white';
             //PAGO CON TARJETA DE CREDITO

             //PAGO CON SALUD Y EMPRESA
             //  } else if (checkBox1Salud.GetChecked().toString() === 'true') {
         } else if (checkBox1Salud.GetChecked().toString() === 'true' && saldo < 1) {
             //alert('checkBox1Salud01');
             //alert('USTED SELECCIONO LA FORMA DE PAGO SALUD Y EMPRESA');
             const resultadoElement = document.getElementById("resultadoResultado");
             resultadoElement.innerText = 'Usted selecciono pagar con Salud y Empresa, sin embargo, El saldo no es suficiente para finalizar la compra, seleccione una forma de pago diferente';
             resultadoElement.style.backgroundColor = '#fe0419';
             resultadoElement.style.color = 'white';



         }
         else {


             const tbody = document.querySelector('#tablaArticulos tbody');
             const extractedData = [];

             //alert('inicia el proceso');
             for (let i = 1; i < tbody.rows.length; i++) {
                 const row = tbody.rows[i];
                 const table_codigoProducto = row.cells[0].innerText;
                 const table_nombreProducto = row.cells[1].innerText;
                ///// alert('inicia el proceso1');
                //  const inputCantidad = document.getElementById(`cantidad-${i}`);
                 // //const inputCantidad = document.getElementById(`cantidad`);
                 let valorindice = i  ;

                
                 const valorcant = 'cantidad-' + i.toString();
                 const cantidadInput = document.getElementById(valorcant);

                      
                 const table_Cantidad1 = cantidadInput.value;;

                 ///alert(valorcant);
                 //const table_Cantidad1 = parseInt(row.cells[2].innerText) ;
                 const table_precioVenta = parseFloat(row.cells[3].innerText);
                 
                 const table_subtotal = parseFloat(row.cells[4].innerText);
                 
                 const rowData = {
                     table_codigoProducto: table_codigoProducto,
                     table_nombreProducto: table_nombreProducto,
                     table_Cantidad1: table_Cantidad1,
                     table_precioVenta: table_precioVenta,
                     table_subtotal: table_subtotal
                                          
                 };

                 alert('inicia el proceso1');
                 //alert(table_codigoProducto);
                 //recorrerTablaYFetchAPI();
                // console.log(table_Cantidad1);
                 //console.log(table_precioVenta);
                 extractedData.push(rowData);
                 //alert('rowData');

                 //alert(table_Cantidad1);

             }

             // Muestra la propiedad table_codigoProducto de cada objeto en extractedData
             if (extractedData.length > 0) {
                 extractedData.forEach(entry => {
                     //alert(entry.table_codigoProducto);
                     //alert(entry.table_precioVenta);
                     //alert(entry.table_cantidad);
                     alert('extractedData.forEach(entry');
                 });
             } else {
                 alert('No hay datos en la URL');
             }

             //alert(item.table_subtotal);
             // 
             alert('aqui ya hace el post')

             var ASPxCheckBox_recoger_farmacia_id = '<%= ASPxCheckBox_recoger_farmacia.ClientInstanceName %>';
             var RecogerenFarmacia = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox_recoger_farmacia_id);

                 var ASPxCheckBox_domicilio_id = '<%= ASPxCheckBox_domicilio.ClientInstanceName %>';
                 var RecogerenaDomicilio = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox_domicilio_id);
                 var dpi_valor_salud_empresa = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E1_I");
                 var cuotas_valor_salud_empresa = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_txtnocuotasSaludEmpresa_I");


                 ////RECOGER EN FARMACIA 
                 if (RecogerenFarmacia.GetChecked().toString() === 'true') {
                     if (txtcodigofarmacia === '') {
                         alert('checkBoxEfectivo01');
                         const resultadoElement = document.getElementById("resultadoResultado");
                         resultadoElement.innerText = 'Debe seleccionar el lugar de entrega, a domicilio o a una farmacia';
                         resultadoElement.style.backgroundColor = '#fe0419';
                         resultadoElement.style.color = 'white';
                     } else {

                         ////RECOGER EN FARMACIA -SALUD Y EMPRESA
                         if (checkBox1Salud.GetChecked().toString() === 'true') {
                             // alert('1 enviando pedido a farmacia y con salud y epresa., ' + valor_forma_pago);
                             valor_forma_pago = 1;
                             tipo_forma_pago = 3;

                             const url = 'https://farmappcia.bofasa.com/api/orden/farmacia';

                             //const url = 'https://farmappcia.bofasa.com/api/orden/farmacia';
                             var codFarmaciaSeleccionada = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtcodfarmacia");
                             var codCadenaFarmaciaSeleccionada = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtcodcadenafarmaciaSeleccionada0");

                             //alert("Forma de pago seleccionada " + tipo_forma_pago);
                             // JSON de ejemplo con los parámetros
                             const parametros = {
                                 "tiempoLlegada": "1",
                                 "vueltoDe": "0",
                                 "monto": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "codigoCadena": codCadenaFarmaciaSeleccionada.value,
                                 "codigoFarmacia": codFarmaciaSeleccionada.value,
                                 "TipoPago": "3",// tipo_forma_pago,
                                 "Comentarios_orden_1": "Pedido enviado a farmacia por Carlos Flores (Cel 5692-7211) de IT para pruebas con DermaCenter. No Facturar",
                                 "Dpi": dpi_valor_salud_empresa.value,
                                 "Cuotas": cuotas_valor_salud_empresa.value,
                                 "Productos": extractedData.map(item => ({
                                     "codigoProducto": item.table_codigoProducto,
                                     "sku": item.table_codigoProducto,
                                     "precioVenta": item.table_precioVenta,
                                     "cantidad": item.table_Cantidad1 ,
                                     "codigoHub": codFarmaciaSeleccionada.value,
                                     "codigoFarmacia": codFarmaciaSeleccionada.value,
                                     "anillo": 0,
                                     "es_recurrente": "1"
                                 }))
                             };

                             console.log(JSON.stringify(parametros, null, 2));

                             // Rest of the code related to farmacia
                             enviarFormData('https://farmappcia.bofasa.com/api/orden/farmacia', parametros, accessToken);
                             //enviarFormData('https://farmappcia.bofasa.com/api/orden/farmacia', parametros, accessToken);




                         }

                         ////RECOGER EN FARMACIA -EFECTIVO

                         if (checkBoxEfectivo.GetChecked().toString() === 'true') {
                             //alert('enviando pedido a farmacia y pago en efectivo., ' + valor_forma_pago);
//alert('checkBoxEfectivo0');
                             
                             var codFarmaciaSeleccionada = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtcodfarmacia");
                             var codCadenaFarmaciaSeleccionada = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtcodcadenafarmaciaSeleccionada0");
                             alert('efectivo1');
                             var dpi_valor_salud_empresa = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E1_I");
                             var cuotas_valor_salud_empresa = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_txtnocuotasSaludEmpresa_I");
                             var vuelto_efectivo = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo_txtvueltoefectivo_I");
                            alert('efectivo2' + vuelto_efectivo );

                             //alert("Forma de pago seleccionada " + tipo_forma_pago);
                             // JSON de ejemplo con los parámetros
                             const parametros = {
                                 "tiempoLlegada": "1",
                                 "vueltoDe": vuelto_efectivo.value ?? 0,
                                 "monto": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "codigoCadena": codCadenaFarmaciaSeleccionada.value,
                                 "codigoFarmacia": codFarmaciaSeleccionada.value,
                                 "tipoPago": tipo_forma_pago,
                                 "cuotas": "1",
                                 "comentarios_orden_1": "Pedido enviado a farmacia por Carlos Flores (Cel 5692-7211) de IT para pruebas con DermaCenter. No Facturar",
                                 "comentarios_orden_2": "Pedido enviado a farmacia por Carlos Flores de IT para pruebas con DermaCenter",
                                 "Productos": extractedData.map(item => ({
                                     "codigoProducto": item.table_codigoProducto,
                                     "sku": item.table_codigoProducto,
                                     "precioVenta": item.table_precioVenta,
                                     "Cantidad": item.table_Cantidad1,
                                     "codigoHub": codFarmaciaSeleccionada.value,
                                     "codFarmacia": codFarmaciaSeleccionada.value,
                                     "anillo": 0,
                                     "es_recurrente": "1"

                                 }))
                             };
                             //alert('efectivo3');
                             console.log(JSON.stringify(parametros, null, 2));

                             //enviarFormData('http://localhost:5000/api/orden/farmacia', parametros, accessToken);
                             enviarFormData('https://farmappcia.bofasa.com/api/orden/farmacia', parametros, accessToken);





                         }

                         ////RECOGER EN FARMACIA -TARJETA

                         if (checkBox1Tarjeta.GetChecked().toString() === 'true') {
                             //alert('forma de pago seleccionada tarjeta ' + valor_forma_pago);
                             valor_forma_pago = 1;
                             tipo_forma_pago = 2;


                             // alert('enviando pedido A farmacia y pago en efectivo., ' + valor_forma_pago);



                             //const url = 'https://farmappcia.bofasa.com/api/orden/farmacia';

                             //const url = 'http://localhost:5000/api/orden/farmacia';
                             var codFarmaciaSeleccionada = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtcodfarmacia");
                             var codCadenaFarmaciaSeleccionada = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtcodcadenafarmaciaSeleccionada0");

                             var dpi_valor_salud_empresa = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_ASPxFormLayout2_E1_I");
                             var cuotas_valor_salud_empresa = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_PC_0_FormularioSaludEmpresa_txtnocuotasSaludEmpresa_I");

                             //var vuelto_efectivo = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo_txtvueltoefectivo_I");

                             // alert("Forma de pago seleccionada " + tipo_forma_pago);
                             // JSON de ejemplo con los parámetros
                             const parametros = {
                                 "tiempoLlegada": "1",
                                 "vueltoDe": "0",
                                 "monto": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "codigoCadena": codCadenaFarmaciaSeleccionada.value,
                                 "codigoFarmacia": codFarmaciaSeleccionada.value,
                                 "tipoPago": "2",
                                 "cuotas": "1",
                                 "comentarios_orden_1": "Pedido enviado a farmacia por Carlos Flores (Cel 5692-7211) de IT para pruebas con DermaCenter. No Facturar",
                                 "comentarios_orden_2": "Pedido enviado a farmacia por Carlos Flores de IT para pruebas con DermaCenter",
                                 "Productos": extractedData.map(item => ({
                                     "codigoProducto": item.table_codigoProducto,
                                     "sku": item.table_codigoProducto,
                                     "precioVenta": item.table_precioVenta,
                                     "cantidad": item.table_Cantidad1,
                                     "codigoHub": codFarmaciaSeleccionada.value,
                                     "codFarmacia": codFarmaciaSeleccionada.value,
                                     "anillo": 0,
                                     "es_recurrente": "1"

                                 }))
                             };

                             console.log(JSON.stringify(parametros, null, 2));

                             //enviarFormData('http://localhost:5000/api/orden/farmacia', parametros, accessToken);
                             enviarFormData('https://farmappcia.bofasa.com/api/orden/farmacia', parametros, accessToken);




                         }

                     }

                 }



                 /////ENVIAR A DOMICILIO 
                 if (RecogerenaDomicilio.GetChecked().toString() === 'true') {
                     // alert('Consumiendo api entrega a Domicilio ....');

                     var CodDireccionDomicilio = document.getElementById("ASPxPageControl5_ASPxSplitter6_txtDireccionEntregaClienteUUID");
                     if (CodDireccionDomicilio === '') {

                         const resultadoElement = document.getElementById("resultadoResultado");
                         resultadoElement.innerText = 'Elija su método de entrega: a domicilio o recoger en farmacia.';
                         resultadoElement.style.backgroundColor = '#fe0419';
                         resultadoElement.style.color = 'white';
                     } else {

                         //var vuelto_efectivo_Domicilio = document.getElementById("txtvueltoefectivo");



                         /////ENVIAR A DOMICILIO - SALUD Y EMPRESA
                         if (checkBox1Salud.GetChecked().toString() === 'true') {
                             //  alert("Forma de pago " + tipo_forma_pago);

                             // Actualiza el nodo Productos con todos los registros encontrados
                             const url = 'https://farmappcia.bofasa.com/api/orden/domicilio';

                             const parametros = {
                                 "tiempoLlegada": "1",
                                 "vueltoDe": "0",
                                 "monto": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "cuotas": "1",
                                 "montoPedido1": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "codigoCadena": "1",
                                 "programacionEnvio": "1",
                                 "CodigoDireccion": CodDireccionDomicilio.value,
                                 "tipoPago": tipo_forma_pago,
                                 "comentarios_orden_1": "Pedido enviado a domicilio por Carlos Flores (Cel 5692-7211) de IT para pruebas con DermaCenter. No Facturar",
                                 "comentarios_orden_2": "Pedido enviado a domicilio por Carlos Flores de IT para pruebas con DermaCenter",
                                 "Dpi": dpi_valor_salud_empresa.value,
                                 "Cuotas": cuotas_valor_salud_empresa.value,
                                 "Productos": extractedData.map(item => ({
                                     "codigoProducto": item.table_codigoProducto,
                                     "sku": item.table_codigoProducto,
                                     "precioVenta": item.table_precioVenta,
                                     "cantidad": item.table_Cantidad1,
                                     "codigoHub": "string",
                                     "CodigoDireccion": CodDireccionDomicilio.value,
                                     "anillo": 0,
                                     "es_recurrente": 1

                                 }))
                             };

                             // Muestra el JSON en la consola
                             console.log(JSON.stringify(parametros, null, 2));


                             //alert(JSON.stringify(parametros, null, 2));


                             enviarFormData('https://farmappcia.bofasa.com/api/orden/domicilio', parametros, accessToken);


                         }

                         /////ENVIAR A DOMICILIO - EFECTIVO
                         if (checkBoxEfectivo.GetChecked().toString() === 'true') {
                             alert("Forma de pago " + tipo_forma_pago);
                             var vuelto_efectivo = document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo_txtvueltoefectivo_I");
                             // Actualiza el nodo Productos con todos los registros encontrados
                             // alert('valorvuelto' + valorVuelto.value);
                             const parametros = {
                                 "tiempoLlegada": "1",
                                 "vueltoDe": vuelto_efectivo.value ?? 0,
                                 "monto": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "cuotas": "1",
                                 "montoPedido1": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "codigoCadena": "1",
                                 "programacionEnvio": "1",
                                 "CodigoDireccion": CodDireccionDomicilio.value,
                                 "tipoPago": tipo_forma_pago,
                                 "comentarios_orden_1": "Pedido enviado a domicilio por Carlos Flores (Cel 5692-7211) de IT para pruebas con DermaCenter. No Facturar",
                                 "comentarios_orden_2": "Pedido enviado a domicilio por Carlos Flores de IT para pruebas con DermaCenter",
                                 "Productos": extractedData.map(item => ({
                                     "codigoProducto": item.table_codigoProducto,
                                     "sku": item.table_codigoProducto,
                                     "precioVenta": item.table_precioVenta,
                                     "cantidad": item.table_Cantidad1,
                                     "codigoHub": "string",
                                     "CodigoDireccion": CodDireccionDomicilio.value,
                                     "anillo": 0,
                                     "es_recurrente": 1
                                 }))
                             };

                             // Muestra el JSON en la consola
                             console.log(JSON.stringify(parametros, null, 2));

                             // Muestra el JSON en una alerta
                             //alert(JSON.stringify(parametros, null, 2));


                             enviarFormData('https://farmappcia.bofasa.com/api/orden/domicilio', parametros, accessToken);
                             // alert('Rest of the code related to domicilio');

                         }

                         /////ENVIAR A DOMICILIO - TARJETA
                         if (checkBox1Tarjeta.GetChecked().toString() === 'true') {
                             // alert("Forma de pago " + tipo_forma_pago + 'PAGANDO CON TARJETA A DOMICLIO xxxxxx');

                             // Actualiza el nodo Productos con todos los registros encontrados
                             // const url = 'https://farmappcia.bofasa.com/api/orden/domicilio';

                             const parametros = {
                                 "tiempoLlegada": "1",
                                 "vueltoDe": "0",
                                 "monto": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "cuotas": "1",
                                 "montoPedido1": extractedData.reduce((total, item) => total + item.table_subtotal, 0).toFixed(2),
                                 "codigoCadena": "1",
                                 "programacionEnvio": "1",
                                 "CodigoDireccion": CodDireccionDomicilio.value,
                                 "tipoPago": "2",
                                 "comentarios_orden_1": "Pedido enviado a domicilio por Carlos Flores (Cel 5692-7211) de IT para pruebas con DermaCenter. No Facturar",
                                 "comentarios_orden_2": "Pedido enviado a domicilio por Carlos Flores de IT para pruebas con DermaCenter",
                                 "Productos": extractedData.map(item => ({
                                     "codigoProducto": item.table_codigoProducto,
                                     "sku": item.table_codigoProducto,
                                     "precioVenta": item.table_precioVenta,
                                     "cantidad": item.table_Cantidad1,
                                     "codigoHub": "string",
                                     "CodigoDireccion": CodDireccionDomicilio.value,
                                     "anillo": 0,
                                     "es_recurrente": 1
                                 }))
                             };

                             // Muestra el JSON en la consola
                             console.log(JSON.stringify(parametros, null, 2));



                             enviarFormData('https://farmappcia.bofasa.com/api/orden/domicilio', parametros, accessToken);
                             // alert('Rest of the code related to domicilio');

                         }

                     }
                 }
                  
                 function extractTableData() {
                     // Get the reference to the tbody element
                     const tbody = document.querySelector('#tablaArticulos tbody');

                     // Initialize an array to store the extracted data
                     const extractedData = [];

                     // Loop through each row in the tbody
                     for (let i = 0; i < tbody.rows.length; i++) {
                         const row = tbody.rows[i];

                         // Create an object to store the data for each row
                         const rowData = {
                             codigoProducto: row.cells[0].innerText,
                             nombreProducto: row.cells[1].innerText,
                             cantidad: parseFloat(row.cells[2].innerText),
                             precioVenta: parseFloat(row.cells[3].innerText),
                             subtotal: parseFloat(row.cells[4].innerText)

                         };


                         // Push the rowData object into the extractedData array
                         extractedData.push(rowData);
                     }

                     return extractedData;
                 }

                 // Function to update information based on extracted table data
                 function actualizarInformacion() {
                     alert('cargarpagina');
                     const tableData = extractTableData();
                    
                     console.log(tableData);


                 }


                 document.addEventListener('DOMContentLoaded', function () {

                     actualizarInformacion();
                 });



                 function mostrarError(data) {
                     const mensajeError = data.resultado ? data.mensaje : data.data.join(', ');

                     // Mostrar el mensaje de error en la consola y alerta
                     console.error('Error:', mensajeError);
                     //alert('Error: ' + mensajeError);
                     const resultadoElement = document.getElementById("resultadoResultado");
                     const mensajeElement = document.getElementById("resultadoMensaje");
                     document.getElementById("resultadoResultado").innerText = false;
                     document.getElementById("resultadoStatus").innerText = data.data.status === 1 ? "Enviado" : "No Enviado";
                     // Mostrar el mensaje de error en algún lugar de tu aplicación
                     document.getElementById("resultadoMensaje").innerText = mensajeError;

                     resultadoElement.style.backgroundColor = '#fe0419';
                     resultadoElement.style.color = 'white';
                     mensajeElement.style.backgroundColor = '#fe0419';
                     mensajeElement.style.color = 'white';



                 }

                 function mostrarErroresEnAlgunLugar(errores) {

                     const erroresContainer = document.getElementById('erroresContainer');


                     erroresContainer.innerHTML = '';

                     const listaErrores = document.createElement('ul');
                     errores.forEach(error => {
                         const itemError = document.createElement('li');
                         itemError.textContent = error;
                         listaErrores.appendChild(itemError);
                     });

                     // Agregar la lista de errores al contenedor
                     erroresContainer.appendChild(listaErrores);
                 }

                 function mostrarResultadoEnCampos(data) {
                     // Colocar los resultados en los campos específicos

                     const resultadoElement = document.getElementById("resultadoResultado");
                     const mensajeElement = document.getElementById("resultadoMensaje");
                     const codigoOrdenElement = document.getElementById("resultadoCodigoOrden");
                     const tiempoLlegadaElement = document.getElementById("resultadoTiempoLlegada");
                     const statusElement = document.getElementById("resultadoStatus");
                     const descripcionElement = document.getElementById("resultadoDescripcion");
                     const noPedidoElement = document.getElementById("resultadoNoPedido");




                     resultadoElement.innerText = "";
                     mensajeElement.innerText = "";
                     codigoOrdenElement.innerText = "";
                     tiempoLlegadaElement.innerText = "";
                     statusElement.innerText = "";
                     descripcionElement.innerText = "";
                     noPedidoElement.innerText = "";



                     resultadoElement.innerText = data.resultado;
                     mensajeElement.innerText = data.mensaje;
                     codigoOrdenElement.innerText = data.data.codigoOrden;
                     tiempoLlegadaElement.innerText = data.data.tiempoLlegada;
                     statusElement.innerText = data.data.status === 1 ? "Activo" : "Inactivo";
                     descripcionElement.innerText = "Tiempo de entrega de la Orden: " + data.data.descripcion;
                     noPedidoElement.innerText = data.data.no_pedido;


                     // Restablecer estilos predeterminados si el resultado es true
                     resultadoElement.style.backgroundColor = '#5dd55d';
                     resultadoElement.style.color = 'black';
                     mensajeElement.style.backgroundColor = '#5dd55d';
                     mensajeElement.style.color = 'black';
                     // Restablece estilos adicionales según sea necesario

                 }
             //function mostrarOverlay() {
             //    var fragmento = document.createDocumentFragment();

             //    var overlay = document.createElement('div');
             //    overlay.setAttribute('id', 'overlay');
             //    overlay.style.position = 'fixed';
             //    overlay.style.top = '0';
             //    overlay.style.left = '0';
             //    overlay.style.width = '100%';
             //    overlay.style.height = '100%';
             //    overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
             //    overlay.style.zIndex = '9999';

             //    var mensaje = document.createElement('div');
             //    mensaje.textContent = 'Procesando...';
             //    mensaje.style.color = '#fff';
             //    mensaje.style.fontSize = '26px'; // Tamaño de letra reducido para mejorar el rendimiento
             //    mensaje.style.position = 'absolute';
             //    mensaje.style.top = '50%';
             //    mensaje.style.left = '50%';
             //    mensaje.style.transform = 'translate(-50%, -50%)';

             //    overlay.appendChild(mensaje);
             //    fragmento.appendChild(overlay);

             //    document.body.appendChild(fragmento);
             //}

             function ocultarOverlay() {
                 var overlay = document.getElementById('overlay');
                 if (overlay) {
                     overlay.parentNode.removeChild(overlay);
                 }
             }


                 function enviarFormData(url, parametros, accessToken) {
                     mostrarOverlay();

                     //alert('enviarFormData');
                     const formData = new FormData();

                     // Agregar cada parámetro al FormData
                     for (const key in parametros) {
                         if (key === "Productos") {
                             const productos = parametros[key];
                             productos.forEach((producto, index) => {
                                 for (const prop in producto) {
                                     formData.append(`Productos[${index}].${prop}`, producto[prop]);
                                 }
                             });
                         } else {
                             formData.append(key, parametros[key]);
                         }
                     }

                     const requestOptions = {
                         method: 'POST',
                         headers: {
                             'Authorization': `Bearer ${accessToken}`
                         },
                         body: formData
                     };

                     // Mostrar el JSON del request antes de enviar la solicitud
                     // alert('JSON del request:\n' + JSON.stringify(parametros, null, 2));

                     fetch(url, requestOptions)
                         .then(response => response.json())
                         .then(data => {
                             console.log('JSON de la respuesta:\n' + JSON.stringify(data, null, 2));
                             //alert('JSON de la respuesta:\n' + JSON.stringify(data, null, 2));

                             const resultadoElement = document.getElementById("resultadoResultado");
                             const mensajeElement = document.getElementById("resultadoMensaje");
                             const codigoOrdenElement = document.getElementById("resultadoCodigoOrden");
                             const tiempoLlegadaElement = document.getElementById("resultadoTiempoLlegada");
                             const statusElement = document.getElementById("resultadoStatus");
                             const descripcionElement = document.getElementById("resultadoDescripcion");
                             const noPedidoElement = document.getElementById("resultadoNoPedido");

                             resultadoElement.innerText = "";
                             mensajeElement.innerText = "";
                             codigoOrdenElement.innerText = "";
                             tiempoLlegadaElement.innerText = "";
                             statusElement.innerText = "";
                             descripcionElement.innerText = "";
                             noPedidoElement.innerText = "";

                             // Si el resultado es verdadero, es una respuesta exitosa
                             if (data.resultado) {
                                 mostrarResultadoEnCampos(data);
                             } else {
                                 // Si el resultado es falso, es una respuesta de error
                                 mostrarError(data);
                             }

                             ocultarOverlay();
                         })
                         .catch(error => {
                             console.error('Error:', error);
                             //alert(error.toString());
                             ocultarOverlay();
                         });
                 }


             }




         }

     }

    //alert('Finalizar consumir api farmacia');
</script>
 

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    function llamarPagoDesdeJavaScript() {
        alert('llamarPagoDesdeJavaScript');
        // Utiliza jQuery para realizar una llamada AJAX al servicio web en el lado del servidor
        $.ajax({
            type: "POST",
            url: "PAYMENT.aspx/RealizarAccionDelBoton",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                // Maneja la respuesta si es necesario
            },
            error: function (error) {
                // Maneja los errores si es necesario
            }
        });
    }
</script>
        

 
         <script>
             window.onload = function () {
                 VisibleAll();
             };

             function VisibleAll() {
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago").style.display = "none";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo").style.display = "none";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_TC").style.display = "none";
             }
         </script>

                
         <script>
             function VisibleSalud() {
                 //alert('VisibleSalud');
                  //document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_TC").style.display = "none";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago").style.display = "block";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo").style.display = "none";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_TC").style.display = "none";


                 var ASPxFormFormaPago_ID = '<%= ASPxCheckBox2_SaludEmpresa.ClientInstanceName %>';
                 var ASPxFormFormaPago = ASPxClientControl.GetControlCollection().GetByName(ASPxFormFormaPago_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxFormFormaPago && ASPxFormFormaPago instanceof ASPxClientCheckBox) {
                     ASPxFormFormaPago.SetChecked(true);

                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación.');
                 }


                 var ASPxFormFormaPago_Efectivo_ID = '<%= ASPxCheckBox3_Efectivo.ClientInstanceName %>';
                 var ASPxFormFormaPago_Efectivo = ASPxClientControl.GetControlCollection().GetByName(ASPxFormFormaPago_Efectivo_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxFormFormaPago_Efectivo && ASPxFormFormaPago_Efectivo instanceof ASPxClientCheckBox) {
                     ASPxFormFormaPago_Efectivo.SetChecked(false);

                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación ASPxFormFormaPago_Efectivo.');
                 }
                 //
                 var ASPxCheckBox1_Tarjeta_ID = '<%= ASPxCheckBox1_Tarjeta.ClientInstanceName %>';
                 var ASPxCheckBox1_Tarjeta = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox1_Tarjeta_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxCheckBox1_Tarjeta && ASPxCheckBox1_Tarjeta instanceof ASPxClientCheckBox) {
                     ASPxCheckBox1_Tarjeta.SetChecked(false);

                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación ASPxFormFormaPago_Efectivo.');
                 }
                
             }
         </script>
                
        
         <script>
             function VisibleEFECTIVO() {
                 document.getElementById('Saldo').value = 0;

                 document.getElementById('Saldo').style.display = 'none';
                 document.getElementById('saldoSaludEmpresa').style.display = 'none';
                 //alert('VisibleEFECTIVO');
                 //document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_TC").style.display = "none";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago").style.display = "none";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo").style.display = "block";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_TC").style.display = "none";
                 //
                var ASPxFormFormaPago_Efectivo_ID = '<%= ASPxCheckBox3_Efectivo.ClientInstanceName %>';
                 var ASPxFormFormaPago_Efectivo = ASPxClientControl.GetControlCollection().GetByName(ASPxFormFormaPago_Efectivo_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxFormFormaPago_Efectivo && ASPxFormFormaPago_Efectivo instanceof ASPxClientCheckBox) {
                     ASPxFormFormaPago_Efectivo.SetChecked(true);

                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación ASPxFormFormaPago_Efectivo.');
                 }

                 var ASPxCheckBox1_Tarjeta_ID = '<%= ASPxCheckBox1_Tarjeta.ClientInstanceName %>';
                 var ASPxCheckBox1_Tarjeta = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox1_Tarjeta_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxCheckBox1_Tarjeta && ASPxCheckBox1_Tarjeta instanceof ASPxClientCheckBox) {
                     ASPxCheckBox1_Tarjeta.SetChecked(false);

                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación ASPxFormFormaPago_Efectivo.');
                 }

                 var ASPxFormFormaPago_ID = '<%= ASPxCheckBox2_SaludEmpresa.ClientInstanceName %>';
                 var ASPxFormFormaPago = ASPxClientControl.GetControlCollection().GetByName(ASPxFormFormaPago_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxFormFormaPago && ASPxFormFormaPago instanceof ASPxClientCheckBox) {
                     ASPxFormFormaPago.SetChecked(false);
                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación ASPxFormFormaPago_Efectivo.');
                 }

             }
         </script>
                
         <script>
             function VisibleTJ() {
                 document.getElementById('Saldo').textContent = 0;
                 document.getElementById('Saldo').style.display = 'none';
                 document.getElementById('saldoSaludEmpresa').style.display = 'none';
                 //alert('VisibleTJ');
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_TC").style.display = "block";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago").style.display = "none";
                 document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo").style.display = "none";

                 var ASPxCheckBox1_Tarjeta_ID = '<%= ASPxCheckBox1_Tarjeta.ClientInstanceName %>';
                 var ASPxCheckBox1_Tarjeta = ASPxClientControl.GetControlCollection().GetByName(ASPxCheckBox1_Tarjeta_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxCheckBox1_Tarjeta && ASPxCheckBox1_Tarjeta instanceof ASPxClientCheckBox) {
                     ASPxCheckBox1_Tarjeta.SetChecked(true);

                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación ASPxFormFormaPago_Efectivo.');
                 }

                 var ASPxFormFormaPago_ID = '<%= ASPxCheckBox2_SaludEmpresa.ClientInstanceName %>';
                 var ASPxFormFormaPago = ASPxClientControl.GetControlCollection().GetByName(ASPxFormFormaPago_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxFormFormaPago && ASPxFormFormaPago instanceof ASPxClientCheckBox) {
                     ASPxFormFormaPago.SetChecked(false);
                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación ASPxFormFormaPago_Efectivo.');
                 }


                 var ASPxFormFormaPago_Efectivo_ID = '<%= ASPxCheckBox3_Efectivo.ClientInstanceName %>';
                 var ASPxFormFormaPago_Efectivo = ASPxClientControl.GetControlCollection().GetByName(ASPxFormFormaPago_Efectivo_ID);

                 // Verifica si el control se encontró antes de intentar acceder a sus propiedades
                 if (ASPxFormFormaPago_Efectivo && ASPxFormFormaPago_Efectivo instanceof ASPxClientCheckBox) {
                     ASPxFormFormaPago_Efectivo.SetChecked(false);

                 } else {
                     console.error('No se pudo encontrar o el control no es una casilla de verificación ASPxFormFormaPago_Efectivo.');
                 }
                 // document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_Efectivo").style.display = "none";
                 //document.getElementById("ASPxPageControl5_ASPxSplitter6_ASPxFormFormaPago_0").style.display = "none";
             }
         </script>
 
         
       
        </dx:ASPxLoadingPanel>
        </body>
    </form>
 
  
 
</html>