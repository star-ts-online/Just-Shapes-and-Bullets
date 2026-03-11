extends Node2D

var speed = 100

@onready var target: CharacterBody2D

var vfx = preload("res://Sprites/kill_vfx.tscn")

@onready var enemy_death_sfx = $enemy_death_sfx


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = (target.global_position - position).normalized()
	position += direction * speed * delta
	look_at(target.global_position)
	pass



func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("bullet"):
		destroy()
	
	pass # Replace with function body.


func destroy():
	var vfx_instance = vfx.instantiate()
	get_tree().root.add_child(vfx_instance)
	vfx_instance.global_position = global_position
	
	queue_free()
	pass
