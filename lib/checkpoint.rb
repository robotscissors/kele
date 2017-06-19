module Checkpoint

  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
    response = self.class.post("#{@baseURL}checkpoint_submissions", body: {"assignment_branch": assignment_branch, "assignment_commit_link": assignment_commit_link, "checkpoint_id": checkpoint_id, "comment": comment, "enrollment_id": @enrollment_id}, headers: auth_headers)
  end
end
