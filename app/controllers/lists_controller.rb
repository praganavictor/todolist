class ListsController < ApplicationController
	def show
		id = params[:id]
		@list = List.find(id)
	end

	def new
		@list = List.new
		@list.tasks.build
	end

	def create
		@list = List.new(list_params)
		@list.user = current_user
		if @list.save
			flash[:success] = "List saved successfully"
	    	redirect_to root_path
	    else
			flash[:notice] = "You have to fill all the fields"
			render new
	    end
	end

	def publish
		list = List.find(params[:list_id])
		list.publish!
		flash[:success] = 'Now your list is a publish list'
		redirect_to root_path
	end

	def privating
		list = List.find(params[:list_id])
		list.privating!
		flash[:success] = 'Now your list is a private list'
		redirect_to root_path
	end

	private
    def list_params
      params.require(:list).permit(:name, :tasks_attributes => [:title, :description])
    end
end
