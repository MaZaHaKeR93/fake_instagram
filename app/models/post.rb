class Post < ActiveRecord::Base
	acts_as_votable

	belongs_to :user
	has_many :comments, dependent: :destroy
	
	validates :image, presence: true
  
	has_attached_file :image,
                    styles: { medium: '640x'}

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  scope :of_followed_users, -> (following_users) { where user_id: following_users }
  
end
