extends Node2D

var waypoints
var speed = 60
var damage = 10
var current_waypoint = 0
var health = 100

func _ready():
	waypoints = get_node("../../Waypoints").get_children()
	
func _process(delta):
	global_position += global_position.direction_to(waypoints[current_waypoint].global_position) * speed * delta
	if global_position.distance_to(waypoints[current_waypoint].global_position) < 2: #when it get close enough to point it goes to next
		current_waypoint += 1
	if current_waypoint == len(waypoints):
		globals.health -= damage
		print(globals.health)
		queue_free()
	if health <= 0:
		queue_free()
