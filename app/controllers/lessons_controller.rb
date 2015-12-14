class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrolled_in_current_course

	def show
	end

	private

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end

	helper_method :current_course
	def current_course
		@current_course = current_lesson.section.course
	end

	def require_enrolled_in_current_course
		if current_user.enrolled_in?(current_lesson.section.course) == false
			redirect_to course_path(current_lesson.section.course), :alert => 'You need to enroll first'
		end
	end
end
