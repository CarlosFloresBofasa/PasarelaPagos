<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Selección de NIT</title>
    <!-- Agrega cualquier estilo necesario aquí -->
    <style>
        /* Estilos para tarjetas o elementos de lista */
        .card {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 5px;
            cursor: pointer;
        }
        .info-container {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <h1>Listado de NITs</h1>
    <div id="nitListContainer">
        <!-- Aquí se mostrarán los NITs obtenidos -->
    </div>
    <div id="detailsContainer" class="info-container">
        <!-- Aquí se mostrarán los detalles del NIT seleccionado -->
    </div>
    <hr>
    
    <script>
        // Función para obtener los datos y llenar la lista de NITs
        async function obtenerNITs() {
           
            // Obtener el valor de accessToken de la URL
            const urlParams = new URLSearchParams(window.location.search);
            const accessToken = urlParams.get('accessToken');

            // Utilizar accessToken en tu lógica de la página nitList.aspx
            console.log('token: ' + accessToken); // Muestra el valor de accessToken en la consola del navegador

 
            // Validar si el token está presente y es válido
            if (!accessToken) {
                // Redirigir a la página de autenticación si no hay token
                window.location.href = 'Autenticar.aspx';
                return;
            }



















// Resto del código... 
            try {
                const response = await fetch('https://farmappcia.bofasa.com/api/nit', {
                    headers: {
                                'Authorization': `Bearer ${accessToken}` // Utilizando la variable accessToken
                    }
                });
                const data = await response.json();

                if (data.resultado && data.data) {
                    mostrarNITs(data.data);
                } else {
                    console.error('Error al obtener los datos');
                }
            } catch (error) {
                console.error('Error al realizar la solicitud:', error);
                alert(error);
            }
        }

        // Función para mostrar los NITs en la página
        function mostrarNITs(nits) {

         
            const nitListContainer = document.getElementById('nitListContainer');

            nits.forEach(nit => {
                const card = document.createElement('div');
                card.classList.add('card');
                card.textContent = `Nombre: ${nit.nombre}, Razon: ${nit.razon}`;
                card.addEventListener('click', function () {
                    
                });


                card.addEventListener('click', function () {
                    mostrarDetallesNIT(nit);
                  //  seleccionarNIT(nit);
                });

                nitListContainer.appendChild(card);
            });
        }

        // Función para mostrar los detalles del NIT seleccionado
        function mostrarDetallesNIT(nit) {
            const detailsContainer = document.getElementById('detailsContainer');
            detailsContainer.innerHTML = `
        <h2>Detalles del NIT Seleccionado</h2>
        <p><strong>Código NIT:</strong> ${nit.codigoNit}</p>
        <p><strong>Nombre:</strong> ${nit.nombre}</p>
        <p><strong>Razón:</strong> ${nit.razon}</p>
        <p><strong>NIT:</strong> ${nit.nit}</p>
        <p><strong>Dirección:</strong> ${nit.direccion}</p>
         <button onclick="seleccionarNIT('${nit.nit}', '${nit.nombre}', '${nit.razon}', '${nit.direccion}', '${nit.codigoNit}')">Seleccionar NIT</button>

    `;
        }
    
        function seleccionarNIT(nit, nombre, razon, direccion, codigoNit) {

           // alert(nit.nit);
            window.close();
            // Enviar el valor del NIT a la página principal
            window.opener.obtenerValorNIT(nit, nombre, razon, direccion, codigoNit);

            // Cerrar la ventana emergente después de realizar las operaciones
          
        }

 
        document.addEventListener('DOMContentLoaded', function () {
            obtenerNITs();
        });
    </script>


</body>
</html>
