extends CharacterBody2D
@onready var animations: AnimatedSprite2D = $Animations


const SPEED = 300.0
const JUMP_VELOCITY = -900.0


func _physics_process(delta: float) -> void:
	# Animatie
	if velocity.x > 1 or velocity.x < -1:
		animations.animation = "Walk"
	else:
		animations.animation = "Idle"
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animations.animation = "Jump"
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_L", "move_R")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if direction == 1.0:
		animations.flip_h = false
	elif direction == -1.0:
		animations.flip_h = true
