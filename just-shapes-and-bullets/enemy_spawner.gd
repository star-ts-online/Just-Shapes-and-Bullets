extends Marker2D

const enemy = preload("res://Sprites/enemy.tscn")
const light_vfx = preload("res://Sprites/spawn_light.tscn")

@onready var spawn_sfx = $"../spawn_sfx"

@onready var active: bool = false

var rng = RandomNumberGenerator.new()

@onready var spawn_timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer.wait_time = rng.randi_range(3, 7)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass

func spawn():
	var enemy_instance = enemy.instantiate()
	get_tree().root.add_child(enemy_instance)
	enemy_instance.global_position = global_position
	enemy_instance.target = $"../../Player"
	spawn_sfx.play()
	
	var light_instance = light_vfx.instantiate()
	get_tree().root.add_child(light_instance)
	light_instance.global_position = global_position
	
	pass



func _on_timer_timeout() -> void:
	if active == true:
		spawn_timer.wait_time = rng.randi_range(3, 7)
		spawn()
	
	pass # Replace with function body.


func kill():
	active = false
	for e in get_tree().get_nodes_in_group("enemy_instance"):
		e.destroy()
		pass
	
	pass


func off():
	
	
	pass
