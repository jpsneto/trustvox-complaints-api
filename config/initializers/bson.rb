module BSON
  class ObjectId
    alias :as_json :to_s
  end
end
# module Mongoid
#   module Document
#     def as_json(options={})
#       attrs = super(options)
#       attrs["id"] = attrs["_id"]["$oid"].to_s if attrs["_id"]
#       attrs
#     end
#   end
# end
