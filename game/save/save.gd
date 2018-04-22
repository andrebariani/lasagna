extends Node

const SAVE_PATH = "user://game.save"

onready var inventory = get_node("../Inventory")

func _play():
	load_game()

func save_game():
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	
	var data = serialize()
	
	save_file.store_string(to_json(data))
	
	save_file.close()

func load_game():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return false
	
	save_file.open(SAVE_PATH, File.READ)
	
	var data = parse_json(save_file.get_as_text())
	
	inventory.money = data["money"]
	inventory.stash = data["stash"]
	inventory.inventory = data["inventory"]
	
	return true

func serialize():
	# Inventory
	var data = {}
	data["money"] = inventory.money
	data["stash"] = inventory.stash.duplicate()
	data["inventory"] = inventory.inventory.duplicate()
	
	# TODO:
	# 	Flags	
	# 	Número de dias
	# 	Matriz de plantas
	
	return data
