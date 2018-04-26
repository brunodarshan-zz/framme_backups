# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)


drobo = Volume.create!(
  name: 'DROBO',
  type_volume: 'RAID',
  capacity: 32000000
)
puts "ok #{drobo}"

owc_bruno = Volume.create!(
  name: 'owc_bruno',
  type_volume: 'RAID',
  capacity: 16000000
)
puts "ok #{owc_bruno}"
hd_1_bruno = Volume.create!(
  name: 'HD 1 Bruno Costa',
  type_volume: :HD,
  capacity:4000000
)
puts "ok #{hd_1_bruno}"
hd_2_bruno = Volume.create!(
  name: 'HD 2 Bruno Costa',
  type_volume: :HD,
  capacity: 40000000
)

puts "ok #{hd_2_bruno}"
owc_pauliram = Volume.create!(
  name: 'owc_pauliram',
  type_volume: 'RAID',
  capacity: 16000000
)
puts "ok #{owc_pauliram}"
hd_quaresma = Volume.create!(
  name: 'Hd Quaresma',
  type_volume: :HD,
  capacity: 6000000
)
puts "ok #{hd_quaresma}"
raid_ilha_color = Volume.create!(
  name: 'ilha color',
  type_volume: :RAID,
  capacity: 8000000
)
puts "ok #{raid_ilha_color}"
