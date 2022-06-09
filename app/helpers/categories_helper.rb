module CategoriesHelper
    def check_authentication
        @user_id_params = User.find(params[:user_id])
        if current_user.id != @user_id_params.id
            flash[:notice] = 'Authentication Error! It looks like you are trying to access another account.'
            redirect_to '/'
        end
    end
end
