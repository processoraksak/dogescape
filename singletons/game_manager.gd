extends Node

const GROUP_PLAYER: String = "player"

var scroll_speed: float = 150.0

var game_scene: PackedScene = preload("res://scenes/game/game.tscn")
var main_scene: PackedScene = preload("res://scenes/main/main.tscn")

func _change_scene_game() -> void:
	get_tree().change_scene_to_packed(game_scene)
func _change_scene_main() -> void:
	get_tree().change_scene_to_packed(main_scene)
func _change_scene_game_over() -> void:
	get_tree().change_scene_to_file.bind("res://scenes/game_over/game_over.tscn").call_deferred()
