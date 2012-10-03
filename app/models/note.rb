class Note < ActiveRecord::Base
  attr_accessible :content, :user_id, :course_id, :tag
  belongs_to :user
  belongs_to :course


  validates :user_id, :course_id, presence: true

  default_scope order: 'notes.created_at DESC'

  def self.search(search)
    if search
      where('tag LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
