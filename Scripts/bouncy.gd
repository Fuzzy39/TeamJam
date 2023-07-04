extends Sprite2D


@export var y_move = 198
@export var x_move = 235

var x_direction = 1
var y_direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += x_move * x_direction * delta
	position.y += y_move * y_direction * delta
	
	if position.x < 0:
		x_direction = 1
	if position.x > 1152:
		x_direction = -1
	if position.y < 0:
		y_direction = 1
	if position.y > 648:
		y_direction = -1
