class Locale
  include Mongoid::Document

  field :city, type: String
  field :state, type: String
  # field :coodinates

  embedded_in :complaint 

  validates :city, presence: true
  validates :state, presence: true
  validates :state, inclusion: { in: %w( AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO ), # TODO: Helper?
                                 message: "%{value} is not a valid UF"} #TODO levar para o locale

  def to_s
    "#{city}, #{state}"
  end
end
