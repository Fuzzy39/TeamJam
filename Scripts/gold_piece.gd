extends Area2D

@export var value = 1


func _ready():#go to original position
	var map = $"../Home";
	var validSpawns:Array = map.get_used_cells(0)#Put the coordinates of all used cells in the variable   
	randomize()
	validSpawns.shuffle()#Moves all the cell positions around in the array  
	
	var spawnLocation = validSpawns.pop_front()#Get the first item in the array\
	while(!map.get_cell_tile_data(0, spawnLocation).get_custom_data("Spawn Gold")):
		spawnLocation = validSpawns.pop_front();
	
	position = map.to_global(map.map_to_local(spawnLocation))#Translates the coordinates of the tile to it's real position in the scene
	position.x += randf_range( -16, 16 );
	position.y += randf_range( -16, 16 );


func _on_body_entered(body):
	#jank?
	if body.has_method("is_player"):
		Global.player_gold += value
		queue_free()
	else:
		_ready()
		

var time_alive = 0;
func _process(delta):
	time_alive+=delta;
	if(time_alive>=90):
		queue_free()
