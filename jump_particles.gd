extends Particles2D

onready var particles_2d: Particles2D = $"."

func _ready() -> void:
	pass # Replace with function body.




func _on_Timer_timeout() -> void:
	if not particles_2d.emitting:
		print("releasing the particles!")
		queue_free()
