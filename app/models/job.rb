class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.sort_by_location
    group(:id)
    .order(:city)
  end
end
