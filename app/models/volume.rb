class Volume < ApplicationRecord
  belongs_to :user
  has_many :archives

  enum type_volume: [
    :RAID,
    :HD,
    :FITA
  ]

  validates :name, :type_volume, :capacity, presence: true

  def get_capacity
    if (self.capacity / 1024 ) >= 1024
      return "#{self.capacity / 1024 / 1024} TB"
    end
    "#{self.capacity / 1024} Gb"
  end

  def space_available
    capacity - in_use
  end

  def in_use
    archives.sum(:size)
  end

  def get_icon
    if type_volume == 'RAID'
      return "fa fa-server"
    end
    return "fa fa-hdd"
  end

  def get_icon_medium
    "#{get_icon} fa-2x"
  end
end
