extends Node2D

func _ready():
	pass

func consume(item):
	var inv = get_node("/root/Main").get_inventory()
	inv.consume_n_items(item.name, 1)
	match item.name:
		"HealPotion":
			var player = get_node("/root/Main").get_player()
			var heal = 50 # TODO: check value
			if player.hp + heal > player.max_health:
				player.hp = player.max_health
			else:
				player.hp += heal
		"LaaZahna":
			print("LasaLaaZahnagna")