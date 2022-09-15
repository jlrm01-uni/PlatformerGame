extends KinematicBody2D

export (int) var speed = 200 # pixels / second
export (int) var GRAVITY = 800 # pixels / second / second

onready var sprite = $Sprite

var velocity: Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	velocity.x = 0
	
	if Input.is_action_pressed("walk_left"):
		velocity.x = velocity.x - speed
		sprite.flip_h = false
		
	if Input.is_action_pressed("walk_right"):
		velocity.x = velocity.x + speed
		sprite.flip_h = true
		
	velocity.y = velocity.y + GRAVITY * delta
		
	velocity = move_and_slide(velocity, Vector2.UP)
