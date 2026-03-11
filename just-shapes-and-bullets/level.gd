extends Node2D

@onready var time = 0

@onready var player = $Player

@onready var bgm = $bgm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time >= 3:
		wave_1()
	
	if time >= 60:
		wave_2()
		pass
	
	if time >= 120:
		wave_3()
		pass
	
	if time >= 180:
		deactivate()
		
		
		#await bgm.finished
		await get_tree().create_timer(10).timeout
		
		get_tree().change_scene_to_file("res://victory.tscn")
		
		pass
	
	if player.hp == 0:
		deactivate()
		bgm.stop()
		get_tree().change_scene_to_file("res://game_over.tscn")
		
		pass #Game Over
	
	
	
	pass

func wave_1():
	$spawners/left_spawner_1.active = true
	$spawners/right_spawner_1.active = true
	$spawners/bottom_spawner_1.active = true
	$spawners/top_spawner_1.active = true
	pass

func wave_2():
	$spawners/left_spawner_2.active = true
	$spawners/right_spawner_2.active = true
	$spawners/bottom_spawner_2.active = true
	$spawners/top_spawner_2.active = true
	pass

func wave_3():
	$spawners/left_spawner_3.active = true
	$spawners/right_spawner_3.active = true
	$spawners/bottom_spawner_3.active = true
	$spawners/top_spawner_3.active = true
	pass


func deactivate():
	$spawners/left_spawner_1.kill()
	$spawners/right_spawner_1.kill()
	$spawners/bottom_spawner_1.kill()
	$spawners/top_spawner_1.kill()
	
	$spawners/left_spawner_2.kill()
	$spawners/right_spawner_2.kill()
	$spawners/bottom_spawner_2.kill()
	$spawners/top_spawner_2.kill()
	
	$spawners/left_spawner_3.kill()
	$spawners/right_spawner_3.kill()
	$spawners/bottom_spawner_3.kill()
	$spawners/top_spawner_3.kill()
	pass
