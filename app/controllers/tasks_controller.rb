class TasksController < ApplicationController
    include TasksHelper
    before_action :check_authentication
    before_action :set_task, only: %i[ show edit update destroy ]
    before_action :set_category, only: %i[ new create ]

    def index
    end
    
    def new
        @task = @category.tasks.build(user: current_user)
    end
        
    def create
        @task = @category.tasks.build(task_params)
        @task.user = current_user
        respond_to do |format|
            if  @task.save
                format.html { redirect_to user_category_task_path(current_user.id, @category.id, @task.id), notice: "Task was successfully created!." }
                format.json { render :show, status: :created, location: @task }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @task.errors, status: :unprocessable_entity }
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
                format.html { redirect_to user_category_task_path(current_user.id, params[:category_id], @task.id), notice: "Task was successfully updated!." }
                format.json { render :show, status: :created, location: @task }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @task.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @task.destroy
            respond_to do |format|
                format.html { redirect_to '/', notice: "Task was successfully destroyed." }
                format.json { head :no_content }
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
        params.require(:task).permit(:action_item, :deadline, :urgency, :impact, :status)
    end

    def task_update_params
        params.require(:task).permit(:action_item, :status, :deadline, :urgency, :impact)
    end
end