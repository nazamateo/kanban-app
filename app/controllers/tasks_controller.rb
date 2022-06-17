class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]
    before_action :set_category, only: %i[ new create ]

    def index
    end
    
    def new
        @task = @category.tasks.build(user_id: current_user.id)
    end
        
    def create
        @task = @category.tasks.build(task_params.merge(user_id: current_user.id))
        respond_to do |format|
            if  @task.save
                format.html { redirect_to category_task_path(@category.id, @task.id), notice: "Task was successfully created!." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def show
    end
    
    def edit
    end

    def update
        respond_to do |format|
            if @task.update(task_update_params)
                format.html { redirect_to category_task_path(params[:category_id], @task.id), notice: "Task was successfully updated!." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @task.destroy
            respond_to do |format|
                format.html { redirect_to '/categories', notice: "Task was successfully destroyed." }
            end
    end

    private

    def set_task
        @task= Task.find params[:id]
    end

    def set_category
        @category = Category.find params[:category_id]
    end

    def task_params 
        params.require(:task).permit(:action_item, :deadline, :priority, :user_id)
    end

    def task_update_params
        params.require(:task).permit(:action_item, :deadline, :priority)
    end
end