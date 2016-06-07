require 'spec_helper'

describe "Viewing todo lists" do
	let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries")}

	it "dislays the title of a todo list" do
		visit_todo_list(todo_list)
		within("h1") do
			expect(page).to have_content(todo_list.title)
		end
	end

	it "displays no items when todo list is empty" do
		visit_todo_list(todo_list)
		# look for an ul with the class of todo_items
		# page.all method finds all the elements on the page with a given css selector
		expect(page.all("ul.todo_items li").size).to eq(0)
	end

	it "displays item content when a todo list has items" do
		todo_list.todo_items.create(content: "Milk")
		todo_list.todo_items.create(content: "Eggs")
		
		visit_todo_list(todo_list)
		
		expect(page.all("ul.todo_items li").size).to eq(2)
		
		within "ul.todo_items" do
			expect(page).to have_content("Milk")
			expect(page).to have_content("Eggs")
		end
	end
end