extends Node2D

onready var enemy = preload("res://Enemy.tscn")
var spawns = globals.current_level * 5

func _on_InnerSpawner_timeout():
	var enemy_instance = enemy.instance()
	enemy_instance.position = global_position
	add_child(enemy_instance)
