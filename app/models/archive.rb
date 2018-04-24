class Archive < ApplicationRecord
  belongs_to :volume
  # belongs_to :user

  before_update :include_size_to_volume
  before_create :include_size_to_volume

  validates :size, has_space_in_volume: true

  enum type_archive: [
    :video,
    :image,
    :editable
  ]

  enum environment: [
    :internal,
    :external,
    :other
  ]

  enum resolution: [
    :full_hd,
    %s{4k},
    :nome
  ]

  private
  def include_size_to_volume
      value = volume.in_use + self.size
      if volume.space_available >= self.size
        volume.update(in_use: value)
        return true
      else
        volume.errors.add(:in_use, msg: "Archive is greater than the available space on the volume.")
      end
      nil
  end

end
