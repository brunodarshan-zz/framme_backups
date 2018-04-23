# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tera_16 = 16777216

drobo = Volume.create(
  name: 'DROBO',
  type_volume: 'RAID',
  in_use: 8388608,
  capacity: tera_16*4
)

raid_pauliram = Volume.create(
  name: 'RAID Pauliram',
  type_volume: 'RAID',
  in_use: 0,
  capacity: tera_16
)

raid_bruno_costa = Volume.create(
  name: 'RAID Bruno Costa',
  type_volume: 'RAID',
  in_use: 0,
  capacity: tera_16
)
