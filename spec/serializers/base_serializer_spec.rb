# frozen_string_literal: true
require 'rails_helper'

RSpec.describe BaseSerializer, type: :serializer do
  let(:resource) { FactoryBot.create(:complaint) }
  let(:serialized_resource) { described_class.new(resource).as_json }

  subject { serialized_resource[:base] }

  it 'has and id that matches with resource id' do
    expect(subject[:id]).to eq(resource.id)
  end

  it 'has a creted date time of the resource' do
    expect(subject[:created_at]).to eq(resource.created_at)
  end
end
