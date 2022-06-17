class CalendarController < ApplicationController
    
    def index
        @tasks = Task.where "user_id = ?", current_user.id
        @tasks_today = @tasks.where "deadline = ?", Date.current
    end
end


