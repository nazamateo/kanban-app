class CategoriesController < ApplicationController
    include CategoriesHelper
    before_action :check_authentication
    before_action :set_category, only: %i[ show edit update destroy ]
    before_action :set_current_user, only: %i[ new create ]

    
    def index
    end
    
    def new
        @category = @current_user.categories.build
    end

    def create
        @category = @current_user.categories.build(category_params)
        respond_to do |format|
            if  @category.save
                format.html { redirect_to user_category_path(current_user.id, @category.id), notice: "Category was successfully created!." }
                format.json { render :show, status: :created, location: @category }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end

    def show
    end

    def edit
    end

    def update
        respond_to do |format|
            if @category.update(category_update_params)
                format.html { redirect_to user_category_path(current_user.id, @category.id), notice: "Category was successfully updated!." }
                format.json { render :show, status: :created, location: @category }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @category.destroy
            respond_to do |format|
                format.html { redirect_to '/', notice: "Category was successfully destroyed." }
                format.json { head :no_content }
            end
    end

    private
    
    def set_category
        @category = Category.find params[:id]
    end

    def set_current_user
        @current_user = User.find(params[:user_id])
    end

    def category_params
        params.require(:category).permit(:project_title, :details)
    end

    def category_update_params
        params.require(:category).permit(:project_title, :details)
    end
end