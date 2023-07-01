extends PanelContainer

var Upgrade = preload("res://Scenes/Upgrade.tscn")
var upSpawn;

# Called when the node enters the scene tree for the first time.
func _ready():
	# create altar upgrade:
	upSpawn = Upgrade.instantiate();
	$"Container".add_child(upSpawn);
	upSpawn.get_node("Name").set_text("Increase Gold Spawn")
	upSpawn.get_node("Description").set_text("Give offerings at the altar to increase the chances of finding shinies.")
	upSpawn.get_node("Effect").set_text("Current Rate: "+str(Global.gold_spawned_per_sec)+" spawned/sec");
	
	# Connect appropriate signals.
	upSpawn.connect("purchased", on_upSpawn_purchased);
	var altar = $"../SubViewport/SubViewport/World/Altar";
	altar.connect("player_entered", on_Altar_Entered);
	altar.connect("player_exited", on_Altar_Exited);
	on_Altar_Exited();
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_Altar_Entered():
	upSpawn.visible = true;

func on_Altar_Exited():
	upSpawn.visible = false;

func on_upSpawn_purchased():
	Global.gold_spawned_per_sec+=.3;
	upSpawn.get_node("Effect").set_text("Current Rate: "+("%.1f"%Global.gold_spawned_per_sec)+" spawned/sec");


