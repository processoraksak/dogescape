extends ParallaxBackground

func _ready():
	SignalManager._on_plane_died.connect(_on_plane_died)

func _process(delta):
	scroll_offset.x -= GameManager.SCROLL_SPEED * delta

func _on_plane_died() -> void:
	set_process(false)
