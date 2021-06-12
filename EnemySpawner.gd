extends Node2D

onready var enemy = preload("res://Enemy.tscn")
var spawns = globals.current_level * 5
export var spawn_interval = 2

func _ready():
	$InnerSpawner.wait_time = spawn_interval

func _on_InnerSpawner_timeout():
	var enemy_instance = enemy.instance()
	enemy_instance.position = Vector2.ZERO
	add_child(enemy_instance)
