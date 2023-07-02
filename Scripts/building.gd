extends StaticBody2D

var spritePath = NodePath("AnimatedSprite2D")


signal player_entered
signal player_exited

func _ready():
	$AnimatedSprite2D.play("off")
	
func _on_proximity_body_entered(body):
	
	if body.has_method("is_player"):
		emit_signal("player_entered")
		get_node(spritePath).play("on")


func _on_proximity_body_exited(body):
	
	if body.has_method("is_player"):
		emit_signal("player_exited")
		get_node(spritePath).play("off")
