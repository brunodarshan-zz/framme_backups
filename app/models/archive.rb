class Archive < ApplicationRecord
  belongs_to :volume
  belongs_to :user

  before_save :include_size_to_volume

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
    volume.in_use += self.size if volume.space_available >= self.size
    volume.save
  end

end
