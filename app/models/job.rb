class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

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
    select(:level_of_interest)
      .group(:level_of_interest)
      .count
  end

end
