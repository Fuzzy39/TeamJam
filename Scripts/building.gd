extends StaticBody2D

signal player_entered
signal player_exited

func _ready():
	$AnimatedSprite2D.play("default")
	
func _on_proximity_body_entered(body):
	
	if body.has_method("is_player"):
		emit_signal("player_entered")
		$AnimatedSprite2D.play("glowing")


func _on_proximity_body_exited(body):
	
	if body.has_method("is_player"):
		emit_signal("player_exited")
		$AnimatedSprite2D.play("default")
