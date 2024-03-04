<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Direcciones</title>
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
    <h1>Lista de Direcciones</h1>
      <button onclick="crearNuevaDireccion()">Crear Nueva Dirección</button>
     
    <div id="tarjetasContainer">
        <!-- Aquí se mostrarán las tarjetas de direcciones -->
    </div>

    <script>
        async function obtenerDirecciones() {

            // Obtener el valor de accessToken de la URL
            const urlParams = new URLSearchParams(window.location.search);
            const accessToken = urlParams.get('accessToken');
           

            try {
                //const response = await fetch('http://localhost:5000localhost:5000/api/direccion', {

                const response = await fetch('https://farmappcia.bofasa.com/api/direccion', {
                    //const url = 'https://farmappcia.bofasa.com/api/orden/farmacia';

                    headers: {
                        'Authorization': `Bearer ${accessToken}` // Utilizando la variable accessToken
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
            const tarjetasContainer = document.getElementById('tarjetasContainer');

            data.forEach(item => {
                const card = document.createElement('div');
                card.classList.add('card');

                card.innerHTML = '<div class="card-body">' +
                    '<h5 class="card-title">' + item.alias + '</h5>' +
                    '<p class="card-text">Dirección: ' + item.colonia + ' ' + item.numeroCasa + ' ' + item.direccion + '  ' + item.municipio.nombre + '  ' + item.departamento.nombre + '</p>' +
                    '<button onclick="seleccionarDireccion(\'' + item.alias + '\', \'' + item.colonia + ' ' + item.numeroCasa + ' ' + item.direccion + ' ' + item.municipio.nombre + ' ' + item.departamento.nombre + '\', \'' + item.codigoDireccion + '\')">Seleccionar NIT</button>' +
                    '</div>';

                tarjetasContainer.appendChild(card);

                card.addEventListener('click', function () {
                    // Aquí puedes realizar alguna acción al hacer clic en una tarjeta
                    // Por ejemplo, enviar los datos a otra página, etc.
                   
                });
            });
        }

        function seleccionarDireccion(alias, direccion, codigoDireccion) {

            //alert('Dirección seleccionada:',  codigoDireccion);
            window.close();
            window.opener.obtenerDireccion(alias, direccion, codigoDireccion);

        }

        // Función para crear una nueva dirección
        function crearNuevaDireccion() {
            // Agrega aquí la lógica para crear una nueva dirección, puede ser mediante una redirección a otra página o mostrando un formulario, etc.
            console.log('Crear nueva dirección...');
            // Por ejemplo, puedes redirigir a otra página donde se cree una nueva dirección
            window.location.href = 'nueva_direccion.html';
        }

        document.addEventListener('DOMContentLoaded', function () {
            obtenerDirecciones();
        });
    </script>
</body>
</html>
