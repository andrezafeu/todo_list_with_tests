# camel case version of the file name
module TodoListHelpers
	def visit_todo_list(list)
		visit "/todo_lists"
		# using rails dom_id method
		within dom_id_for(list) do
			click_link "List Items"
		end
	end
end