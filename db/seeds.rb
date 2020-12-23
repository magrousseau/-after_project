# -------------------------- FIRST SEED -------------------------


puts "> Deleting all records..."

BlogArticle.destroy_all
User.destroy_all
# Friendship.destroy_all
# # User.avatar.attach.destroy_all
# User.destroy_all

# ---------------------------------------

#Users

#magali

puts "> Creating users..."

magali = User.new(first_name: 'Magali', last_name: 'Rousseau', email: "magali@gmail.com", password: "123456")

file = URI.open("app/assets/images/magali.jpg")
magali.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
magali.save!

puts "#{magali.first_name} created!"

#Blog Articles
require 'faker'

puts "> Creating blog articles..."

10.times do
  article = BlogArticle.new(
    title: Faker::Books::CultureSeries.book,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    content: Faker::Lorem.paragraphs(number: 8),
    date: DateTime.now,
    user: magali
  )
  3.times do
    file = URI.open("https://source.unsplash.com/random")
    article.photos.attach(io: file, filename: "photo", content_type: "image/jpg")
  end
  article.save!
end

puts "articles created !"


