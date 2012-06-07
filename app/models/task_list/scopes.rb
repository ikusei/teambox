class TaskList
  default_scope :order => 'task_lists.position ASC, task_lists.created_at DESC'
  scope :with_archived_tasks, :conditions => 'archived_tasks_count > 0'
  scope :archived, :conditions => {:archived => true}
  scope :unarchived, :conditions => {:archived => false}
end