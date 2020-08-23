class Complaint
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :company, type: String

  embeds_one :locale
  accepts_nested_attributes_for :locale

  validates :title, presence: true
  validates :description, presence: true
  validates :company, presence: true


  # def as_json(options)
  #   super({ only: %i[_id title description company locale city state] }).merge(options)   
  # end

end
