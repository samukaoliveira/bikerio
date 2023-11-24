
// base_url = "https://api.tomtom.com/map/1/sprite/20.0.0-8/metadata.json?key=";
// api_key = "Pyo0LlqbwDPGftnd8GwP4Q3zTRaasfSe";

// fetch(base_url + api_key)
//     .then(resp => resp.json())
//     .then(conteudoJson => {
//         document.querySelector("#mapa").innerHTML = conteudoJson[1];
//         console.log(conteudoJson)
//     });






//https://{baseURL}/map/{versionNumber}/{resourceType}/{resourceVersion}/{resourceVariant}/metadata.{format}?key={Your_API_Key}


var map = L.map('map').setView([51.505, -0.09], 13);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

L.marker([51.5, -0.09]).addTo(map)
    .bindPopup('A pretty CSS popup.<br> Easily customizable.')
    .openPopup();