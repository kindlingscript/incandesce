class Section < ActiveRecord::Base
	belongs_to :course
	has_many :lessons, :order => 'created_at ASC'
end
