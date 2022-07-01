extends Node

# loads location_box node to template_node variable
var template_node = load("res://nodes/ui/location_box/Location_Box.tscn")

# sets filter_1 and filter_2 variable to 0
var filter_1 = 0
var filter_2 = 0

# function to create a location box based off a template
func create_box(name, address):
	
	# creates tempalte_node to template variable
	var template = template_node.instance()
	
	# sets location_name and location_address for template node
	template.location_name = name
	template.location_address = address

	# add template node to the vboxcontainer node as a child
	# think of a baby bird being reunited with their mother
	get_node("/root/Node2D/Item Box/ScrollContainer/VBoxContainer").add_child(template)
	
	pass
