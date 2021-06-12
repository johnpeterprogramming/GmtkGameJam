extends RayCast2D

var is_casting = false setget set_is_casting

func _ready():
	self.is_casting = true
	
func _physics_process(_delta):
	var cast_point = cast_to # cast_to is the raycast2d's destination point
	force_raycast_update() #updates raycast before checking collisions

	$CollisionParticles2D.emitting = is_colliding()

	if is_colliding():
		cast_point = to_local(get_collision_point()) #idk why use to_local
		$CollisionParticles2D.global_rotation = get_collision_normal().angle()
		$CollisionParticles2D.position = cast_point

	$Line2D.points[1] = cast_point
	$BeamParticles2D.position = cast_point*0.5
	$BeamParticles2D.emission_rect_extents.x = cast_point.length() * 0.5

func set_is_casting(cast: bool) -> void:
	is_casting = cast
	$CastingParticles2D.emitting = is_casting
	$BeamParticles2D.emitting = is_casting
	if is_casting:
		appear()
	else:
		$CollisionParticles2D.emitting = false
		disappear()
	set_physics_process(is_casting)
	

func appear():
	$Tween.stop_all()
	$Tween.interpolate_property($Line2D, "width", 0, 10, 0.2)
	$Tween.start()
	
func disappear():
	$Tween.stop_all()
	$Tween.interpolate_property($Line2D, "width", 10, 0, 0.1)
	$Tween.start()

