class Volume < ApplicationRecord
  has_many :archives

  enum type_volume: [
    :HD,
    :FITA,
    :RAID
  ]

  validates :name, :type_volume, :in_use, :capacity, presence: true
  validates :in_use, less_than_capacity: true
  validates :in_use, has_capacity_to_update_size: true, on: :update

  def space_available
    capacity - in_use
  end

  def to_s
    "#{name.upcase}"
  end

end
