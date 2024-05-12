extends Node

# SCORE SECTION

var _score: int = 0
var _high_score: int = read_save()

func _get_score() -> int:
	return _score
	
func _get_high_score() -> int:
	return _high_score

func _set_score(v: int) -> void:
	_score = v
	print("score", _score)
	if _score > _high_score:
		_set_high_score(_score)
	SignalManager._on_update_score.emit()
	
func _set_high_score(v: int) -> void:
	_high_score = v
	print("high score", _high_score)

func _increment_score() -> void:
	_set_score(_score + 1)
	
# SAVE SECTION

const PATH = "user://data.json"

var data: Dictionary = {}

func write_save():
	var file = FileAccess.open(PATH, FileAccess.WRITE)
	data = {"high_score": _get_high_score()}
	file.store_line(JSON.stringify(data))
	file.close

func read_save():
	var file = FileAccess.open(PATH, FileAccess.READ)
	if FileAccess.file_exists(PATH):
		if !file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				_set_high_score(current_line["high_score"])
				return int(current_line["high_score"])	

