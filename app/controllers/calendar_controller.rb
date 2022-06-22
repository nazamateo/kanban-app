class CalendarController < ApplicationController
    
    def index
        @tasks = Task.where "user_id = ?", current_user.id
        @tasks_today = @tasks.where "deadline = ?", Date.current
        @tasks_tomorrow = @tasks.where "deadline = ?", Date.tomorrow


        @tasks_this_week = @tasks.where "deadline = ?", Date.today.beginning_of_week...Date.today.end_of_week

        @tasks_this_month = @tasks.where "deadline = ?",Date.today.beginning_of_month...Date.today.end_of_month
    end
end


