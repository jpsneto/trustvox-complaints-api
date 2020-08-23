require 'rails_helper'

RSpec.describe ComplaintSerializer, type: :serializer do 
  let(:complaint) { FactoryBot.create(:complaint) }
  let(:serialized_complaint) { described_class.new(complaint).as_json }

  subject { serialized_complaint[:complaint] }

  it 'has a title that matches with the complaint title' do
    expect(subject[:title]).to eq(complaint.title)
  end

  it 'has a description that matches with the complaint description' do
    expect(subject[:description]).to eq(complaint.description)
  end

  it 'has a company that matches with the complaint company' do
    expect(subject[:company]).to eq(complaint.company)
  end

  it 'has a city in locale that matches with the locale city' do
    expect(subject[:locale][:city]).to eq(complaint.locale.city)
  end

  it 'has a state in locale that matches with the locale state' do
    expect(subject[:locale][:state]).to eq(complaint.locale.state)
  end

end