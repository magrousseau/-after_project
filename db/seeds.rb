# -------------------------- FIRST SEED -------------------------

puts "> Deleting all records..."

# EventUser.destroy_all
# Event.destroy_all
# Friendship.destroy_all
# # User.avatar.attach.destroy_all
# User.destroy_all

# ---------------------------------------

#Groupes

#skeasy
puts "> Creating users..."

magali = User.new(first_name: 'Magali', last_name: 'Rousseau', email: "magali@gmail.com", password: "123456")

file = URI.open("app/assets/images/magali.jpg")
magali.avatar.attach(io: file, filename: "avatar", content_type: "image/jpg")
magali.save!

puts "#{magali.first_name} created!"


