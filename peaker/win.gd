extends Control

func _ready():
	$CanvasLayer/VBoxContainer/Button.pressed.connect(_on_play_again_pressed)

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
