extends Label

@onready var timer = $"../game_timer"

@onready var total_time_in_secs: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = '00:00'
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if total_time_in_secs == 180:
		timer.stop()
		pass
	
	pass


func _on_game_timer_timeout() -> void:
	total_time_in_secs += 1
	var m = int(total_time_in_secs / 60)
	var s = int(total_time_in_secs - m * 60)
	text = '%02d:%02d' % [m, s]
	
	$"../..".time += 1
	
	
	pass # Replace with function body.
