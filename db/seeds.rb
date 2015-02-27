# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.name
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
Icecream.create([
	{flavor: "Americone Dream", description:"Helado de vainilla con dulce de azúcar cubierto pedazos de cono de waffle y un remolino de Caramel", price: 65, photo: File.new("#{Rails.root}/app/assets/images/flavors/americone-dream-detail.png"), stock: 30},
	{flavor: "Banana Split", description: "Plátano y Fresa Helados con nueces, Fudge Trozos y un remolino Fudge", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/banana-split-detail.png"), stock: 30},
	{flavor: "Boston Cream Pie", description: "Boston Cream Pie helado con Yellow Cake Piezas, Fudge Flakes y remolinos de crema pastelera", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/boston-cream-pie-detail.png"), stock: 30},
	{flavor: "Cake Batter", description: "Yellow Ice Cream Cake Batter con un helar del chocolate Remolino", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/cake-batter-detail.png"), stock: 30},
	{flavor: "Cheesecake Brownie", description: "Tarta de queso con helado de queso Brownie Trozos", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/cheesecake-brownie-detail.png"), stock: 30},
	{flavor: "Cherry Garcia", description: "Helado de cereza con cerezas y Fudge Flakes", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/cherry-garcia-detail.png"), stock: 30},
	{flavor: "Chocolate Chip Cookie Dough", description: "Helado de vainilla con pegotes de trozos de chocolate Cookie Dough", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/choc-chip-cookie-dough-detail.png"), stock: 30},
	{flavor: "Chocolate Peppermit Crunch", description: "Helado de chocolate con menta y dulce de azúcar de los remolinos y menta Bolas de galletas de chocolate", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/choc-peppermint-crunch-detail.png"), stock: 30},
	{flavor: "Chocolate Fudge Brownie", description: "Helado de chocolate con dulce de azúcar Brownie", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/chocolate-fudge-brownie-detail.png"), stock: 30},
	{flavor: "Chocolate Therapy", description: "Helado de chocolate con galletas de chocolate y los remolinos de Helado Pudín de chocolate", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/chocolate-therapy-detail.png"), stock: 30},
	{flavor: "Chubby Hubby", description: "Vanilla malta helado con Pretzels cubiertos por Fudge Crema de Cacahuete con Fudge y mantecoso Remolinos", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/chubby-hubby-detail.png"), stock: 30},
	{flavor: "Chunky Monkey", description: "Plátano helado con dulce de azúcar Trozos y Nueces", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/chunky-monkey-detail.png"), stock: 30},
	{flavor: "Cinnamon Buns", description: "Helado de caramelo con Canela bollo de masa y un remolino de canela Streusel", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/cinnamon-bun-detail.png"), stock: 30},
	{flavor: "Coffee, Coffee BuzzBuzzBuzz!", description: "Café helado con Espresso frijol Fudge Trozos", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/coffee-coffee-buzz-detail.png"), stock: 30},
	{flavor: "Coffee Toffee Bar Crunch", description: "Café helado con cubiertas de dulce de azúcar del caramelo Bar Piezas", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/coffee-toffee-detail.png"), stock: 30},
	{flavor: "Everything But The...", description: "Una colisión de Chocolate y Vainilla Ice Creams mezclado con Peanut Butter Cups, cubierto-Fudge Toffee pedazos, trozos de chocolate blanco y dulce de azúcar cubrió las almendras", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/everything-but-the-detail.png"), stock: 30},
	{flavor: "Half Baked", description: "Chocolate y helado de vainilla con Fudge Brownie y montones de trozos de chocolate Cookie Dough", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/half-baked-detail.png"), stock: 30},
	{flavor: "Milk & Cookies", description: "Helado de vainilla con un remolino de la galleta de chocolate, chispas de chocolate y chocolate galletas de chocolate", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/milk-and-cookies-detail.png"), stock: 30},
	{flavor: "Mint Chocolate Cookie", description: "Peppermint Ice Cream Sandwich con galletas de chocolate", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/mint-chocolate-cookie.png"), stock: 30},
	{flavor: "New York Super Fudge Chunk", description: "Helado de chocolate con dulce de azúcar blanco y oscuro Trozos, pecanas, nueces y dulce de azúcar cubrió las almendras", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/new-york-super-fudge-detail.png"), stock: 30},
	{flavor: "Peanut Butter Cup", description: "Mantequilla de maní helado con Peanut Butter Cups", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/peanut-butter-cup-detail.png"), stock: 30},
	{flavor: "Phish Food", description: "Helado de chocolate con Gooey de la melcocha remolinos, remolinos y Caramel Fudge Pescado", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/phish-food-detail.png"), stock: 30},
	{flavor: "Pistachio Pistachio", description: "Helado de pistache con pistaches tostados", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/pistachio-pistachio-detail.png"), stock: 30},
	{flavor: "Red Velvet Cake", description: "Red Velvet Cake Batter helado con Red Velvet Cake Piezas y un glaseado de queso crema remolino", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/red-velvet-detail.png"), stock: 30},
	{flavor: "S'mores", description: "Helado de chocolate con dulce de azúcar, trozos de la melcocha tostada y Graham Cracker Remolinos", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/smores-detail.png"), stock: 30},
	{flavor: "Strawberry Cheesecake", description: "Pastel de queso con helado de fresas y un Cracker remolino Grueso Graham", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/strawberry-cheesecake-detail.png"), stock: 30},
	{flavor: "Triple Caramel Chunk", description: "Helado de caramelo con un remolino de caramelo y dulce de azúcar cubierto trozos de caramelo", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/triple-caramel-chunk-detail.png"), stock: 30},
	{flavor: "Vanilla Caramel Fudge", description: "Helado de vainilla con remolinos de caramelo y dulce de azúcar", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/vanilla-caramel-fudge-detail.png"), stock: 30},
	{flavor: "Vanilla", description: "Helado de Vainilla", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/vanilla-detail.png"), stock: 30},
	{flavor: "Vanilla Toffee Bar Crunch", description: "Helado de vainilla con cubierta-Fudge Toffee Piezas", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/vanilla-toffee-detail.png"), stock: 30},
	{flavor: "What a Cluster", description: "Mantequilla de maní con helado de caramelo Cluster Piezas, Marshmallow Remolinos y mantequilla de cacahuete de los remolinos", price: 65.0, photo: File.new("#{Rails.root}/app/assets/images/flavors/what-a-cluster-detail.png"), stock: 30}
])