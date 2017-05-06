class Api::TodoListsController < Api::ApiController

	def index
		# send back a json collection of the todo lists
		render json: TodoList.all
	end

	def show
		list = TodoList.find(params[:id])
		render json: list.as_json(include:[:todo_items])
	end

	def create
		list = TodoList.new(list_params)
		if list.save
			render status: 200, json: {
				message: "Successfully created list",
				todo_list: list
			}.to_json
		else
			# error 422: Unprocessable Entity
			render status: 422, json: {	
				errors: list.errors
			}.to_json
		end
	end

	def update
		list = TodoList.find(params[:id])
		if list.update(list_params)
			render status: 200, json: {
				message: "Successfully updated list",
				todo_list: list
			}.to_json
		else
			render status: 500, json: {
				message: "List could not be updated",
				todo_list: list
			}.to_json
		end
	end

	def destroy
		list = TodoList.find(params[:id])
		list.destroy
		render status: 200, json: {
			message: "Successfully deleted list",
			todo_list: list
		}.to_json
	end

	private
	def list_params
		params.require("todo_list").permit("title", "description")
	end
	
end