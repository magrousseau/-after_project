# -------------------------- FIRST SEED -------------------------

puts "> Deleting all records..."

BlogArticle.destroy_all
User.destroy_all
Guest.destroy_all
Podcast.destroy_all
# User.destroy_all

# ---------------------------------------

#Users

#magali

puts "> Creating users..."

magali = User.new(first_name: 'Magali', last_name: 'Rousseau', email: "magali@gmail.com", password: "123456")
file = URI.open("app/assets/images/profile/magali.jpg")
magali.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
magali.save!
puts "#{magali.first_name} created!"

coralie = User.new(first_name: 'Coralie', last_name: 'Dobral', email: "coralie@gmail.com", password: "123456")
file = URI.open("app/assets/images/profile/coralie.jpg")
coralie.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
coralie.save!
puts "#{coralie.first_name} created!"

aleks = User.new(first_name: 'Aleks', last_name: 'Putra', email: "aleks@gmail.com", password: "123456")
file = URI.open("app/assets/images/profile/Aleks.jpg")
aleks.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
aleks.save!
puts "#{aleks.first_name} created!"

#Blog Articles
require 'faker'

puts "> Creating blog articles..."

5.times do
  article = BlogArticle.new(
    title: Faker::Books::CultureSeries.book,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    content: Faker::Lorem.paragraphs(number: 8),
    date: DateTime.now,
    user: User.find(User.pluck(:id).sample),
    tag_list: ["bien-être", "santé", "performance", "entreprises", "conseils"].sample(3)
  )
  puts "#{article.title} created!"
  3.times do
    file = URI.open("https://unsplash.com/photos/Ag7hgk0NLnE")
    article.photos.attach(io: file, filename: "photo", content_type: "image/jpg")
  end
  article.save!
end

puts "articles created !"

puts "> Creating podcasts..."

podcast_1 = Podcast.new(
        title: Faker::Books::CultureSeries.book,
        small_description: Faker::TvShows::BigBangTheory.quote,
        podcast_number: '1',
        description: Faker::Lorem.paragraphs(number: 8),
        link: "10-lauriane-lamperim-reconversion-dans-le-surf-la-vie/id1571032435?i=1000551845453",
        date: DateTime.now - 5
      )
podcast_1.save!

podcast_2 = Podcast.new(
        title: Faker::Books::CultureSeries.book,
        small_description: Faker::TvShows::BigBangTheory.quote,
        podcast_number: '2',
        description: Faker::Lorem.paragraphs(number: 8),
        link: "8-maxine-eouzan-vivre-de-défi-en-défi-mais-dans/id1571032435?i=1000542168899",
        date: DateTime.now - 4
      )
podcast_2.save!

podcast_3 = Podcast.new(
        title: Faker::Books::CultureSeries.book,
        small_description: Faker::TvShows::BigBangTheory.quote,
        podcast_number: '3',
        description: Faker::Lorem.paragraphs(number: 8),
        link: "7-laure-larrory-dun-rêve-à-lautre-comment-rebondir/id1571032435?i=1000537069410",
        date: DateTime.now - 3
      )
podcast_3.save!

podcast_4 = Podcast.new(
        title: Faker::Books::CultureSeries.book,
        small_description: Faker::TvShows::BigBangTheory.quote,
        podcast_number: '4',
        description: Faker::Lorem.paragraphs(number: 8),
        link: '6-alain-bernard-de-la-médaille-dor-olympique-à-sa/id1571032435?i=1000531162873',
        date: DateTime.now - 2
      )
podcast_4.save!

podcast_5 = Podcast.new(
        title: Faker::Books::CultureSeries.book,
        small_description: Faker::TvShows::BigBangTheory.quote,
        podcast_number: '5',
        description: Faker::Lorem.paragraphs(number: 8),
        link: "5-amaury-leveaux-vivre-sa-vie-comme-une-course-de-natation/id1571032435?i=1000529881139",
        date: DateTime.now
      )
podcast_5.save!

puts "> Creating guests..."

yannick = Guest.new(first_name: 'Yannick', last_name: 'Noah', podcast_id: podcast_1.id)
file = URI.open("https://static1.purepeople.com/articles/0/31/69/40/@/4489916-exclusif-yannick-noah-enregistrement-624x600-2.jpg")
yannick.photo.attach(io: file, filename: "photo", content_type: "image/jpg")
yannick.save!

puts "> Creating stephane"

stephane = Guest.new(first_name: 'Stephane', last_name: 'Caron', podcast_id: podcast_2.id)
file = URI.open("https://cdn.euromoney.psdops.com/04/1b/1c7fe515f66ec616a02d4317a26a/stephan-caron-160x186.jpg")
stephane.photo.attach(io: file, filename: "photo", content_type: "image/jpg")
stephane.save!

puts "> Creating zizou"

zizou = Guest.new(first_name: 'Zinedine', last_name: 'Zidane', podcast_id: podcast_3.id)
file = URI.open("https://img.bfmtv.com/c/1256/708/90154/08b068204bbc773b6b7e4cb9466.jpeg")
zizou.photo.attach(io: file, filename: "photo", content_type: "image/jpg")
zizou.save!

puts "> Creating tony"

tony = Guest.new(first_name: 'Tony', last_name: 'Parker', podcast_id: podcast_4.id)
file = URI.open("https://s.france24.com/media/display/eba620ec-1614-11e9-9935-005056bff430/w:1280/p:4x3/20081106-tonyparker-m.jpg")
tony.photo.attach(io: file, filename: "photo", content_type: "image/jpg")
tony.save!

roxana = Guest.new(first_name: 'Roxana', last_name: 'Maracineanu', podcast_id: podcast_5.id)
file = URI.open("https://cdn-s-www.lalsace.fr/images/CDC9CDAF-41BC-49E1-B33D-B29654325748/NW_raw/roxana-maracineanu-a-conserve-sa-place-dans-le-gouvernement-du-nouveau-premier-ministre-jean-castex-elle-devient-ministre-deleguee-aux-sports-rattachee-a-l-education-nationale-photo-afp-ludovic-marin-1596536544.jpg")
roxana.photo.attach(io: file, filename: "photo", content_type: "image/jpg")
roxana.save!


puts "guests created !"
