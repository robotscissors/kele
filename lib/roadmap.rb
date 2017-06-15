module ROADMAP

  def get_roadmap(roadmap_id)
    response = self.class.get("#{@baseURL}roadmaps/#{roadmap_id}", headers: auth_headers)
    JSON.parse(response.body).to_a
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("#{@baseURL}checkpoints/#{checkpoint_id}", headers: auth_headers)
    JSON.parse(response.body).to_a
  end

end
