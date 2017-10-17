require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid comments" do
      it "is invalid wiithout content" do
        company = Company.new(name: "Turing")
        category = Category.new(title: "Fun")
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 40, city: "Denver", company: company, category: category)
        comment = Comment.new(job: job)

        expect(comment).to_not be_valid
      end

      it "is invalid without a job_id" do
        comment = Comment.new(content: "best job ever")

        expect(comment).to_not be_valid
      end
    end

    context "valid comments" do
      it "is valid with content, job_id, and timestamps" do
        company = Company.new(name: "Turing")
        category = Category.new(title: "Fun")
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 40, city: "Denver", company: company, category: category)
        comment = Comment.new(content: "best job ever", job: job)

        expect(comment).to be_valid
        expect(comment).to respond_to(:created_at)
        expect(comment).to respond_to(:updated_at)
      end
    end
  end

  describe "relationships" do
    it "responds to job" do
      company = Company.new(name: "Turing")
      category = Category.new(title: "Fun")
      job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 40, city: "Denver", company: company, category: category)
      comment = Comment.new(content: "best job ever", job: job)

      expect(comment).to respond_to(:job)
    end
  end
end
