extends Node2D

var waypoints
var speed = 300
var current_waypoint = 0

func _ready():
	waypoints = get_node("../Waypoints").get_children()
	
func _process(delta):
	if current_waypoint == len(waypoints)-1:
		#decreases health
		queue_free()
		
	position += position.direction_to(waypoints[current_waypoint].position) * speed * delta
	if position.distance_to(waypoints[current_waypoint].position) < 100:
		current_waypoint = current_waypoint + 1
