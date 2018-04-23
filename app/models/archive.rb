class Archive < ApplicationRecord
  belongs_to :volume
  
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

  def volume
    if volume_id
      return Volume.find(volume_id)
    end
    0
  end
end
