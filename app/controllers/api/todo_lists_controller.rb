class Api::TodoListsController < ApplicationController

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
			# return the head of the response and response code
			head 200
		else
			head 500
		end
	end

	private
	def list_params
		params.require("todo_list").permit("title", "description")
	end
	
end