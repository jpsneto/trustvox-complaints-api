require 'rails_helper'

RSpec.describe Complaint, type: :model do
  
  it "has a valid factory" do
    expect(build(:complaint)).to be_valid
  end
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:company) }

    it "is invalid with a invalid locale" do 
      complaint = build(:complaint, :with_invalid_locale)
      complaint.valid?
      expect(complaint.errors[:locale].size).to eq(1)
    end
  end
  
  describe 'associations' do
    it { is_expected.to embed_one :locale }
  end

  









  # subject { described_class.new(title: "Internet Caindo",
  #                               description: "A internet cai todos os dias",
  #                               company: "OlaNet",
  #                               locale: {
  #                                 city: "Ilhéus",
  #                                 state: "Bahia"
  #                               })
  # } 
  
  

  # it "is valid with attributes" do
  #   expect(subject).to be_valid
  # end

  # it "is not valid whitout a title" do
  #   subject.title = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid whitout a description" do 
  #   subject.description = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid whitout a company" do 
  #   subject.company = nil
  #   expect(subject).to_not be_valid
  # end

  # it { is_expected.to embed_one :locale }

  
end
