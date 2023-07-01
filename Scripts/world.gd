extends Node2D


var gold = preload("res://gold_piece.tscn")


func _on_gold_spawn_timeout():
	var new_gold = gold.instantiate()
	add_child(new_gold)
