extends Area2D

var speed = 100

@onready var target = $"../Player"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = (target.global_position - position).normalized()
	position += direction * speed * delta
	look_at(target.global_position)
	pass



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		queue_free()
	pass # Replace with function body.
