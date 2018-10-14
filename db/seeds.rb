# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

josh = User.create(email: "josh@test.com", name: "Josh", password: "password", admin: true)
ellie = User.create(email: "ellie@test.com", name: "Ellie", password: "password")
cammy = User.create(email: "cammy@test.com", name: "Cammy", password: "password")

tacos = Recipe.new(user: ellie, title: "Delicious Tacos", description: "Hey guys, you gotta get back in there and finish the dance. Yeah I know, If you put your mind to it you could accomplish anything. I guarantee it.")

Ingredient.create(name: "corn tortilla") # id: 1
tacos.recipe_ingredients.new(quantity: "3", unit: "tortilla", ingredient_id: "1")

Ingredient.create(name: "salsa") # id: 2
tacos.recipe_ingredients.new(quantity: "5", unit: "tbsp", ingredient_id: "2")

Ingredient.create(name: "steak") # id: 3
tacos.recipe_ingredients.new(quantity: "10", unit: "ounces", ingredient_id: "3")

Ingredient.create(name: "cheese") # id: 4
tacos.recipe_ingredients.new(quantity: "3", unit: "ounces", ingredient_id: "4")

Ingredient.create(name: "avocado") # id: 5
tacos.recipe_ingredients.new(quantity: "8", unit: "ounces", ingredient_id: "5")

tacos.image.attach(io: File.open("#{Rails.root}/public/images/tacos.jpg"), filename: "tacos.jpg", content_type: "image/jpg")

tacos.directions.new(step: "This is some filler data for step 1. Usually you would gather ingredients here.")
tacos.directions.new(step: "This is some filler data for step 2. Put all of your ingredients in to something large, and start stirring.")
tacos.directions.new(step: "This is some filler data for step 3. Cook your mixture, or maybe you just feel like eating it raw. Do what you feel! Eat, and enjoy!")

c = ellie.comments.new(body: "I love these tacos!!")
tacos.comments << c

c = josh.comments.new(body: "I made these the other day - delicious!")
tacos.comments << c

c = ellie.comments.new(body: "Glad you liked them!")
tacos.comments << c

c = cammy.comments.new(body: "Any leftovers? ;) ")
tacos.comments << c

tacos.save






bean_salad = Recipe.new(user: ellie, title: "Best Bean Salad", description: "Hey guys, you gotta get back in there and finish the dance. Yeah I know, If you put your mind to it you could accomplish anything. I guarantee it.")

Ingredient.create(name: "edamame beans") # id: 6
bean_salad.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "6")

Ingredient.create(name: "kidney beans") # id: 7
bean_salad.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "7")

Ingredient.create(name: "garbanzo beans") # id: 8
bean_salad.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "8")

Ingredient.create(name: "onion") # id: 9
bean_salad.recipe_ingredients.new(quantity: ".5", unit: "onion", ingredient_id: "9")

bean_salad.image.attach(io: File.open("#{Rails.root}/public/images/bean_salad.jpg"), filename: "bean_salad.jpg", content_type: "image/jpg")

bean_salad.directions.new(step: "This is some filler data for step 1. Usually you would gather ingredients here.")
bean_salad.directions.new(step: "This is some filler data for step 2. Put all of your ingredients in to something large, and start stirring.")
bean_salad.directions.new(step: "This is some filler data for step 3. Cook your mixture, or maybe you just feel like eating it raw. Do what you feel! Eat, and enjoy!")

c = ellie.comments.new(body: "This is so good!!")
bean_salad.comments << c

c = cammy.comments.new(body: "My favorite! It took no time at all to make. ")
bean_salad.comments << c

bean_salad.save







chili = Recipe.new(user: cammy, title: "Charming Chili", description: "Hey guys, you gotta get back in there and finish the dance. Yeah I know, If you put your mind to it you could accomplish anything. I guarantee it.")

Ingredient.create(name: "ground beef") # id: 10
chili.recipe_ingredients.new(quantity: "2", unit: "cups", ingredient_id: "10")

chili.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "7") # kidney beans

chili.recipe_ingredients.new(quantity: "1", unit: "onion", ingredient_id: "9") # onion

Ingredient.create(name: "chili powder") # id: 11
chili.recipe_ingredients.new(quantity: "2", unit: "tsp", ingredient_id: "11")

Ingredient.create(name: "tomato sauce") # id: 12
chili.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "12")

chili.image.attach(io: File.open("#{Rails.root}/public/images/chili.jpg"), filename: "chili.jpg", content_type: "image/jpg")

chili.directions.new(step: "This is some filler data for step 1. Usually you would gather ingredients here.")
chili.directions.new(step: "This is some filler data for step 2. Put all of your ingredients in to something large, and start stirring.")
chili.directions.new(step: "This is some filler data for step 3. Cook your mixture, or maybe you just feel like eating it raw. Do what you feel! Eat, and enjoy!")

c = ellie.comments.new(body: "Killer chili!!")
chili.comments << c

c = josh.comments.new(body: "I actually didn't like this too much...")
chili.comments << c

c = ellie.comments.new(body: "Aww that's too bad. Maybe it's too spicy?")
chili.comments << c

c = josh.comments.new(body: "Yeah it was really hot!")
chili.comments << c

c = cammy.comments.new(body: "I had this for breakfast. LOVE IT! ")
chili.comments << c

chili.save








pancakes = Recipe.new(user: josh, title: "Delicious Tacos", description: "Hey guys, you gotta get back in there and finish the dance. Yeah I know, If you put your mind to it you could accomplish anything. I guarantee it.")

