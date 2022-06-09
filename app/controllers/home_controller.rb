class HomeController < ApplicationController
  def index
    @name = current_user.present? ? current_user.first_name : 'Stranger'
  end

end
