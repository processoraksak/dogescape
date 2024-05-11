extends Node2D

@export var pipes_scene: PackedScene
@onready var spawn_timer = $SpawnTimer
@onready var pipes_holder: Node = $PipesHolder

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager._on_plane_died.connect(_on_plane_died)
	ScoreManager._set_score(0)
	spawn_pipes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes() -> void:
	if !spawn_timer.is_stopped():
		var new_pipes = pipes_scene.instantiate()
		new_pipes.position = Vector2(675, ((randf()+2.0)*200.0))
		pipes_holder.add_child(new_pipes)
	
func _on_spawn_timer_timeout():
	spawn_pipes()
	
func stop_pipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_physics_process(false)

func _on_plane_died():
	stop_pipes()
	GameManager._change_scene_game_over()
	
