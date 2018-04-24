class HasCapacityToUpdateSizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.in_use_changed?
      value_to_add =  value - record.in_use_was
      record.errors.add(attribute, msg: "Value added exceeds disk space") if value_to_add <= record.space_available
    end
  end
end
