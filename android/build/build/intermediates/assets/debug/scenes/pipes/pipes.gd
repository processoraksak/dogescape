extends Node2D

var scroll_speed: float = GameManager.SCROLL_SPEED

@onready var laser = $Laser
@onready var score_audio_player = $ScoreAudioPlayer

func _physics_process(delta):
	position.x -= scroll_speed * delta

func _on_screen_exited():
	queue_free()

func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):	
		body.die()
		
func _on_laser_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):	
		ScoreManager._increment_score()
		score_audio_player.play()
		laser.visible = false
	
