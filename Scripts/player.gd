extends CharacterBody2D

@export var speed = 100
var moving = false


func _physics_process(delta):
	#movment
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
	$Sprite.speed_scale = (speed/100.0)*1.35;
	
	#animations
	if input_direction == Vector2.ZERO:
		moving = false
		await $Sprite.animation_looped
		$Sprite.play("idle")
	else:
		$Sprite.play("moving")

func is_player():
	pass

