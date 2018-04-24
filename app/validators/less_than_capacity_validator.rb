class LessThanCapacityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, msg: "Can not be bigger than capacity.") unless  value <= record.capacity
  end
end
