extends Area2D

@export var value = 1

@export var original_velocity = -50
@export var bounce_acceleration = 50

var bouncing = false
var bounce_height = 0
var bounce_velocity = original_velocity
var original_y

func _ready():#go to original position
	original_y = randi_range(10, 100)
	position = Vector2(randi_range(10, 100), original_y)
	$Bounce_Timer.start()

func _process(delta):
	
	if bouncing:#do all of the fancy movment things
		position.y = original_y + (bounce_velocity * delta)
		bounce_velocity += bounce_acceleration * delta
		
		if position.y < original_y:
			position.y = original_y
			bounce_velocity = original_velocity
			$Bounce_Timer.start()
			bouncing = false



func _on_bounce_timer_timeout():#start bouncing and set a new wait time for later
	bouncing = true
	$Bounce_Timer.wait_time = randi_range(5, 10)
	print("boing")




func _on_body_entered(body):
	if body.has_method("is_player"):
		Global.player_gold += value
		queue_free()
