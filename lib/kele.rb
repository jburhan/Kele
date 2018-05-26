require 'httparty'
require 'json'
require './lib/roadmap'

class Kele
  include HTTParty
  include Roadmap

  def initialize(email, password)
    @base_url = 'https://www.bloc.io/api/v1'
    response = Kele.post(
      "#{@base_url}/sessions",
      body: { email: email, password: password }
    )

    if response && response["auth_token"]
      @auth_token = response["auth_token"]
      puts "#{email} has sucessfully logged in"
    else
      puts "Login invalid"
    end

  end

  def get_me
    @base_url = 'https://www.bloc.io/api/v1'
    response = Kele.get("#{@base_url}/users/me", headers: { "authorization" => @auth_token })
    @user = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    @base_url = 'https://www.bloc.io/api/v1'
    response = Kele.get("#{@base_url}/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
    @mentor = JSON.parse(response.body)
  end

  def get_messages(page_num = nil)
    @base_url = 'https://www.bloc.io/api/v1'
    if page_num == nil
      response = Kele.get("#{@base_url}/message_threads", headers: { "authorization" => @auth_token })
    else
      response = Kele.get("#{@base_url}/message_threads?page=#{page_num}", headers: { "authorization" => @auth_token })
    end
    @messages = JSON.parse(response.body)
  end

  def create_message(user_id, recipient_id, token, subject, message)
    @base_url = 'https://www.bloc.io/api/v1'
    response = Kele.post("#{@base_url}/messages", body: { "user_id": user_id,"recipient_id": recipient_id,
        "token": token, "subject": subject, "stripped_text": message }, headers: { "authorization" => @auth_token })
    puts response
  end

end
