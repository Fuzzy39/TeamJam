extends Area2D

@export var value = 1


func _ready():#go to original position
	position = Vector2(randi_range(0, 32*12), randi_range(0, 32*8))
	#$Bounce_Timer.start()



func _on_body_entered(body):
	if body.has_method("is_player"):
		Global.player_gold += value
		queue_free()
	else:
		_ready()
