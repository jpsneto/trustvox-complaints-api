class BaseSerializer < ActiveModel::Serializer
  attributes :id, :created_at

  def id
    object._id
  end


end