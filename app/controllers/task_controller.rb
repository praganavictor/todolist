class TaskController < ApplicationController
	def index
		@list = List.find(params[:list_id])
		@tasks = @list.tasks
	end
	def destroy
		list = List.find(params[:list_id])
		@task = list.tasks.find(params[:id])
		@task.destroy
		redirect_to list_task_index_path(list)
	end
end
