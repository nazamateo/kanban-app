class CategoriesController < ApplicationController
    
    def index
        @categories = current_user.categories
    end
    
    def show
        @category = Category.find params[:id]
    end

    def new
        @category = current_user.categories.build
    end

    def create
        @category = current_user.categories.build(category_params)
        respond_to do |format|
            if  @category.save
                format.html { redirect_to category_path(@category.id), notice: "Category was successfully created!." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def edit
        @category = Category.find params[:id]
    end

    def update
        @category = Category.find params[:id]
        respond_to do |format|
            if @category.update(category_update_params)
                format.html { redirect_to category_path(@category.id), notice: "Category was successfully updated!." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @category = Category.find params[:id]
        @category.destroy
            respond_to do |format|
                format.html { redirect_to '/categories', notice: "Category was successfully destroyed." }
            end
    end

    private
    
    def set_category
        @category = Category.find params[:id]
    end

    def category_params
        params.require(:category).permit(:title, :details)
    end

    def category_update_params
        params.require(:category).permit(:title, :details)
    end
end