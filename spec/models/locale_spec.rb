# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Locale, type: :model do
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_inclusion_of(:state).to_allow(%w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO]) }
  it { is_expected.to be_embedded_in(:complaint) }

  it "to_s method returns 'City, State'" do
    locale = build(:locale, city: "Ilheus", state: 'BA')
    expect(locale.to_s).to eq("Ilheus, BA")
  end
end
