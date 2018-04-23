class Volume < ApplicationRecord
  has_many :archives

  enum type_volume: [
    :HD,
    :FITA,
    :RAID
  ]

  validates :name, :type_volume, :in_use, :capacity, presence: true

  def space_available
    capacity - in_use
  end

  def to_s
    "#{name.upcase}"
  end
end
