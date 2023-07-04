extends Area2D

@export var value = 1

var despawning = false
var spawning = true
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
	
	modulate.a = 0


func _on_body_entered(body):
	#jank? Yes this is jank
	if body.has_method("is_player"):#if player, collect gold
		if !spawning:#keeps things from breaking
			Global.player_gold += value
			despawning = true
			$despawn_timer.stop()
			$shadow.hide()
	else:
		_ready()#what is this
		


func _process(delta):
	
	
	
	if despawning:#animate the dissapearance
		position.y -= 10 * delta
		modulate.a -= 2 * delta
		if modulate.a <= 0:
			queue_free()
	
	if spawning:
		modulate.a += 1 * delta
		if(modulate.a >= 1):
			spawning = false
			$despawn_timer.start()


func _on_despawn_timer_timeout():
	despawning = true
