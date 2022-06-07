class TasksController < ApplicationController
    def index
        @current_userr = User.find(params[:user_id])
        @current_user_tasks = current_user.tasks

        if current_user.id != @current_userr.id
            redirect_to '/'
        end
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

    def get_user
        @user = User.find_by_id(params[:id])
        link_to '/'
    end

    def user_views_only_own_records
        if @user.id != current_user.id
            link_to '/'
        end
    end

    private
    def task_params
        params.require(:task).permit(:category, :action_item)
    end

    def task_update_params
        params.require(:task).permit(:category, :action_item, :status, :deadline)
    end

end

