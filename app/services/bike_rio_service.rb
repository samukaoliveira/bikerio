class BikeRioService
    include HTTParty

    #Variável com a URI default da API
    uri 'https://api.bikerio.rio/v1'

    #Variavel com a key da API
    bike_rio_key ''


    def initialize
        self.class.headers['Authorization'] = "Header #{bike_rio_key}"

    
    def localizar_bicicletarios
        response = self.class.get('/stations')

        if.response.sucess?
            return response.parsed_response['stations']
        else    
            raise "Erro ao obter informações do Bike Rio. Código: #{response.code}"
        end
    end 

    # def get_mapa(latitude, longitude)
    #     key_mapa = 'Pyo0LlqbwDPGftnd8GwP4Q3zTRaasfSe'
    #     response_mapa = RestClient.get("https://api.tomtom.com/map/1/style/metadata.xml?key=#{key_mapa}")
    
end