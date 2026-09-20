extends Node

var game_over_scene = preload("res://game_over.tscn")

func player_died():
	var game_over = game_over_scene.instantiate()
	add_child(game_over)
