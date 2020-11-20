# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create!(name:  "Example User",
             email: "example@random.org",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Daniel Connell",
             email: "example3@random.org",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
             
Category.create!(
    title: "All"
)

Category.create!(
    title: "Fiction"
)

Category.create!(
    title: "Non-Fiction"
)

Category.create!(
    title: "Anthologies"
)

Category.create!(
    title: "Poetry"
)

Category.create!(
    title: "Periodicals"
)


             
Item.create!(
    title: "The Andromeda Boy",
    author: "Marceline Anderson",
    description: "A new sci-fi epic from Marceline Anderson. After leaving the distant planet Frabenesh, a group of space-farers fly toward a distant speck. The speck turns out to be an altogether more sinister planet, ruled by Boris Gobble, a ruthless oligarch capable of unimaginable evil. Terrified, a tender imp known as Annabelle Godfrey flees the Empire, with her protector, Harriet Fry, as civil war strikes the galaxy.",
    price: 12.99,
    image_url: "andromeda.png",
    category: "Fiction")
    
Item.create!(
    title: "Feelings are Lost at Sea",
    author: "Jonathan Bynes",
    description: "The debut novel from Meath author Jonathan Bynes. Mark Thornton is a scrappy orphan raised by a spiteful headmaster. Eventually he gets a job working as a shopkeeper for the generous Lord DeVito of DeVito Bungalow. The unlikely couple rapidly succumb to an incredible passion.",
    price: 13.99,
    image_url: "feelings.png",
    category: "Fiction")

Item.create!(
    title: "Forager, Volumn 14",
    author: "Various",
    description: "The latest issue of the award-winning Galway-based literary journal. Read the latest short fiction and poetry from Ireland's rising literary stars.",
    price: 13.99,
    image_url: "forager.png",
    category: "Periodicals")
    
Item.create!(
    title: "Under the Hills",
    author: "J. Patterson",
    description: "A new domestic noir from J. Patterson. One morning in a house in Canada, Clarke Parker opens a gift from his niece, Susie Walker, and Clarke knows their lives will never be the same again. Whilst trying to rebuild his life, Clarke witnesses a crime that leads him to question a new relationship. He becomes obsessed with enigmatic stranger Maud Greenway. What is her connection to Suki, and why has she turned up now?",
    price: 11.99,
    image_url: "under.png",
    category: "Anthologies")
    
Item.create!(
    title: "The Jazz Singer",
    author: "Miles David",
    description: "Legendary musician Miles David tells his story, from rags to riches and all the peaks and valleys in between. An incredible first hand account of fame, fortune, excess, love, loss, and the immutable power of ambition and faith.",
    price: 10.99,
    image_url: "jazz.png",
    category: "Non-Fiction")
    
Item.create!(
    title: "Of Love & Lies",
    author: "Cassie Lee",
    description: "The debut novel from Wexford author Cassie Lee. Zoe Clifford is a caring and admirable runaway raised by a clumsy and forgetful headmistress. Eventually she gets a job working as a maid for the friendly Lord Nolan of Nolan Garage. The unlikely couple rapidly become involved in a  deep passion, but things are far from perfect, and lies abound.",
    price: 9.99,
    image_url: "love.png",
    category: "Fiction")
    
Item.create!(
    title: "Middle, Spring 2020",
    author: "Various",
    description: "Dublin's pre-eminent short story journal, featuring work from the country's most exciting new writers and established talent. Also featuring international contributions for the first time.",
    price: 8.99,
    image_url: "middle.png",
    category: "Periodicals")
    
Item.create!(
    title: "The Lives Inside Your Head",
    author: "Winston Brown",
    description: "Winston Brown's debut poetry collection, featuring a dazzling array of worth written between 2015 and 2019. The Cork-based poet demonstrates once again why he's one of the most exciting literary talents on the island.",
    price: 10.99,
    image_url: "head.png",
    category: "Poetry")

Item.create!(
    title: "Secrets",
    author: "Harry Rickets",
    description: "The latest crime thriller from Harry Rickets. Mangled arms have been turning up all over Asia and the inhabitants are scared. Ten murders in ten weeks, all committed with a rifle, and still nobody has a clue who the ruthless killer is. Lady Georgina Vader is a kindly homemaker with a fondness for playing the piano. She doesn't know it yet but she is the only one who can stop the arrogant killer.",
    price: 10.99,
    image_url: "secrets.png",
    category: "Fiction")

