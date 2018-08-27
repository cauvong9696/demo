10.times do |n|
  user = User.create! name: Faker::Name.name, address: Faker::Address.city
  10000.times do |m|
    Post.create! title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph,
      user: user
  end
end
