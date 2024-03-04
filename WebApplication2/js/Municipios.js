function CargarZonas(codigoMunicipio, combo) {
    try {
        var existeDatos = false;

        // Construye la URL del API con el código de municipio
        var apiUrl = "https://farmappcia.bofasa.com/api/municipio/" + codigoMunicipio + "/zonas";

        // Realiza una solicitud GET al API utilizando la función fetch
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

                // Limpia el DropDownList de zonas
                if (combo === 1) {
                    ddlDireccionesSitioZona.length = 0; // Elimina todos los elementos del DropDownList
                    ddlDireccionesSitioZona.options.add(new Option("Seleccionar Zona", "0")); // Agrega la opción predeterminada
                } else if (combo === 2) {
                    ddlDireccionesClienteZona.length = 0;
                    ddlDireccionesClienteZona.options.add(new Option("Seleccionar Zona", "0"));
                }

                // Recorre las zonas y agrega los datos al DropDownList
                data.zonas.forEach(function (zona) {
                    existeDatos = true;
                    var id = zona.id;
                    var nombre = zona.nombre;

                    if (combo === 1) {
                        ddlDireccionesSitioZona.options.add(new Option(nombre, id));
                    } else if (combo === 2) {
                        ddlDireccionesClienteZona.options.add(new Option(nombre, id));
                    }
                });
            })
            .catch(function (error) {
                // Maneja cualquier error que ocurra durante la solicitud
                console.error("Error: " + error.message);
            });

        // Si no existen datos, agrega una opción "Sin Zonas"
        if (!existeDatos) {
            if (combo === 1) {
                ddlDireccionesSitioZona.length = 0;
                ddlDireccionesSitioZona.options.add(new Option("Sin Zonas", "-1"));
            } else if (combo === 2) {
                ddlDireccionesClienteZona.length = 0;
                ddlDireccionesClienteZona.options.add(new Option("Sin Zonas", "-1"));
            }
        }

        // Selecciona la opción predeterminada
        if (combo === 1) {
            ddlDireccionesSitioZona.selectedIndex = 0;
        } else if (combo === 2) {
            ddlDireccionesClienteZona.selectedIndex = 0;
        }
    } catch (error) {
        console.error("Error: " + error.message);
    }
}
