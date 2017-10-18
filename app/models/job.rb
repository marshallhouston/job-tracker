class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.filter_by_query(params)
    if params[:sort]
      sort_by(params)
    elsif params[:location]
      Job.where(city: params[:location])
    end
  end

  def self.sort_by(params)
    if params[:sort] == "location"
      sort_by_location
    elsif params[:sort] == "interest"
      sort_by_level_of_interest
    end
  end

  def self.sort_by_location
    group(:id)
    .order(:city)
  end

  def self.sort_by_level_of_interest
    group(:id)
    .order('level_of_interest DESC')
  end

  def self.count_of_jobs_by_level_of_interest
    group(:level_of_interest)
    .order('level_of_interest DESC')
    .count
  end

  def self.count_of_jobs_by_location
    group(:city)
    .order('city DESC')
    .count
  end
end
