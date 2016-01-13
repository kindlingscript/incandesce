class StaticPagesController < ApplicationController
	def index
    @features = Course.random(3)
	end

	def privacy
	end

	def team
	end

	def careers
	end
end
