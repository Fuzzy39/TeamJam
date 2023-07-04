extends Area2D

@export var value = 1

var collecting = false
var time_alive = 0;

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
	#jank? Yes this is jank
	if body.has_method("is_player"):#if player, collect gold
		Global.player_gold += value
		collecting = true
		$shadow.hide()
	else:
		_ready()#what is this
		


func _process(delta):
	#delete gold after 90 seconds
	time_alive+=delta;
	if(time_alive>=90 && !collecting):#make sure that it doesn't delete during animation
		queue_free()
	
	if collecting:#animate the dissapearance
		position.y -= 10 * delta
		modulate.a -= 2 * delta
		if modulate.a <= 0:
			queue_free()
