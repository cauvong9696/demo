User.create! name: Faker::Name.name, address: Faker::Address.city,
   email: "cauvong9696@gmail.com", password: "123456", password_confirmation: "123456"
10.times do |n|
  user = User.create! name: Faker::Name.name, address: Faker::Address.city,
    email: "cauvong9696-#{n+1}@gmail.com", password: "123456", password_confirmation: "123456"
  10.times do |m|
    Post.create! title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph,
      user: user
  end
end
