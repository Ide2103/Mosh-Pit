# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "b@b",
  password:  "bbbbbbbb",
)

Tag.create([
  {name: '＃SHISHAMO：5大ドームツアー' },
  {name: '＃Hump Back：僕らの夢は止まらないツアー'},
  {name: '＃WANIMA：Catch Up TOUR'},
  {name: '＃ONE OK ROCK：AMBITIONS JAPAN DOME TOUR' },
  {name: '＃SiM：SiM TOUR 2022"BEWARE"' },
  {name: '＃ROCK IN JAPAN FESTIVAL 2022' },
  {name: '＃COUNTDOWN JAPAN' },
  {name: '＃JAPAN JAM 2022' },
  {name: '＃METROCK 2022' },
  {name: '＃SWEET LOVE SHOWER 2022' },
  {name: '＃RISING SUN ROCK FESTIVAL' },
  ])
