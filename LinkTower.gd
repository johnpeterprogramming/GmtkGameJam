extends Area2D


var can_click = false
var player

func _ready():
	player = get_node("../Player")

func _process(delta):
	if Input.is_action_just_pressed("LASER") and can_click:
		player.target_position = global_position

func _on_LinkTower_mouse_entered():
	can_click = true

func _on_LinkTower_mouse_exited():
	can_click = false
