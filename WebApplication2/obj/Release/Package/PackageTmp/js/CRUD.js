//Consumo de generacion dinamica 
fetch('https://localhost:44372/api/Publicacion', {
    method: 'GET',
    headers: {
        'Content-Type': 'application/json'
    },
    /*body: JSON.stringify({})*/
})
    .then(response => response.json())
    .then(data => {
        var container = document.querySelector('.cards-container');

        // Limpiar el contenido actual del contenedor
        container.innerHTML = '';
        //Recorremos la funcion que reconstruye las card
        data.forEach(function (dato) {
            var cardFragment = buildCard(dato);
            container.appendChild(cardFragment);
        });

    })
    .catch(error => {
        console.error('Error al obtener los datos de la API:', error);
    });
