# frozen_string_literal: true
class Complaint
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search

  field :title, type: String
  field :description, type: String
  field :company, type: String

  embeds_one :locale
  accepts_nested_attributes_for :locale

  validates :title, presence: true
  validates :description, presence: true
  validates :company, presence: true

  search_in :title, :description, :company, locale: [:city, :state]
end
