require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid contacts"
      it "is invalid without a name" do
        company = Company.new(name: "Turing")
        contact = Contact.new(position: "Visionary",
                              email: "kl@gmail.com",
                              company: company)

        expect(contact).to_not be_valid
      end

      it "is invalid without a position" do
        company = Company.new(name: "Turing")
        contact = Contact.new(name: "Kelsey Longmuir",
                              email: "kl@gmail.com",
                              company: company)

        expect(contact).to_not be_valid
      end

      it "is invalid without an email" do
        company = Company.new(name: "Turing")
        contact = Contact.new(name: "Kelsey Longmuir",
                              position: "Visionary",
                              company: company)

        expect(contact).to_not be_valid
      end

      it "is invalid without a company" do
        contact = Contact.new(name: "Kelsey Longmuir",
                              position: "Visionary",
                              email: "kl@gmail.com")

        expect(contact).to_not be_valid
      end

    context "valid contacts"
      it "is valid with name, position, email, and company" do
        company = Company.new(name: "Turing")
        contact = Contact.new(name: "Kelsey Longmuir",
                              position: "Visionary",
                              email: "kl@gmail.com",
                              company: company)

        expect(contact).to be_valid
      end
  end

  describe "relationships" do
    it "responds to company" do
      company = Company.new(name: "Turing")
      contact = Contact.new(name: "Kelsey Longmuir",
                            position: "Visionary",
                            email: "kl@gmail.com",
                            company: company)

      expect(contact).to respond_to(:company)
    end
  end
end
