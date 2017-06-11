require 'httparty'
require 'json'

class Kele
  include HTTParty
  include JSON


  def initialize(email,password)
    @baseURL = 'https://www.bloc.io/api/v1/'
    @email = email
    @password = password
    @response = self.class.post("#{@baseURL}sessions", body: {"email": @email, "password": @password})
    raise "Invalid Credentials" if @response.code != 200
    @auth_token = @response['auth_token']
    puts "Credentials Approved"
  end

  def get_me
    @response = self.class.get("#{@baseURL}users/me", headers: { "authorization" => @auth_token })
    JSON.parse(@response.body)
  end
end
