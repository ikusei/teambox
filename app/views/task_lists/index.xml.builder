xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.external_stories(:type=>"array") do
  @tasks.each do |task|
    next if task.name =~ /.* \[PT.*\]/
    xml.external_story do
      xml.external_id task.id
      xml.name task.name
      xml.description "#{task.task_list.name}: #{task.first_comment.body if task.first_comment.present? } http://teambox.ikusei.de/projects/#{task.project.permalink}/tasks/#{task.id}"
      xml.requested_by task.user.login
      xml.tag! "created_at", task.created_at.strftime("%Y/%m/%d %H:%M:%S UTC"), :type => "datetime"
      xml.story_type "feature"
      xml.tag! "estimate", 0, :type => "integer"
    end
  end
end
