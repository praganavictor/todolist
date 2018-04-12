class HomeController < ApplicationController
	def index
		@lists_public = List.where("status == 0")
		@lists_private = List.where("status == 1")
	end
end
