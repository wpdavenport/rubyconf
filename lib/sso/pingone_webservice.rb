require 'uri'
require 'net/http'

module SSO
  class PingoneWebservice
    class Execption; end
    
    attr_accessor :idp_id, :sso_id
 
    SSO_BASE_URL = "sso.connect.pingidentity.com"
 
    def initialize(token_id)
      @token_id = token_id
      @response = request_for_metadata_by_token
      @sso_id = @response["subject"].presence
      @idp_id = @response["pingone.idp.id"].presence
    end
 
    def request_for_metadata_by_token
      url = URI.parse sso_url + @token_id
      http = ::Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = ::Net::HTTP::Get.new(url.path)
      request.basic_auth api_client_id, secret
      response = http.request(request)
      if response.code.to_i == 200
        JSON.parse(response.body)
      else
        logger.error("token_id: #{@token_id}, reponse_code: #{response.code}, response_message: #{response.body}")
        raise exception
      end
    end
 
    private
 
    def sso_url
      URI::HTTPS.build(:host => SSO_BASE_URL, :path => "/sso/TXS/2.0/1/").to_s
    end
    
    def api_client_id
      "ba5c720f-7396-476e-850d-9c7740e397b1"
    end
    
    def secret
      "1HatePasswords!"
    end
 
  end
end