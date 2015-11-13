class Course < ActiveRecord::Base
	belongs_to :user

	validates :title, :presence => { :message => "Course title is required" }
	validates :description, :presence => { :message => "Description is required"}
	validates :cost, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
end