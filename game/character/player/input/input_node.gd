extends Node2D

onready var Time = get_node("Timer")

var direction = Vector2(0,0)
var prev_input = false
signal interact

const UP = Vector2(+0, -1)
const DW = Vector2(+0, +1)
const LF = Vector2(-1, +0)
const RT = Vector2(+1, +0)

func current_direction():
	return direction.normalized()
	
func prevent_input(b):
	if not b:
		Time.start()
		yield(Time, "timeout")
	prev_input = b

func get_equipped_item():
	var inv = get_node("/root/Main").get_inventory()
	

func _process(delta):
	direction = Vector2(0, 0)
	if not prev_input:
		if Input.is_action_just_pressed("ui_accept"):
			emit_signal('interact')
		if Input.is_action_pressed("ui_up"):
			direction += UP
		if Input.is_action_pressed("ui_left"):
			direction += LF
		if Input.is_action_pressed("ui_down"):
			direction += DW
		if Input.is_action_pressed("ui_right"):
			direction += RT