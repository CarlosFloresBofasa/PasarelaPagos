// Define una función para cargar departamentos
function cargarDepartamentos() {
    try {
        // URL del API de departamentos
        var apiUrl = "https://farmappcia.bofasa.com/api/departamento";

        // Realiza una solicitud GET al API utilizando fetch
        fetch(apiUrl)
            .then(function (response) {
                // Verifica si la respuesta HTTP fue exitosa (código de respuesta 200)
                if (response.ok) {
                    // Parsea la respuesta JSON
                    return response.json();
                } else {
                    // En caso de un error en la respuesta, lanza una excepción
                    throw new Error("Error en la solicitud al API");
                }
            })
            .then(function (data) {
                // Maneja los datos recibidos del API
                // data contiene la respuesta JSON del API

                // Limpia el DropDownList de departamentos
                ddlDireccionesSitioDepartamento.length = 0;
                ddlDireccionesClienteDepartamento.length = 0;

                // Agrega la opción predeterminada
                ddlDireccionesSitioDepartamento.options.add(new Option("Seleccionar Departamento", "0"));
                ddlDireccionesClienteDepartamento.options.add(new Option("Seleccionar Departamento", "0"));

                // Recorre los departamentos y agrega los datos al DropDownList
                data.departamentos.forEach(function (departamento) {
                    var id = departamento.id;
                    var nombre = departamento.nombre;

                    // Agrega el departamento al DropDownList de sitio
                    ddlDireccionesSitioDepartamento.options.add(new Option(nombre, id));

                    // Agrega el departamento al DropDownList de cliente
                    ddlDireccionesClienteDepartamento.options.add(new Option(nombre, id));
                });
            })
            .catch(function (error) {
                // Maneja cualquier error que ocurra durante la solicitud
                console.error("Error: " + error.message);
            });

        // Selecciona la opción predeterminada
        ddlDireccionesSitioDepartamento.selectedIndex = 0;
        ddlDireccionesClienteDepartamento.selectedIndex = 0;
    } catch (error) {
        console.error("Error: " + error.message);
    }
}

// Llama a la función para cargar departamentos cuando sea necesario
cargarDepartamentos();
