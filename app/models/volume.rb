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



  def get_capacity
    out_put = self.capacity * 1024
    if out_put > 1023  ## verifica se é maior  que 1 GB
      if out_put >= (1024**3) ## verifica se e maior igual que 1 TB
        return  "#{ out_put / 1024**3  } TB"
      end
      return "#{ out_put } GB"
    end
    "#{ out_put } MB"
  end

  def space_available
    capacity - in_use
  end

  def to_s
    self.name
  end

end
