require 'httparty'
require 'json'
require_relative './roadmap.rb'
require_relative './messaging.rb'
require_relative './checkpoint.rb'

class Kele
  include HTTParty
  include JSON
  include Roadmap
  include Messages
  include Checkpoint


  def initialize(email,password)
    @baseURL = 'https://www.bloc.io/api/v1/'
    response = self.class.post("#{@baseURL}sessions", body: {"email": email, "password": password})
    raise "Invalid Credentials" if response.code != 200
    @auth_token = response['auth_token']
    puts "Credentials Approved"
  end

  def get_me
    response = self.class.get("#{@baseURL}users/me", headers: auth_headers)
    @enrollment_id = response["current_enrollment"]["id"]
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get("#{@baseURL}mentors/#{mentor_id}/student_availability", headers: auth_headers)
    JSON.parse(response.body).to_a
  end



  private

  def auth_headers
    { "authorization" => @auth_token }
  end


end
