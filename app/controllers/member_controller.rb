require "net/https"
require "uri"

class MemberController < ApplicationController
  
  def index
  end
  
  def show
    uri = URI.parse("https://cloudspokes-profile-test.appspot.com/" + params[:id])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    json_payload = response.body
    @parsed_json = ActiveSupport::JSON.decode(json_payload)
    
  end
end
