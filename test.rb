FactoryGirl.create(:category, name: 'Cookbooks')
FactoryGirl.create(:category, name: "Children's Books")

[
    {first_name: 'Vivian', last_name: 'Howard'},
    {first_name: 'Melissa', last_name: 'Hartwig'},
    {first_name: 'Chrissy', last_name: 'Teigen'},
    {first_name: 'Sarah', last_name: 'Owens'},
    {first_name: 'Deb', last_name: 'Perelman'},
    {first_name: 'Rutherford', last_name: 'Winn'},
    {first_name: 'Anna', last_name: 'Kang'},
    {first_name: 'Victoria', last_name: 'Jamieson'},
    {first_name: 'Sara', last_name: 'Hammel'},
    {first_name: 'Troy', last_name: 'Andrews'},
].each do |author|
  FactoryGirl.create(:author,
                     first_name: author[:first_name],
                     last_name: author[:last_name],
                     desc: FFaker::CheesyLingo.paragraph(rand(28..43)))
end

[
    {name: 'Stories and Recipes from My Corner of the South', image: Rails.root.join("public/uploads/61s777y5pDL_.jpg").open, price: 27.56, first_name: 'Vivian', last_name: 'Howard', category: 'Cookbooks'},
    {name: 'The 30-Day Guide to Total Health and Food Freedom', image: Rails.root.join('public/uploads/61ITyv1lTML_.jpg').open, price: 18.00, first_name: 'Melissa', last_name: 'Hartwig', category: 'Cookbooks'},
    {name: 'Recipes for All the Food You Want to Eat', image: Rails.root.join('public/uploads/51HGuoYiOZL_.jpg').open, price: 14.99, first_name: 'Chrissy', last_name: 'Teigen', category: 'Cookbooks'},
    {name: 'Recipes for Rustic Fermented Breads, Sweets, Savories, and More', image: Rails.root.join('public/uploads/61wlqlHA+dL_.jpg').open, price: 22.43, first_name: 'Sarah', last_name: 'Owens', category: 'Cookbooks'},
    {name: 'The Smitten Kitchen Cookbook', image: Rails.root.join('public/uploads/51Ki1zr-BLL_.jpg').open, price: 21.08, first_name: 'Deb', last_name: 'Perelman', category: 'Cookbooks'},
    {name: 'Ultimate Wine Handbook - Wine From A-Z, Wine History and Everything Wine (Wine Mastery, Wine Sommelier', image: Rails.root.join('public/uploads/51Ki1zr-BLL_.jpg').open, price: 0.99, first_name: 'Rutherford', last_name: 'Winn', category: 'Cookbooks'},
    {name: 'You Are Not Small', image: Rails.root.join('public/uploads/51-xUGTf54L_.jpg').open, price: 8.99, first_name: 'Anna', last_name: 'Kang', category: "Children's Books"},
    {name: 'Roller Girl', image: Rails.root.join('public/uploads/51VWEvDVrkL_.jpg').open, price: 7.92, first_name: 'Victoria', last_name: 'Jamieson', category: "Children's Books"},
    {name: 'The Underdogs', image: Rails.root.join('public/uploads/51K6B112r5L_.jpg').open, price: 9.65, first_name: 'Sara', last_name: 'Hammel', category: "Children's Books"},
    {name: 'Trombone Shorty', image: Rails.root.join('public/uploads/61dN4iBf4fL_.jpg').open, price: 11.88, first_name: 'Troy', last_name: 'Andrews', category: "Children's Books"},
].each do |book|
  FactoryGirl.create(:book, title: book[:name],
                     short_desc: FFaker::CheesyLingo.paragraph(rand(20..35)),
                     full_desc: FFaker::CheesyLingo.paragraph(rand(40..60)),
                     image: book[:image],
                     price: book[:price],
                     stock: rand(0..600),
                     sells: rand(0..1200),
                     authors: [Author.find_by_first_name_and_last_name(book[:first_name], book[:last_name])],
                     category: Category.find_by_name(book[:category])
  )
end

COUNTRIES ||= [
    "Ukraine",
    "United Arab Emirates",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela",
    "Yemen",
    "Zambia",
    "Zimbabwe"
]

COUNTRIES.each do |country|
  Country.create(name: country)
end

User.create(email: 'qqq@qqq.qqq', password: '123456')
bill = FactoryGirl.create(:address,
                          country: Country.find_by_name('Ukraine'),
                          first_name: 'Vasya',
                          last_name: 'Ivanov',
)
ship = FactoryGirl.create(:address,
                          country: Country.find_by_name('Ukraine'),
                          first_name: 'Vasya',
                          last_name: 'Ivanov',
)
Customer.create(first_name: 'Vasya',
                last_name: 'Ivanov',
                billing_address: bill,
                shipping_address: ship,
                user: User.find_by_email('qqq@qqq.qqq')
)

5.times do
  FactoryGirl.create(:rating,
                     customer: Customer.find_by(first_name: 'Vasya'),
                     book: Book.find_by(title: 'Stories and Recipes from My Corner of the South')
  )
end

ord = Order.create(customer: Customer.find_by_first_name('Vasya'))
[
    {book: Book.find_by(title: 'The Underdogs')}
].each do |item|
  FactoryGirl.create(:order_item, order: ord, book: item[:book], quantity: 1)
end
ord.calculate_total

[
    {company: 'New post', option: 'Ground', price: 1.5},
    {company: 'FeedEx', option: 'Two Day', price: 3},
    {company: 'DSL', option: 'One Day', price: 5}
].each do |delivery|
  Delivery.create(delivery)
end
