# app/services/tomtom_service.rb
class TomtomService
    include HTTParty
  
    def initialize
      # Variável com a URI default da API
      @uri = 'https://api.tomtom.com/map/1/staticimage'
  
      # Variável com a key da API
      @mapa_key = 'Pyo0LlqbwDPGftnd8GwP4Q3zTRaasfSe'
    end
  
    def get_mapa(latitude, longitude)
      response_mapa = self.class.get(@uri, query: {
        key: @mapa_key,
        center: "#{latitude},#{longitude}",
        zoom: 15,
        format: 'png',
        width: 400,
        heigth: 300
      })
  
      if response_mapa.success?
        Rails.logger.info(response_mapa.body)
        return response_mapa.body
      else
        raise "Erro ao obter mapa da TomTom. Código: #{response_mapa.code}, Mensagem: #{response_mapa.body}"
      end
    end
  end
  