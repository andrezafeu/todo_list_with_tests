class Api::TodoListsController < ApplicationController

	# to avoid error "can't verify CSRF authenticity"  while doing local tests with curl
	skip_before_filter :verify_authenticity_token

	def index
		# send back a json collection of the todo lists
		render json: TodoList.all
	end

	def show
		list = TodoList.find(params[:id])
		render json: list
	end

	def create
		list = TodoList.new(list_params)
		if list.save
			render json: {
				status: 200,
				message: "Successfully created list",
				todo_list: list
			}.to_json
		else
			render json: {
				status: 500,
				errors: list.errors
			}.to_json
		end
	end

	private
	def list_params
		params.require("todo_list").permit("title", "description")
	end
	
end