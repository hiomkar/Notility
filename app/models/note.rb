# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag        :string(255)
#  course_id  :integer
#

class Note < ActiveRecord::Base
  attr_accessible :content, :course_id, :tag

  belongs_to :course

  validates :course_id, presence: true

  default_scope order: 'notes.created_at DESC'

  def self.search(search)
    if search
      where('tag LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
