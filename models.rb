class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true 
  #unique name and cannot be blank
  has_many :blogs, dependent: :destroy
  # blogs belong to users and if you destroy user, you destroy their blogs
end

class Blog < ActiveRecord::Base
  belongs_to :user
  # has_many :comments, dependent: :destroy
end
