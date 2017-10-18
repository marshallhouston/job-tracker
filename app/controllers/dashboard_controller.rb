class DashboardController < ApplicationController

  def index
    @number_of_jobs_by_level_of_interest = Job.count_of_jobs_by_level_of_interest
    @top_companies_by_avg_level_of_interest = Company.top_companies_by_avg_level_of_interest
    @number_of_jobs_by_city = Job.count_of_jobs_by_location
  end

end
