extends CharacterBody2D

@onready var hp = 3
var speed = 200

const bullet = preload("res://Sprites/bullet.tscn")

@onready var shoot_sfx = $shoot_sfx
@onready var hurt_sfx = $hurt_sfx

@onready var invul_timer = $invul_timer
@onready var blink_timer = $blink_timer

@onready var invul: bool = false

func get_input(): 
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	pass


func _physics_process(delta: float) -> void:
	get_input()
	
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position
		bullet_instance.direction = (bullet_instance.position - get_global_mouse_position()).normalized()
		shoot_sfx.play()
		pass
	
	move_and_slide()

func damage():
	hp -= 1
	invul = true
	hurt_sfx.play()
	invul_timer.start()
	
	blink_timer.start()
	pass



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		damage()
		pass
	
	pass # Replace with function body.



func _on_invul_timer_timeout() -> void:
	invul = false
	
	blink_timer.stop()
	self.visible = true
	pass # Replace with function body.



func _on_blink_timer_timeout() -> void:
	self.visible = !self.visible
	
	pass # Replace with function body.
