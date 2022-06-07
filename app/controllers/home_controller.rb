class HomeController < ApplicationController
  def index
    @name = current_user.present? ? current_user.email : 'Stranger'
  end
end
