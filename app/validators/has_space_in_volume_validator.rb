class HasSpaceInVolumeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, msg: "Has no space on the volume named #{ record.volume }") if (value > record.volume.space_available)
  end
end
