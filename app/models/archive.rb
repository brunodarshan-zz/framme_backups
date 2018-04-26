class Archive < ApplicationRecord
  belongs_to :volume

  enum type_archive: [
    :video,
    :photo,
    :edit
  ]

  enum resolution: [
    %s{360p},
    %s{480p},
    %s{HD},
    %s{FULL HD}
  ]

  enum environment: [
    :any,
    :internal,
    :external
  ]


  validates :name, :size, :type_archive, :directory, :volume_id, presence: true
end
