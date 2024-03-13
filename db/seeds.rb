if (cnt = Customer.count) < 350_000
  (Customer.pluck(:id).max...1_500_000).each do |i|
    username = "#{Faker::Internet.username}#{i}"
    # first_name, last_name, _ = Faker::Name.name.split(' ')

    Customer.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      username: username,
      email: "#{username}@#{Faker::Internet.domain_name}"
    )

    print '.' if i % 10000 == 0
  end

  puts
else
  puts "There are enough customers in the system (#{cnt})"
end
