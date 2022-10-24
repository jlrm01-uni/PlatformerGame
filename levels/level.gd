extends Node2D

onready var coin_bag_label = $"%CoinBagLabel"
onready var canvas_layer: CanvasLayer = $"%CanvasLayer"


func _ready():
	if canvas_layer:
		canvas_layer.visible = true

func _process(delta: float) -> void:
	coin_bag_label.text = str(Global.player_coins)
