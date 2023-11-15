require "open-uri"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts("cleaning the db...")
Booking.destroy_all
Experience.destroy_all
User.destroy_all

# users
doug = User.create!(first_name: "Doug", last_name: "Berkley", phone_number: "080-3829-9829", email: "doug@doug.com", password: "dougiscool")
yann = User.create!(first_name: "Yann", last_name: "Klein", phone_number: "080-2341-6343", email: "yann@yann.com", password: "yanniscool")
mario = User.create!(first_name: "Mario", last_name: "Paju", phone_number: "080-3829-4564", email: "mario@mario.com", password: "marioiscool")

# hosts
celso = User.create!(first_name: "Celso", last_name: "Yamashita", phone_number: "080-2352-3453", email: "celso@celso.com", password: "celsoiscool")
donald = User.create!(first_name: "Donald", last_name: "Chow", phone_number: "080-2324-4564", email: "donald@donald.com", password: "donaldiscool")
shinji = User.create!(first_name: "Shinji", last_name: "Matsudo", phone_number: "080-2352-3453", email: "shinji@shinji.com", password: "shinjiiscool")

# experiences
jousting_file = URI.open("https://upload.wikimedia.org/wikipedia/commons/d/d0/Paulus_Hector_Mair_Tjost_fig2.jpg")
jousting = Experience.create!(
  name: "Jousting",
  description: "Two brave knights charge at each other upon a horse, attempting to unmount their opponnent with a big stick.",
  price: 10_000,
  category: "Jousting",
  address: "Japan",
  host: donald
)
jousting.photo.attach(io: jousting_file, filename: "jousting.jpg", content_type: "image/jpg")
jousting.save

axe_throwing_file = URI.open("https://thevikingaxe.co.uk/wp-content/uploads/2019/09/throwing-event-images_0000_Layer-5.jpg")
axe_throwing = Experience.create!(
  name: "Axe Throwing",
  description: "Valiantly throw axes at moving targets(friends?)! Last one standing wins.",
  price: 5_000,
  category: "Vikings",
  address: "Japan",
  host: shinji
)
axe_throwing.photo.attach(io: axe_throwing_file, filename: "axe_throwing.jpg", content_type: "image/jpg")
axe_throwing.save

gladiator_file = URI.open("http://2.bp.blogspot.com/-lC1EbFA3wAQ/UfDLaTPYXzI/AAAAAAAABa8/hBPTe3GYxwc/s1600/GLDRTR+(themilitarypirate.blogspot.com).jpg")
gladiator = Experience.create!(
  name: "Gladiator",
  description: "Step into an arena of thunderous applause, where fearless gladiators clash in a spectacle of skill and valor",
  price: 7_000,
  category: "Vikings",
  address: "Japan",
  host: donald
)
gladiator.photo.attach(io: gladiator_file, filename: "gladiator.jpg", content_type: "image/jpg")
gladiator.save

kenjutsu_file = URI.open("https://sdkbudo.ch/images/sections/2_dessin.jpg")
kenjutsu = Experience.create!(
  name: "Kenjutsu",
  description: "Silent shadows on the edge of honor, samurai embody the art of disciplined strength and unwavering loyalty, where every step tells a tale written in the ink of their blades.",
  price: 9_000,
  category: "Samurai",
  address: "Japan",
  host: celso
)
kenjutsu.photo.attach(io: kenjutsu_file, filename: "kenjutsu.jpg", content_type: "image/jpg")
kenjutsu.save

ninjutsu_file = URI.open("https://idsb.tmgrup.com.tr/2014/11/17/HaberDetay/1416176743914.jpg")
ninjutsu = Experience.create!(
  name: "Ninjutsu",
  description: "In the cloak of shadows, ninjas weave a silent symphony of stealth, their movements a dance of mystery and precision, leaving behind only whispers of their enigmatic artistry.",
  price: 8_500,
  category: "Ninja",
  address: "Japan",
  host: donald
)
ninjutsu.photo.attach(io: ninjutsu_file, filename: "ninjutsu.jpg", content_type: "image/jpg")
ninjutsu.save

