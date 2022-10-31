extends Node2D

onready var coin_bag_label = $"%CoinBagLabel"
onready var canvas_layer: CanvasLayer = $CanvasLayer


func _ready():
	canvas_layer.visible = true

func _process(delta: float) -> void:
	coin_bag_label.text = str(Global.player_coins)

func show_death_animation():
	var death_screen = load("res://DeathScreen.tscn")
	
	var death_screen_instance = death_screen.instance()
	canvas_layer.add_child(death_screen_instance)
	
func reset_level():
	get_tree().reload_current_scene()
