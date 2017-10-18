class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def sort_by(params)
    if params[:sort] = :location
      sort_by_location
    elsif params[:sort] = :level_of_interest
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

  #pass sort into this model. if params[:sort] = :location, a
end
