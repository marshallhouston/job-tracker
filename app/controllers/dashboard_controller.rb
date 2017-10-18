class DashboardController < ApplicationController

  def index
    @count_of_jobs_by_level_of_interest = Job.count_of_jobs_by_level_of_interest
  end

end
