extends CharacterBody2D

const GRAVITY: float = 1500.0
const FLYPOWER: float = -450.0

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor() or is_on_ceiling():
		die()

func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		animation_player.play("power")
		velocity.y = FLYPOWER

func die() -> void:
	sprite.stop()
	set_physics_process(false)
	SignalManager._on_plane_died.emit()
