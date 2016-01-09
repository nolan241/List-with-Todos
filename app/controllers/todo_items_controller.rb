class TodoItemsController < ApplicationController
    before_action :set_todo_list
    
    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        redirect_to @todo_list
    end
    
    def destroy
        @toso_item = @todo_list.todo_items.find(params[:id])
        if @todo_item.destroy
            flash[:success] = "Todo List Item Was Deleted."
        else
            flash[:error] = "Todo List Item Could Not Be Deleted."
        end
        redirect_to @todo_list
    
    end
    
    private
    
    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
    end
    
    def todo_item_params
        params[:todo_item].permit(:content)
    end
    
end
