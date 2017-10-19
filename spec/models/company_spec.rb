require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end

  describe "Class Methods" do
    it '.top_companies_by_avg_level_of_interest' do
      company1 = Company.new(name: "Turing")
      company2 = Company.new(name: "Blah")
      company3 = Company.new(name: "B")
      company4 = Company.new(name: "C")
      category = Category.new(title: "Fun")
      Job.create!(title: "Software", level_of_interest: 60, city: "Boulder", description: "Wahooo", company: company1, category: category)
      Job.create!(title: "Sports", level_of_interest: 70, city: "Denver", description: "Wahooo", company: company2, category: category)
      Job.create!(title: "Sports", level_of_interest: 10, city: "Fort Collins", description: "Wahooo", company: company3, category: category)
      Job.create!(title: "Software", level_of_interest: 60, city: "Boulder", description: "Wahooo", company: company4, category: category)

      collection = Company.top_companies_by_avg_level_of_interest

      expect(collection).to include(company1)
      expect(collection).to include(company2)
      expect(collection).to include(company4)
      expect(collection).to_not include(company3)
    end
  end

  describe "Instance Methods" do
    it '#average_interest_level' do
      company1 = Company.new(name: "Turing")
      category = Category.new(title: "Fun")
      Job.create!(title: "Software", level_of_interest: 60, city: "Boulder", description: "Wahooo", company: company1, category: category)
      Job.create!(title: "Sports", level_of_interest: 70, city: "Denver", description: "Wahooo", company: company1, category: category)

      expect(company1.average_interest_level).to eq(65)
    end
  end

end
