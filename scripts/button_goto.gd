extends Button

# sets variables from IDE gui
export(String, FILE, "*.tscn") var room_location
export(int) var filter_type
export(int) var location_type


func _process(_delta):
	
	# checks if button is pressed and location exists
	if self.pressed == true and ResourceLoader.exists(room_location):
		
		# checks if location exists
		if get_tree().change_scene(room_location) != 0:
			print("scene is missing!")
			
		# sets globalfunctions node to global variable
		var global = get_node_or_null("/root/GlobalFunctions")
		
		# comparing filter_type variable
		match filter_type:
			
			0:
				
				# sets filter_1 and filter_2 from globalfunctions node to 0
				global.filter_1 = 0
				global.filter_2 = 0
			
			# checks if filter_type is equal to 1
			1:
				
				# sets variable location_type to filter_1 from globalfunctions node
				global.filter_1 = location_type
				
			# checks if filter_type is equal to 2
			2:
				
				# sets variable location_type to filter_2 from globalfunctions node
				global.filter_2 = location_type
	
	pass
