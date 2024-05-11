extends Control

@onready var game_over_timer = $GameOverTimer
@onready var score_text = $MC/ScoreText
@onready var gamer_over_audio_player = $GamerOverAudioPlayer

func _ready():
	game_over_timer.start()
	gamer_over_audio_player.play()
	score_text.text = ("Score: " + str(ScoreManager._get_score())+ "\nHigh Score: " + str(ScoreManager._get_high_score()))

func _process(delta):
	if game_over_timer.is_stopped():
		GameManager._change_scene_main()