Ingredient.create(name: "flour") # id: 13
pancakes.recipe_ingredients.new(quantity: "2", unit: "cups", ingredient_id: "13")

Ingredient.create(name: "water") # id: 14
pancakes.recipe_ingredients.new(quantity: "3", unit: "cups", ingredient_id: "14")

Ingredient.create(name: "baking powder") # id: 15
pancakes.recipe_ingredients.new(quantity: "2", unit: "tbsp", ingredient_id: "15")

Ingredient.create(name: "maples syrup") # id 16
pancakes.recipe_ingredients.new(quantity: ".5", unit: "cup", ingredient_id: "16")

Ingredient.create(name: "milk") # id: 17
pancakes.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "17")

pancakes.image.attach(io: File.open("#{Rails.root}/public/images/pancakes.jpg"), filename: "pancakes.jpg", content_type: "image/jpg")

pancakes.directions.new(step: "This is some filler data for step 1. Usually you would gather ingredients here.")
pancakes.directions.new(step: "This is some filler data for step 2. Put all of your ingredients in to something large, and start stirring.")
pancakes.directions.new(step: "This is some filler data for step 3. Cook your mixture, or maybe you just feel like eating it raw. Do what you feel! Eat, and enjoy!")

c = ellie.comments.new(body: "Best pancakes ever!!")
pancakes.comments << c

c = josh.comments.new(body: "I really loved these pancakes. Super fluffy.")
pancakes.comments << c

c = ellie.comments.new(body: "Yes and super tasty! I added some berries to mine.")
pancakes.comments << c

c = ellie.comments.new(body: "... and maybe some chocolate...")
pancakes.comments << c

c = cammy.comments.new(body: "Yum yum yum yum! ")
pancakes.comments << c

pancakes.save









smoothie = Recipe.new(user: ellie, title: "World's Best Smoothie", description: "Hey guys, you gotta get back in there and finish the dance. Yeah I know, If you put your mind to it you could accomplish anything. I guarantee it.")

Ingredient.create(name: "banana") # id: 18
smoothie.recipe_ingredients.new(quantity: "1", unit: "banana", ingredient_id: "18")

Ingredient.create(name: "strawberries") # id: 19
smoothie.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "19")

smoothie.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "18") # milk

Ingredient.create(name: "orange juice") # id: 20
smoothie.recipe_ingredients.new(quantity: ".5", unit: "cup", ingredient_id: "20")

Ingredient.create(name: "ice") # id: 21
smoothie.recipe_ingredients.new(quantity: ".5", unit: "cup", ingredient_id: "21")

Ingredient.create(name: "honey") # id: 22
smoothie.recipe_ingredients.new(quantity: "3", unit: "tbsp", ingredient_id: "22")

smoothie.image.attach(io: File.open("#{Rails.root}/public/images/smoothie.jpg"), filename: "smoothie.jpg", content_type: "image/jpg")

smoothie.directions.new(step: "This is some filler data for step 1. Usually you would gather ingredients here.")
smoothie.directions.new(step: "This is some filler data for step 2. Put all of your ingredients in to something large, and start stirring.")
smoothie.directions.new(step: "This is some filler data for step 3. Cook your mixture, or maybe you just feel like eating it raw. Do what you feel! Eat, and enjoy!")

c = ellie.comments.new(body: "Perfect on a hot, sunny day!")
smoothie.comments << c

c = josh.comments.new(body: "I made this the other day - delicious!")
smoothie.comments << c

c = ellie.comments.new(body: "Glad you liked it!")
smoothie.comments << c

c = cammy.comments.new(body: "Any leftovers? ;) ")
smoothie.comments << c

c = cammy.comments.new(body: "I wish I could make this every day!")
smoothie.comments << c

c = ellie.comments.new(body: "Me too!")
smoothie.comments << c

c = ellie.comments.new(body: "Let's make this for lunch!")
smoothie.comments << c

smoothie.save










veggie_bowl = Recipe.new(user: ellie, title: "Vibrant Veggie Bowl", description: "Hey guys, you gotta get back in there and finish the dance. Yeah I know, If you put your mind to it you could accomplish anything. I guarantee it.")

veggie_bowl.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "8") # garbanzo beans

veggie_bowl.recipe_ingredients.new(quantity: ".25", unit: "onion", ingredient_id: "9") # onion

Ingredient.create(name: "sweet potatoe") # id: 23
veggie_bowl.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "23")

Ingredient.create(name: "rice") # id: 24
veggie_bowl.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "24")

Ingredient.create(name: "spinach") # id: 25
veggie_bowl.recipe_ingredients.new(quantity: "1", unit: "cup", ingredient_id: "25")

veggie_bowl.image.attach(io: File.open("#{Rails.root}/public/images/veggie_bowl.jpg"), filename: "veggie_bowl.jpg", content_type: "image/jpg")

veggie_bowl.directions.new(step: "This is some filler data for step 1. Usually you would gather ingredients here.")
veggie_bowl.directions.new(step: "This is some filler data for step 2. Put all of your ingredients in to something large, and start stirring.")
veggie_bowl.directions.new(step: "This is some filler data for step 3. Cook your mixture, or maybe you just feel like eating it raw. Do what you feel! Eat, and enjoy!")

c = ellie.comments.new(body: "So good!!")
veggie_bowl.comments << c

c = josh.comments.new(body: "Very healthy! And delicious!")
veggie_bowl.comments << c

c = cammy.comments.new(body: "Not my favorite - too much rabbit food!")
veggie_bowl.comments << c

veggie_bowl.save
