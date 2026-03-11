extends Node2D


@onready var death_sfx = $death_sfx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	death_sfx.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Level.tscn")
	
	pass # Replace with function body.
