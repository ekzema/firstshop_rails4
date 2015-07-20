class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	has_many :comments, as: :commentable, :dependent => :destroy
	validates :name, :body, presence: true
	validates :name, length: { minimum: 3 }
end
