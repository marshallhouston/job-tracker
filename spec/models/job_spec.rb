require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new(title: "Fun")
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        category = Category.new(title: "Fun")
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        category = Category.new(title: "Fun")
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a category" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, company, and category" do
        company = Company.new(name: "Turing")
        category = Category.new(title: "Fun")
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      category = Category.new(title: "Fun")
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category: category)
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do
      category = Category.new(title: "Fun")
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category: category)
      expect(job).to respond_to(:category)
    end
  end

  describe "Class Methods" do
    before :each do
      company = Company.new(name: "Turing")
      category = Category.new(title: "Fun")
      @job1 = Job.create!(title: "Software", level_of_interest: 60, city: "Boulder", description: "Wahooo", company: company, category: category)
      @job2 = Job.create!(title: "Sports", level_of_interest: 70, city: "Denver", description: "Wahooo", company: company, category: category)
      @job3 = Job.create!(title: "Sports", level_of_interest: 10, city: "Fort Collins", description: "Wahooo", company: company, category: category)
    end

    it '#sort_by_location' do
      sorted = Job.sort_by_location
      expect(sorted.first.city).to eq(@job1.city)
      expect(sorted.last.city).to eq(@job3.city)
    end

    it '#sort_by_level_of_interest' do
      sorted = Job.sort_by_level_of_interest
      expect(sorted.first.level_of_interest).to eq(@job2.level_of_interest)
      expect(sorted.last.level_of_interest).to eq(@job3.level_of_interest)
    end

  end
end
