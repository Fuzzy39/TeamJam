extends CharacterBody2D

var spinny_speed = 100

func _process(delta):
	
	if Input.is_action_pressed("spin_left"):
		rotation_degrees -= spinny_speed * delta
	if Input.is_action_pressed("spin_right"):
		rotation_degrees += spinny_speed * delta
