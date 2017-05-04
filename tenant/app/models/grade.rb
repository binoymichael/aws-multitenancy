class Grade
  include Virtus.model

  attribute :scale, String
  attribute :comments, String

  def description
    ["Scale: #{scale}", "Comments: #{comments}"].join(",\n")
  end
end

class GradeType < ActiveRecord::Type::Value
  def deserialize(value)
    decoded = ActiveSupport::JSON.decode(value)
    Grade.new(decoded)
  end

  def changed_in_place?(raw_old_value, new_value)
    serialize(new_value) != raw_old_value
  end

  def serialize(value)
    value.to_json
  end
end

