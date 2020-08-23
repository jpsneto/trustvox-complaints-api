require 'rails_helper'

RSpec.describe Locale, type: :model do

  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_inclusion_of(:state).to_allow("AC", "AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RJ","RN","RS","RO","RR","SC","SP","SE","TO" ) }
  
  it { is_expected.to be_embedded_in(:complaint)}

  
  
  # subject {
  #   described_class.new(city: "Ilhéus", state: "BA")
  # }  

  # describe "Validations" do
  #   it "is valid with attributes" do
  #     expect(subject).to be_valid
  #   end

  #   it "is not valid without city" do 
  #     subject.city = nil
  #     expect(subject).to_not be_valid
  #   end

  #   it "is not valid without state" do
  #     subject.state = nil
  #     expect(subject).to_not be_valid
  #   end

  # end

  # describe "Associations" do
  #   it { should belong_to(:complaint).without_validating_presence }
  # end


end
