extends PanelContainer

var Upgrade = preload("res://Scenes/Upgrade.tscn")
var upSpawn;
var upSpeed;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# setup spacing
	var margin:int = 30;
	$"CenterContainer".add_theme_constant_override("margin_top", 10);
	$"CenterContainer".add_theme_constant_override("margin_bottom", 10);
	$"CenterContainer".add_theme_constant_override("margin_left", margin);
	$"CenterContainer".add_theme_constant_override("margin_right", margin);
	
	
	# create altar upgrade:
	upSpawn = create_Upgrade("Sacrifice", "Give offerings at the altar to increase the chances of finding shinies.");
	connect_Upgrade(upSpawn, on_upSpawn_purchased, set_upSpawn_Effect);
	connect_Building(upSpawn,  $"../SubViewport/SubViewport/World/Altar");
	
	# create speed upgrade
	upSpeed =  create_Upgrade("Gild My Boots!", "Pay some coin to get some pep in your step.");
	upSpeed.baseCost = 20; # change these before calling connect_upgrade to ensure the label remains correct.
	upSpeed.exponent = 1.5;
	connect_Upgrade(upSpeed, on_upSpeed_purchased, set_upSpeed_Effect);
	connect_Building(upSpeed, $"../SubViewport/SubViewport/World/SpeedUp");
	


func create_Upgrade(name:String, desc:String):
	var up = Upgrade.instantiate();
	$"CenterContainer/Container".add_child(up);
	up.get_node("Name").set_text(name);
	up.get_node("Description").set_text(desc);
	up.visible = false;
	return up;


func connect_Upgrade(upgrade, purchaseMethod, textMethod):
	upgrade.connect("purchased", purchaseMethod);
	textMethod.call();
	upgrade.update_labels();

func connect_Building(upgrade, building):
	building.connect("player_entered", upgrade.on_Enter);
	building.connect("player_exited", upgrade.on_Exit);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_upSpawn_purchased():
	Global.gold_spawned_per_sec+=.4;
	set_upSpawn_Effect();

func set_upSpawn_Effect():
	upSpawn.get_node("Effect").set_text("Current Rate: "+("%.1f"%Global.gold_spawned_per_sec)+" spawned/sec");
	

func on_upSpeed_purchased():
	var player = $"../SubViewport/SubViewport/World/Player";
	player.speed +=25;
	set_upSpeed_Effect();

func set_upSpeed_Effect():
	var player = $"../SubViewport/SubViewport/World/Player";
	upSpeed.get_node("Effect").set_text("Current Speed: "+("%.2f"%(player.speed/100.0)));
