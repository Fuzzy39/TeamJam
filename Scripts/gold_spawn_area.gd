extends Area2D

@export_node_path("CollisionShape2D") var shape

var gold = preload("res://Scenes/gold_piece.tscn")
var gold_due:float = 0;

"""func _process(delta):
	gold_due += delta*Global.gold_spawned_per_sec;
	while(gold_due>1):
		var piece = gold.instantiate();
		
		var x_pos = randi_range(0, 1)#within range of the collisionshape
		var y_pos
		
		piece.position = Vector2(3,3)
		add_child(piece);
		gold_due-=1;"""
		
	
