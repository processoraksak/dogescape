extends Node

var _score: int = 0
var _high_score: int = 0

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
