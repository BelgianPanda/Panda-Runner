extends CharacterBody2D

const SPEED = 600.0
const SPRINT_SPEED = 1000
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

func respawn():
	self.global_position = Vector2(43, 44)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction and Input.is_action_pressed("sprint"):
		velocity.x = direction * SPRINT_SPEED
		animated_sprite.play("Sprint")
		animated_sprite.flip_h = direction < 0
	elif direction:
		velocity.x = direction * SPEED
		animated_sprite.play("Walk")
		animated_sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("Idle")


	move_and_slide()
