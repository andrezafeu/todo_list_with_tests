class Api::TodoListsController < ApplicationController
	def index
		# send back a json collection of the todo lists
		render json: TodoList.all
	end
end