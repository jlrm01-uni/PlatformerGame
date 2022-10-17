extends Node2D

onready var coin_bag_label = $"%CoinBagLabel"


func _ready():
	pass

func _process(delta: float) -> void:
	coin_bag_label.text = str(Global.player_coins)
