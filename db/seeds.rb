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

users = User.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password', icon_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/15294.png"), filename:"15294.png")},
    {email: 'james@test.com', name: 'James', password: 'password', icon_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/15294 (2).png"), filename:"15294 (2).png")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password', icon_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/15294 (1).png"), filename:"15294 (1).png")}
  ]
)

Post.create!(
  [
    {post: '明日はフェスです', user_id: users[0].id },
    {post: 'やっぱりバンドはかっこいい！', user_id: users[1].id },
    {post: 'パンクロック好きにはオススメ！', user_id: users[2].id }
  ]
)