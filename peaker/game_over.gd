extends Control

func _ready():
	$CanvasLayer/VBoxContainer/Button.pressed.connect(_on_retry_pressed)

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
