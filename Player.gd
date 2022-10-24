extends KinematicBody2D

export (int) var speed = 200 # pixels / second
export (int) var GRAVITY = 800 # pixels / second / second
export (int) var jump_force = 1800

onready var sprite = $Sprite
onready var idle_timer = $IdleTimer

var velocity: Vector2 = Vector2()

var is_dying = false
export (bool) var is_disabled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	velocity.x = 0
	
	if not is_disabled:
		if Input.is_action_pressed("walk_left"):
			velocity.x = velocity.x - speed
			sprite.flip_h = false
			set_idle(false)
			
		if Input.is_action_pressed("walk_right"):
			velocity.x = velocity.x + speed
			sprite.flip_h = true
			set_idle(false)
			
		if Input.is_action_just_pressed("jump"):
			if is_on_floor():
				velocity.y = -jump_force
				set_idle(false)
				
	velocity.y = velocity.y + GRAVITY * delta
		
	velocity = move_and_slide(velocity, Vector2.UP)

	if velocity.y != 0 and not is_on_floor():
		idle_timer.start()

func _on_IdleTimer_timeout():
	set_idle(true)

func set_idle(value):
	if value:
		$Label.visible = true
	else:
		if is_on_floor():
			idle_timer.start()
			$Label.visible = false

func jump(boost=1):
	velocity.y = - jump_force * boost

func die():
	print("I'm supposed to be dying!")
	
