extends Node2D

var waypoints
var speed = 300
var damage = 10
var current_waypoint = 0
export var health = 100

func _ready():
	waypoints = get_node("../../Waypoints").get_children()
	
func _process(delta):
		
	position += position.direction_to(waypoints[current_waypoint].position) * speed * delta
	if position.distance_to(waypoints[current_waypoint].position) < 10: #when it get close enough to point it goes to next
		current_waypoint = current_waypoint + 1
	if current_waypoint == len(waypoints):
		globals.health -= damage
		print(globals.health)
		queue_free()
