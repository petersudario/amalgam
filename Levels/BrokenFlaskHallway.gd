extends Node2D

func _ready():
	pass 

func _process(delta):
	if self.name == "BrokenFlaskHallway" and $you.position[1] >= -35 and Global.player_has_bluekey:
		$AudioStreamPlayer.play()
