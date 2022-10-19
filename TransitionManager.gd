extends CanvasLayer

onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.visible = false

func transition_to(packed_scene: PackedScene, fade_in_time: float = 1.0, fade_out_time: float = 1.0):
	var tween = get_tree().create_tween()
	
	color_rect.modulate = Color(0, 0, 0, 0)
	color_rect.visible = true
	
	tween.connect("finished", self, "on_tween_finished")
	
	tween.tween_property(color_rect, "modulate", Color.black, fade_in_time)
	tween.tween_callback(get_tree(), "change_scene_to", [packed_scene])
	tween.tween_property(color_rect, "modulate", Color(0, 0, 0, 0), fade_out_time)
#	tween.tween_property(color_rect, "visibility", false, 0)
	
func on_tween_finished():
	print("finished!")
	pass
	
