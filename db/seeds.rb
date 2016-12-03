350_000.times do |i|
  username = "#{Faker::Internet.user_name}#{i}"

  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    username:   username,
    email:      "#{username}@" + Faker::Internet.domain_name
  )
  puts "#{i.to_f/3500}% done" if i % 1000 == 0
end
