module Messages
  def get_messages(page_number = 0)
    if page_number > 0
      response = self.class.get("#{@baseURL}message_threads", body: { "page": "#{page_number}" }, headers: auth_headers)
    else
      response = self.class.get("#{@baseURL}message_threads", headers: auth_headers)
    end
    JSON.parse(response.body).to_a
  end

  def create_message(sender,recipient_id, subject, stripped_text, message_token = nil)
    if message_token
      response = self.class.post("#{@baseURL}messages", body: {"sender": sender, "recipient_id": recipient_id, "token": message_token, "subject": subject, "stripped-text": stripped_text})
    else
      response = self.class.post("#{@baseURL}messages", body: {"sender": sender, "recipient_id": recipient_id, "subject": subject, "stripped-text": stripped_text})
    end
  end

end