Item.create!(
    title: "The Open Seasons",
    author: "K. Rodriguez",
    description: "A vibrant anothology of new short stories from emerging Irish talent, edited by prize-winning author and poet K. Rodriguez. Feature new work from Gearoid De Cleir, Sujan Hossain, and Daniel Connell.",
    price: 10.99,
    image_url: "openseasons.png",
    category: "Anthologies")

Item.create!(
    title: "The Snap Era",
    author: "E. Brown",
    description: "E. Brown's exhaustive and definitive guide to the world of photography. Everything you ever wanted to know about lenses, film stock, lighting and everything in betwee, along with all the evolving trends and defining moments from this immortal artform's fascinating history.",
    price: 10.99,
    image_url: "snapera.png",
    category: "Non-Fiction")

Item.create!(
    title: "The Driver in the Dark",
    author: "A. K. Marchesi",
    description: "A new crime thriller from A.K Marchesi. Mangled torsos have been turning up all over New York and the inhabitants are scared. Ten murders in ten weeks, all committed with poison, and still nobody has a clue who the killer is.Prof Raymond Ferguson is a grubby and admirable housekeeper with a fondness for mischief. He doesn't know it yet but he is the only one who can stop the spiteful killer.",
    price: 10.99,
    image_url: "driver.png",
    category: "Fiction")

Item.create!(
    title: "The Sirens of Style",
    author: "Isabel Mercado",
    description: "Isabel Mercado's essential, down to earth sytle guide, featuring fashion inspirations from real-life women around Ireland. Mercado's internationally-praised fashion sensibilities and considerate, inclusive tone are unmatched in the world of style today, and The Sirens of Style is her definitive statement.",
    price: 10.99,
    image_url: "style.png",
    category: "Non-Fiction")

Item.create!(
    title: "The Missing Ride",
    author: "Mona Peterson",
    description: "A riveting new mystery from Belfast writer Mona Peterson. The derelict, Cornish town of Bailey holds a secret. Polly Thornton has the perfect life working as a nurse in the city and bopping with her girlfriend, Doris Pitt. However, when she finds a stolen car in her garage, she begins to realise that things are not quite as they seem in the Thornton family.",
    price: 10.99,
    image_url: "missing.png",
    category: "Fiction")

Item.create!(
    title: "Imaginings",
    author: "Various",
    description: "The Kerry-based literary journal returns, featuring work from all over Ireland and beyond.",
    price: 10.99,
    image_url: "imaginings.png",
    category: "Periodicals")

Item.create!(
    title: "Riptides",
    author: "Beverly Tan",
    description: "Edited by Beverly Tan, Riptides collects some of the most thought-provoking, exciting and daring contemporary science fiction in Ireland today. An essential short story anthology, featuring new work from Stephen Queen, David Chasely, Amanda O'Neil and Lucy Sims among many others.",
    price: 10.99,
    image_url: "riptides.png",
    category: "Anthologies")

Item.create!(
    title: "Food Journal 2020",
    author: "Various",
    description: "It can be tough planning for each and every meal or snack, day after day, especially when your favourite take-away is just a quick call away. Thankfully, this dense, colourful tome does all the work for you, offering delicious and nutricious meal options from some of the country's biggest and brightest minds in the world of food.",
    price: 10.99,
    image_url: "foodjournal.png",
    category: "Periodicals")

Item.create!(
    title: "Living the Simple Life",
    author: "Clark Hamington",
    description: "A breezy, inviting account of one man's defiantly minimalist lifestyle. Clark Hamington's latest memoir is a joyous read. It's also a testament to living modestly, being kind, and remaining content no matter your circumstances.",
    price: 10.99,
    image_url: "simplelife.png",
    category: "Non-Fiction")

Item.create!(
    title: "The Imperfections of Memory",
    author: "Annabelle Jones",
    description: "The industrial, seaside town of Dinora holds a secret. Chris Ball has the perfect life working as a psychiatrist in the city and cooking with his loving girlfriend, Annabelle Greenway. However, when he finds a cursed newspaper in his cellar, he begins to realise that things are not quite as they seem in the Ball family. Annabelle Jones' latest is a searing piece of mystery fiction.",
    price: 10.99,
    image_url: "imperfections.png",
    category: "Fiction")

Item.create!(
    title: "Sunsets with Annie",
    author: "Gretchen Fergusson",
    description: "The debut collection from Monaghan-based poet Gretchen Fergusson. Gathering two year's worth of vital, moving poetry into one cohesive volumn, Fergusson touches on her usual themes of love, loss, innocence and nostalgia. Featuring the Patrick Kavanagh Prize-winning poem 'When We Were Young'",
    price: 10.99,
    image_url: "sunsets.png",
    category: "Poetry")