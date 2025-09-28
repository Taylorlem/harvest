extends VideoStreamPlayer

@onready var video_stream_player: VideoStreamPlayer = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	video_stream_player.finished.connect(_on_video_finished)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_video_finished():
	get_tree().change_scene_to_file("res://node.tscn")
