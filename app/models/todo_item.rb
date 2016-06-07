class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true,
  					  length: { minimum: 2 }

  def completed?
  	# when completed_at is not blank returns false
  	!completed_at.blank?
  end
end
