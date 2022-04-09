extends Panel

# sets text names to "unknown"
export(String) var location_name = "Unknown Name"
export(String) var location_address = "Unknown address"

func _ready():
	
	# if texts are not changed, then change to default text
	if $Name.text == "Name":
		$Name.text = location_name
		
	if $Address.text == "Address":
		$Address.text = location_address
	
	pass
