extends Node2D


var gold = preload("res://Scenes/gold_piece.tscn")
var gold_due:float = 0;


# delta is in seconds.
func _process(delta):
	gold_due += delta*Global.gold_spawned_per_sec;
	while(gold_due>1):
		var piece = gold.instantiate();
		add_child(piece);
		gold_due-=1;
	
