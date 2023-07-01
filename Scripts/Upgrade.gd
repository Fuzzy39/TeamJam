extends VBoxContainer

var baseCost:int = 5;
var exponent:float = 1.1;
var owned:int = 0;

signal purchased;

# Called when the node enters the scene tree for the first time.
func _ready():
	update_labels();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"Button".disabled=Global.player_gold<get_cost();


func get_cost():
	#exponent isn't the exponent but whatever
	return floor(baseCost * pow(exponent, owned));
	

func purchase():
	Global.player_gold -=get_cost();
	owned+=1;
	
	# update labels:
	update_labels();
	#emit a signal
	emit_signal("purchased");

func update_labels():
	$"HBoxContainer/Cost".set_text("Cost: "+str(get_cost())+" gold");
	$"HBoxContainer/Owned".set_text("Owned: "+str(owned));
	


func _on_button_pressed():
	purchase();



