extends Panel

# sets text names to "unknown"
export(String) var location_name = "Unknown Name"
export(String) var location_address = "Unknown address"

var style = StyleBoxFlat.new()

# sets globalfunctions node to global variable
var global = get_node_or_null("/root/GlobalFunctions")

# sets the color variable ahead of time to blue
var color = Color("#6b92ff")

# creates an rng variable for the RandomNumberGenerator
var rng = RandomNumberGenerator.new()

func _ready():
	
	# adds an override to the theme
	add_stylebox_override("panel", style)
	
	# randomizes the rng variable
	rng.randomize()
	
	# generates a random number
	var rand_color = rng.randf_range(1, 3)
	
	# uses the rand_color and matches it with a specific color
	match rand_color:
		1:
			color = Color("#6b92ff")
		2:
			color = Color("#ff6666")
		3:
			color = Color("#a5e971")
		_:
			color = Color("#6b92ff")
	
	# sets the background color for the location box
	style.set_bg_color(color)
	
	# sets the corner radius for the theme
	style.set_corner_radius_all(10)
			
	
	# if texts are not changed, then change to default text
	if $Name.text == "Name":
		$Name.text = location_name
		
	if $Address.text == "Address":
		$Address.text = location_address
	
	pass
