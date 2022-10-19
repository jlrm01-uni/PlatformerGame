extends Area2D

export (PackedScene) var scene_to_load = null

func _ready() -> void:
	pass


func _on_GoalFlag_body_entered(body: Node) -> void:
	if body.name == "Player":
		if scene_to_load != null:
			TransitionManager.transition_to(scene_to_load)
			
