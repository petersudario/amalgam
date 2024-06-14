extends Area2D

class_name BlueKeyObject

@onready var player = get_tree().get_nodes_in_group("player")[0]
# Called when the node enters the scene tree for the first time.
func _ready():
	if (Global.player_has_bluekey):
		self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.is_in_group("player"):
		self.visible = false
		Global.player_has_bluekey = true
		print("has the blue key")

