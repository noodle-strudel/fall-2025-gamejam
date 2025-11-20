extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
@export var speed = 300.0
@export var accel = 40.0

func _moving(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	# Move
	var target_vel = Vector2.ZERO
	if direction:
		target_vel = direction.normalized() * speed
	velocity.x = move_toward(velocity.x, target_vel.x, accel)
	velocity.y = move_toward(velocity.y, target_vel.y, accel)
	
	if Input.is_action_just_pressed("interact"):
		$InteractionManager.initiate_interaction()
	
	# Flip Sprite
	#if direction.x < 0:
		#sprite.scale.x = abs(sprite.scale.x)
	#if direction.x > 0:
		#sprite.scale.x = -abs(sprite.scale.x)
	
	if target_vel != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", target_vel)
		animation_tree.set("parameters/Walk/blend_position", target_vel)
		animation_state.travel("Walk")
	else:
		animation_state.travel("Idle")  
		velocity = Vector2.ZERO
	# Animations
	#if direction.x == 0 and direction.y == 0:
		#sprite.play("idle")
	#else:
		#sprite.play("walk")
		## Update interaction area
		#$Marker2D.rotation = ((2 * PI) + direction.angle())
	
	#select_plant()
	move_and_slide()

func _interact() -> void:
	animation_state.travel("Idle")  
	velocity = Vector2.ZERO
	
func _physics_process(delta: float) -> void:
	match (Global.player_state):
		Global.State.MOVING:
			_moving(delta)
		Global.State.INTERACTING:
			_interact()
