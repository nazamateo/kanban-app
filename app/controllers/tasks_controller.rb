class TasksController < ApplicationController
    def index
        @current_user = User.find(params[:user_id])
        @current_user_tasks = @current_user.tasks
    end

    def show
        @current_user = User.find(params[:user_id])
        @current_user_task = Task.where "user_id = ? AND id = ?", params[:user_id],params[:id]
    end

    def new
        @current_user = User.find(params[:user_id])
    end
    
    def create
        @current_user = User.find(params[:user_id])
        @task = @current_user.tasks.create(task_params)
        redirect_to '/'
    end

    def edit
        @current_user = User.find(params[:user_id])
        @current_user_task = Task.where "user_id = ? AND id = ?", params[:user_id],params[:id]
    end

    def update
        @current_user_task = Task.where "user_id = ? AND id = ?", params[:user_id],params[:id]
        @current_user_task.update(task_update_params)
        redirect_to user_tasks_path(params[:user_id])
    end




    private
    def task_params
        params.require(:task).permit(:category, :action_item)
    end

    def task_update_params
        params.require(:task).permit(:category, :action_item, :status, :deadline)
    end

end

