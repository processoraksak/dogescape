extends Control

@onready var score_label = $MarginContainer/ScoreLabel

func _ready():
	SignalManager._on_update_score.connect(_on_update_score)

func _process(delta):
	pass

func _on_update_score() -> void:
	score_label.text = str(ScoreManager._get_score())
