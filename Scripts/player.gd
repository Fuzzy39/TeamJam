extends CharacterBody2D

@export var speed = 400
var moving = false


func _physics_process(delta):
	#movment
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
	
	#animations
	if input_direction == Vector2.ZERO:
		moving = false
		$Sprite.play("idle")
	else:
		$Sprite.play("moving")

func is_player():
	pass

