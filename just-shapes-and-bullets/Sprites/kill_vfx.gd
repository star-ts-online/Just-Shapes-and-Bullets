extends Node2D

@onready var timer = $Timer
@onready var kill_sfx = $kill_sfx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	kill_sfx.play()
	await kill_sfx.finished
	queue_free()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass


func _on_timer_timeout() -> void:
	visible = false
	
	pass # Replace with function body.
