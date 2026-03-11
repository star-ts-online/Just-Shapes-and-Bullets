extends Node2D

const speed: int = 450

var direction

@onready var enemy_death_sfx = $enemy_death_sfx

func _process(delta: float) -> void:
	position -= direction * speed * delta
	
	pass



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("wall") or area.is_in_group("enemy"):
		queue_free()
