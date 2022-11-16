extends Control

export (PackedScene) var next_scene = null

func _on_PlayButton_pressed():
	get_tree().change_scene("res://levels/level1.tscn")


func _on_Timer_timeout() -> void:
	TransitionManager.transition_to(next_scene)
