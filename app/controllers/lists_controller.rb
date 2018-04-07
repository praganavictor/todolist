class ListsController < ApplicationController
	def new
		@list = List.new
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

	private
    def list_params
      params.require(:list).permit(:name)
    end
end