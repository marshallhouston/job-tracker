class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_companies_by_avg_level_of_interest
    joins(:jobs)
    .select('avg(jobs.level_of_interest) as average_interest_level, companies.*')
    .group(:id)
    .order('avg(jobs.level_of_interest) desc')
    .limit(3)
  end

  def average_interest_level
    jobs.average(:level_of_interest)
  end

end
