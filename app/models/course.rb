class Course < ActiveRecord::Base
	belongs_to :user
	has_many :sections
	has_many :enrollments
	mount_uploader :image, ImageUploader

	validates :title, :presence => { :message => "Course title is required" }
	validates :description, :presence => { :message => "Description is required"}
	validates :cost, :presence => true, :numericality => {:greater_than_or_equal_to => 0}

	def free?
		cost.zero?
	end

	def premium?
		! free?
	end

	def self.random(number)
		order("RANDOM()").sample(number)
	end
end
