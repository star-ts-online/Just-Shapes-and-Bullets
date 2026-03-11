extends CharacterBody2D

var speed = 150

@onready var target = $"../Player"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = (target.global_position - position).normalized()
	
	velocity = direction * speed
	
	look_at(target.global_position)
	move_and_slide()
	
	pass
