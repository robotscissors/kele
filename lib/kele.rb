require 'httparty'

class Kele
  include HTTParty


  def initialize(email,password)
    @baseURL = 'https://www.bloc.io/api/v1/'
    @email = email
    @password = password
    @response = self.class.post("#{@baseURL}sessions", body: {"email": @email, "password": @password})
    raise "Invalid Credentials" if @response.code != 200
    @auth_token = @response['auth_token']
    puts "Credentials Approved"
  end
end
