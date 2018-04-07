class TaskController < ApplicationController
	def index
		@list = List.find(params[:list_id])
		@tasks = @list.tasks
	end
end
