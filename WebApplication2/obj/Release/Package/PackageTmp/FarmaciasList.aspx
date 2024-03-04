<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmaciasList.aspx.cs" Inherits="WebApplication2.FarmaciasList" %>

 
<%@ Register assembly="DevExpress.Web.v23.1, Version=23.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

 
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Selección de Departamentos</title>
    <style>
        /* Estilos para tarjetas */
        .card {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 5px;
            width: 200px; /* Ancho de cada tarjeta */
            display: inline-block; /* Alineación horizontal */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" FullscreenMode="True" Height="100%" Width="100%">
            <panes>
                <dx:SplitterPane ScrollBars="Vertical">
                    <ContentCollection>
<dx:SplitterContentControl runat="server">
    <h1>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Nueva busqueda de farmacia" />
    </h1>
    <h1>Seleccione un Departamento:</h1>
    <div id="tarjetasContainer">
        <!-- Aquí se mostrarán las tarjetas de departamentos -->
    </div>
    <h1>Lista de Municipios</h1>
    <div id="municipiosContainer" class="cards-container">
        <!-- Aquí se mostrarán las tarjetas de municipios -->
    </div>
    <h1>Selección de zonas</h1>
    <div id="zonasContainer" class="cards-container">
        <!-- Aquí se mostrarán las tarjetas de zonas -->
    </div>
    <h1>Información de Farmacia</h1>
    <div id="farmaciasContainer" class="cards-container">
        <!-- Aquí se mostrarán las tarjetas de zonas -->
    </div>
    <script>

    async function obtenerDepartamentos() {
        try {
            const response = await fetch('https://farmappcia.bofasa.com/api/departamento', {
                headers: {
                    'Accept': 'application/json',
                    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmcmFuY2lzY29mQGJvZmFzYS5jb20iLCJqdGkiOiI3MWZkMTRhZi0yZGI3LTQwYTctYWQxYS00ZmNmMGZkM2U1ZTYiLCJlbWFpbCI6ImZyYW5jaXNjb2ZAYm9mYXNhLmNvbSIsInVpZCI6IjNmOWZlMDBhLTQ4YjEtNGJjMC05MjRkLTQ5YWFhNmVhZjFiMCIsImlwIjoiaHR0cHM6Ly9mYXJtYXBwY2lhLmJvZmFzYS5jb20iLCJrZXkiOiIiLCJwcm92aWRlciI6IkNSRURFTlRJQUwiLCJyb2xlcyI6IkJhc2ljIiwiZXhwIjoxNzAxNDYxODQ0LCJpc3MiOiIyODI5NjE4Mjc0MTgtdXU3dTRmNHZkZmY1ZDBqZzY1N3VlamszZzNtNDk0amsuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIyODI5NjE4Mjc0MTgtdXU3dTRmNHZkZmY1ZDBqZzY1N3VlamszZzNtNDk0amsuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20ifQ.BxnX1l9oBcT7ux7MCDwCW9RhMoHuUaC_cH_Etbfi64w'
                }
            });



            const data = await response.json();

            if (data.resultado && data.data) {
                const tarjetasContainer = document.getElementById('tarjetasContainer');

                data.data.forEach(departamento => {
                    const card = document.createElement('div');
                    card.classList.add('card');
                    card.textContent = departamento.nombre;
                    card.setAttribute('data-departamento-id', departamento.id); // Agrega el ID como un atributo de datos

                    card.addEventListener('click', function () {
                        const idDepartamento = departamento.id;
                        obtenerMunicipios(idDepartamento); // Llama a obtenerMunicipios con el ID del departamento
                    });

                    tarjetasContainer.appendChild(card);
                });
            } else {
                console.error('Error al obtener los departamentos');
            }
        } catch (error) {
            console.error('Error al realizar la solicitud:', error);
        }
    }
    </script>
    <script>

      async function obtenerMunicipios(idDepartamento) {
          try {
              const response = await fetch(`https://farmappcia.bofasa.com/api/departamento/${idDepartamento}/municipios`, {
                  headers: {
                      'Accept': 'application/json'
                  }
              });

              const data = await response.json();

              if (data.resultado && data.data) {
                  const municipiosContainer = document.getElementById('municipiosContainer');
                  municipiosContainer.innerHTML = ''; // Limpia el contenedor antes de agregar los municipios

                  data.data.forEach(municipio => {
                      const card = document.createElement('div');
                      card.classList.add('card');
                      card.textContent = municipio.nombre;

                      // Agrega un event listener para mostrar el ID al hacer clic en la tarjeta
                      card.addEventListener('click', function () {
                        //  alert(`ID del municipio: ${municipio.id}`);
                          obtenerZonas(municipio.id); // Llama a obtenerZonas con el ID del municipio
                          ocultarElemento(tarjetasContainer);
                      });

                      municipiosContainer.appendChild(card);
                  });
              } else {
                  console.error('Error al obtener los municipios');
              }
          } catch (error) {
              console.error('Error al realizar la solicitud:', error);
          }
      }

      document.addEventListener('DOMContentLoaded', function () {
          obtenerDepartamentos();
      });
  </script>
    <script>

    async function obtenerZonas(idMunicipio) {
        try {
            const response = await fetch(`https://farmappcia.bofasa.com/api/municipio/${idMunicipio}/zonas`, {
                headers: {
                    'Accept': 'application/json'
                }
            });

            const data = await response.json();

            if (data.resultado && data.data) {
                const zonasContainer = document.getElementById('zonasContainer');
                zonasContainer.innerHTML = ''; // Limpia el contenedor antes de agregar las zonas

                data.data.forEach(zona => {
                    const card = document.createElement('div');
                    card.classList.add('card');
                    card.textContent = zona.nombre;

                    // Agrega un event listener para mostrar el ID al hacer clic en la tarjeta
                    card.addEventListener('click', function () {
                       // alert(`ID de la zona: ${zona.id}`);
                        obtenerFarmacias(1, idMunicipio,zona.id,1,1); // Llama a la función obtenerInfoFarmacia con el ID de la zona
                        
                        
                    });

                    zonasContainer.appendChild(card);
                });
            } else {
                console.error('Error al obtener las zonas');
            }
        } catch (error) {
            console.error('Error al realizar la solicitud:', error);
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        // Puedes llamar a obtenerZonas con un ID de municipio específico si deseas mostrar las zonas al cargar la página
        // obtenerZonas('2cf6c531-5949-4197-897a-f70dec24cf7a');
    });
</script>
    <script>

        async function obtenerFarmacias(CodigoCadena, codigoMunicipio, codigoZona, NumeroPagina, TamanoPagina) {
            try {
                const apiUrl = `https://farmappcia.bofasa.com/api/farmacia?CodigoCadena=${CodigoCadena}&CodigoMunicipio=${codigoMunicipio}&CodigoZona=${codigoZona}&NumeroPagina=${NumeroPagina}&TamanoPagina=${TamanoPagina}`;
                console.log(apiUrl);
                const response = await fetch(apiUrl);
                const jsonData = await response.json();
                console.log(apiUrl);
                const farmaciasContainer = document.getElementById('farmaciasContainer');
                farmaciasContainer.innerHTML = ''; // Limpiar el contenedor antes de agregar las tarjetas

                jsonData.data.data.forEach(farmacia => {
                    const card = document.createElement('div');
                    card.classList.add('card');

                    const nombre = document.createElement('h3');
                    nombre.textContent = farmacia.nombre;

                    const codigoFarmacia = document.createElement('p');
                    codigoFarmacia.textContent = `Código de Farmacia: ${farmacia.codigoFarmacia}`;

                    const codigoCadena = document.createElement('p');
                    codigoCadena.textContent = `Código de Cadena: ${farmacia.codigoCadena}`;

                    const direccion = document.createElement('p');
                    direccion.textContent = `Dirección: ${farmacia.direccion}`;
                    // Crear un botón para seleccionar la farmacia
                    // Crear un botón para seleccionar la farmacia
                    const botonSeleccionar = document.createElement('button');
                    botonSeleccionar.textContent = 'Seleccionar Farmacia';
                    botonSeleccionar.addEventListener('click', function () {
                     //   seleccionarFarmacia(farmacia.codigoFarmacia, farmacia.nombre, farmacia.direccion);
                        
                        seleccionarFarmacia(farmacia.codigoCadena, farmacia.codigoFarmacia, farmacia.nombre, farmacia.direccion);
                        

                        
                    });

                    // Agrega los elementos al card
                
                    card.appendChild(nombre);
                    card.appendChild(codigoFarmacia);
                    card.appendChild(codigoCadena);
                    card.appendChild(direccion);
                    card.appendChild(botonSeleccionar); // Agregar el botón al card


                    farmaciasContainer.appendChild(card);
                });
            } catch (error) {
                console.error('Ocurrió un error al cargar los datos del API:', error);
            }

            

        }

    </script>
    <script>

      // Esta función debe estar fuera del bloque de obtenerFarmacias
        //function seleccionarFarmacia(codigoCadena, codigoFarmacia, nombre, direccion) {
        function seleccionarFarmacia(codigoCadena, codigoFarmacia, nombre, direccion) {
          // Enviar el valor de la farmacia a la página principal
            window.opener.obtenerValorFarmacia(codigoCadena, codigoFarmacia, nombre, direccion);
          // Cerrar la ventana emergente después de realizar las operaciones
          window.close();
      }

    // Resto del código...
    </script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            const tarjetasContainer = document.getElementById('tarjetasContainer');

            tarjetasContainer.addEventListener('click', function () {
                tarjetasContainer.style.display = 'none'; // Oculta el contenedor de departamentos al hacer clic en él
            });
        });
    </script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            const tarjetasContainer = document.getElementById('municipiosContainer');

            tarjetasContainer.addEventListener('click', function () {
                tarjetasContainer.style.display = 'none'; // Oculta el contenedor de departamentos al hacer clic en él
            });
        });
    </script>
    <script>

            document.addEventListener('DOMContentLoaded', function () {
                const tarjetasContainer = document.getElementById('zonasContainer');

                tarjetasContainer.addEventListener('click', function () {
                    tarjetasContainer.style.display = 'none'; // Oculta el contenedor de departamentos al hacer clic en él
                });
            });
        </script>
 


                        </dx:SplitterContentControl>
</ContentCollection>
                </dx:SplitterPane>
            </panes>
        </dx:ASPxSplitter>
        </h1>
    </form>


</body>
</html>
