extends KinematicBody2D

var target_position
var speed = 40

func _ready():
	target_position = get_node("../LinkTower").global_position

func _physics_process(delta):
	get_node("Laser").look_at(target_position)
	if position.distance_to(target_position) > 10:
		position = position.move_toward(target_position, speed*delta)
	
