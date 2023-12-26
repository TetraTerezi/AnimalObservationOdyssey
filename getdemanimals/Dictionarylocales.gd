extends Node2D

var locales = {
	"atlantic_ocean": {},  #// Empty dictionary for Atlantic Ocean animals
	"pacific_ocean": {},  #// Empty dictionary for Pacific Ocean animals, and so on
	"north_america":"cougar" = {
	"name": "Cougar",
	"rarity": "uncommon",
	"traits": {
		"endangerment_status": "least concern",
		"origin": "North America",
		"lifespan": "10-12 years",
	},
	"image_folder": "res://images/cougars",
}
#// ... add other continents/oceans
}

func _ready():
	for locale_code in locales.keys():
		var button = Button.new()
		button.text = get_locale_name(locale_code)  #// Use the get_locale_name function
		add_child(button)
		#// Connect button signals and add functionality

func get_locale_name(locale_code):
	if locale_code in locales:
		return locales[locale_code]  #// Return the entire locale dictionary
	else:
		return "Unknown Locale"

func set_locale(locale_code):
	#// Implement your logic to set the current locale based on code
	#// This could involve changing UI elements, text, etc.

#// New functions for animal data and images
func get_animal_info(locale_code, animal_name):
	if locale_code in locales and animal_name in locales[locale_code]:
		return locales[locale_code][animal_name]
	else:
		return null

func get_random_animal_image(locale_code, animal_name):
	var animal_data = get_animal_info(locale_code, animal_name)
	if animal_data:
		var image_dir = Directory.new()
		image_dir.open(animal_data["image_folder"])
		var random_image_name = image_dir.get_next()
		var full_image_path = animal_data["image_folder"] + "/" + random_image_name
		return TextureLoader.new().load(full_image_path)
	else:
		return null  #// No image found

#// Example usage:
var whale_texture = get_random_animal_image("atlantic_ocean", "blue_whale")
if whale_texture:
	#// Use the texture to display the image
