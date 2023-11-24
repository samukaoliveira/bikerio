let coordenada = {
    latitude: -25.5401479,
    longitude: -54.5858139
 }


   
    var map = L.map('map').setView([coordenada.latitude,coordenada.longitude ], 13);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);



    


const handleClickSeachLocal =  () => {
   
    const inpuntSearch = document.querySelector("#inputSearch").value

    let url_base = `https://nominatim.openstreetmap.org/search?street=${inpuntSearch}&city=Rio%20de%20Janeiro&format=json&polygon=1&addressdetails=1`

    console.log(url_base)

    

   fetch(url_base)
   .then(response => {
        return response.json(); 
    })

    .then(data => {
        console.log(data)
        
        let data_address = data[0].address

       

        coordenada.latitude = Number(data[0].lat)
        coordenada.longitude = Number(data[0].lon)

        
        map.setView([coordenada.latitude, coordenada.longitude])

        const ulAddress = document.querySelector("#local_list")

        const keyNamesAddress = {
            "road": "Rua",
            "suburb": "Bairro",
            "city": "Cidade",
            "municipality": "Região Geográfica",
            "county": "Região",
            "state_district": "Distrito",
            "state": "Estado",
            "ISO3166-2-lvl4": "UF",
            "region": "Região do Brasil ",
            "postcode": "CEP",
            "country": "País",
            "country_code": "Sigla do País",
            
        };

        ulAddress.innerHTML = '';
        
        for (let key in data_address){

            const li = document.createElement('li');
            const descriptionKey = keyNamesAddress[key] || key;
            li.innerHTML = `<label>${descriptionKey}:</label> ${data_address[key]}`
            ulAddress.appendChild(li)
        }

    })

    



   
}


const handleClickInputSearch = () => {

}


const btnSearch = document.querySelector("#btn_search")
btnSearch.addEventListener('click', handleClickSeachLocal)