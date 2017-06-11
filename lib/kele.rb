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
    @me = self.class.get("#{@baseURL}users/me", headers: { "authorization" => @auth_token })
    JSON.parse(@me.body)
  end

  def get_mentor_availability(mentor_id)
    @mentor_id = mentor_id
    @available = self.class.get("#{@baseURL}mentors/#{@mentor_id}/student_availability", headers: { "authorization" => @auth_token } )
    JSON.parse(@available.body).to_a
  end
end
