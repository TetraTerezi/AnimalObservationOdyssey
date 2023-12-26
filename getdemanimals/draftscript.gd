extends Node2D


# Define variables
var draft_pool = [
	"Africa",
	"Asia",
	"Europe",
	"North America",
	"South America",
	"Antarctica",
	"Arctic Ocean",
	"Atlantic Ocean",
	"Indian Ocean",
	"Pacific Ocean",
	"Southern Ocean"
]
var remaining_locations = draft_pool.copy()
var selected_location = ""

# Define UI elements
var draft_pool_display
var ban_area
var selection_area
var ban_button
var confirm_button

func _ready():
	# Connect UI elements
	draft_pool_display = $... # Replace with node path
	ban_area = $... # Replace with node path
	selection_area = $... # Replace with node path
	ban_button = $... # Replace with node path
	confirm_button = $... # Replace with node path

	# Initialize UI
	update_draft_pool_display()

func _on_ban_button_pressed():
	# Get selected location to ban
	var selected_location_to_ban = draft_pool_display.get_selected_item()

	# Check if valid selection
	if selected_location_to_ban != "":
		# Ban location
		remaining_locations.erase(remaining_locations.find(selected_location_to_ban))
		update_draft_pool_display()

	# Check if ban limit reached
	if len(remaining_locations) <= 7:
		ban_area.set_disabled(true)

func _on_confirm_button_pressed():
	# Get selected location
	selected_location = selection_area.get_selected_item()

	# Check if valid selection
	if selected_location != "":
		# Final selection made, proceed to next scene based on location
		print("Selected location:", selected_location)
		# Replace with your scene loading logic based on selected location
		get_tree().change_scene("res://scenes/scene_based_on_" + selected_location + ".tscn")

func update_draft_pool_display():
	# Clear existing UI elements
	draft_pool_display.clear()
	selection_area.clear()

	# Add remaining locations to pool display
	for location in remaining_locations:
		var label = Label.new()
		label.text = location
		draft_pool_display.add_child(label)

	# Add initial draft picks to selection area
	for _ in range(4):
		var random_location = remaining_locations.pop()
		var label = Label.new()
		label.text = random_location
		selection_area.add_child(label)

	# Draw additional picks after bans
	for _ in range(2):
		var random_location = remaining_locations.pop()
		var label = Label.new()
		label.text = random_location
		selection_area.add_child(label)