catapulting_file = URI.open("https://www.worldhistory.org/uploads/images/8790.jpg")
catapulting = Experience.create!(
  name: "Catapulting",
  description: "Destroy your enemies' castle walls by loading up a catapult with brick, stone, or friend! Hurtle them 200 meters across the battlefield and laugh as your foes taste defeat.",
  price: 11_500,
  category: "Knights",
  address: "Japan",
  host: shinji
)
catapulting.photo.attach(io: catapulting_file, filename: "catapulting.jpg", content_type: "image/jpg")
catapulting.save

kyudo_file = URI.open("https://thumbs.dreamstime.com/b/kyudo-29126282.jpg")
kyudo = Experience.create!(
  name: "Kyudo",
  description: "In the tranquil discipline of Kyudo, each drawn arrow becomes a meditation, and every release is a manifestation of harmony, blending the warrior's spirit with the elegance of the bow.",
  price: 6_500,
  category: "Archery",
  address: "Japan",
  host: celso
)
kyudo.photo.attach(io: kyudo_file, filename: "kyudo.jpg", content_type: "image/jpg")
kyudo.save

viking_raids_file = URI.open("https://cdn.thecollector.com/wp-content/uploads/2023/03/danes-or-vikings-in-england.jpg?width=1080&quality=70")
viking_raids = Experience.create!(
  name: "Viking Raids",
  description: "In the midst of the Viking tempest, warriors clash in a saga of steel, where the 'Nordic Storm' reveals the relentless spirit of those who sail the seas of battle.",
  price: 11_500,
  category: "Vikings",
  address: "Japan",
  host: shinji
)
viking_raids.photo.attach(io: viking_raids_file, filename: "viking_raids.jpg", content_type: "image/jpg")
viking_raids.save

duelling_file = URI.open("https://ychef.files.bbci.co.uk/976x549/p0dq9rkk.jpg")
duelling = Experience.create!(
  name: "Duel in armor",
  description: "In the duel's silent theater, blades whisper tales of skill and mettle, an eloquent dance where every strike narrates a story of courage.",
  price: 13_000,
  category: "Knights",
  address: "Japan",
  host: donald
)
duelling.photo.attach(io: duelling_file, filename: "duelling.jpg", content_type: "image/jpg")
duelling.save

excalibur_file = URI.open("https://i.pinimg.com/originals/f9/09/77/f9097744277d91cff88b94ad082cc136.jpg")
excalibur = Experience.create!(
  name: "Excalibur experience",
  description: "Dive into the Excalibur experience, where the magnetic pull of the legendary sword beckons adventurers to unearth the secrets of a mythical realm steeped in magic and lore.",
  price: 9_500,
  category: "Knights",
  address: "Japan",
  host: celso
)
excalibur.photo.attach(io: excalibur_file, filename: "excalibur.jpg", content_type: "image/jpg")
excalibur.save

assassins_file = URI.open("https://i.ytimg.com/vi/BgKODqsAG4Y/maxresdefault.jpg")
assassins = Experience.create!(
  name: "Assassin experience",
  description: "Dive into an Assassin's Creed-like experience, where history and combat converge in an immersive blend of stealth, skill, and a symphony of lethal precision.",
  price: 12_500,
  category: "Ninja",
  address: "Japan",
  host: celso
)
assassins.photo.attach(io: assassins_file, filename: "assassins.jpg", content_type: "image/jpg")
assassins.save


# bookings
booking_1 = Booking.create!(
  user: doug,
  experience: jousting,
  start_date: "2023-11-25",
  end_date: "2023-12-02",
  status: "confirmed",
  total_price: 10_000
)

booking_2 = Booking.create!(
  user: doug,
  experience: axe_throwing,
  start_date: "2023-11-14",
  end_date: "2023-11-15",
  status: "rejected",
  total_price: 5_000
)

booking_3 = Booking.create!(
  user: mario,
  experience: gladiator,
  start_date: "2023-11-15",
  end_date: "2023-11-23",
  status: "pending",
  total_price: 7_000
)
