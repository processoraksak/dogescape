extends Control

@onready var h_score = $MC/HScore

func _ready():
	h_score.text = str(ScoreManager._get_high_score())

func _process(delta):
	if Input.is_action_just_pressed("fly"):
		GameManager._change_scene_game()

