class Archive < ApplicationRecord
  belongs_to :volume
  # belongs_to :user

  before_update :include_size_to_volume
  before_create :include_size_to_volume
  before_save :include_size_to_volume

  validates :size, has_space_in_volume: true
  validates :name, :size, :type_archive, :environment, :resolution, presence: true

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


  def get_size
    if self.size >= 1024
      return "#{self.size/1024} GB"
    end
    "#{self.size} MB"
  end

  def icon_class
    "fa fa-#{type_archive}"
  end

  def icon_class_medium
    "#{icon_class} fa-2x"
  end

  def icon_class_big
    "#{icon_class} fa-4x"
  end

  def get_volume
    "#{self.volume.to_s.upcase}"
  end

  private
  def include_size_to_volume
      value = volume.in_use + self.size
      # if volume.space_available >= self.size
      volume.update(in_use: value)
  end

end
