extends StaticBody2D

@export_node_path("AnimatedSprite2D") var sprite

signal player_entered
signal player_exited

func _ready():
	$AnimatedSprite2D.play("default")
	
func _on_proximity_body_entered(body):
	
	if body.has_method("is_player"):
		emit_signal("player_entered")
		sprite.play("on")


func _on_proximity_body_exited(body):
	
	if body.has_method("is_player"):
		emit_signal("player_exited")
		sprite.play("off")
