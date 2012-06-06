xml.instruct!
xml.external_stories do
  @tasks.each do |task|
    xml.external_story do
      xml.external_id task.id
      xml.name task.name
      xml.description task.task_list.name
      xml.requested_by task.user.login
      xml.created_at task.created_at
      xml.story_type "feature"
      xml.estimate 0
    end
  end
end
