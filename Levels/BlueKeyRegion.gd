extends Area2D

class_name BlueKeyObject

@onready var delay_timer = $Timer
@onready var player = get_tree().get_nodes_in_group("player")[0]

func _ready():
	if (Global.player_has_bluekey):
		self.visible = false


func wait(seconds : int):
	delay_timer.wait_time = seconds
	delay_timer.start()
	await delay_timer.timeout

func _process(delta):
	pass

func _on_area_entered(area):
	if area.is_in_group("player"):
		if not Global.player_has_bluekey:
			$GrabSFX.play()
			self.wait(2)
			$GlassShatterSFX.play()
			
		self.visible = false
		Global.player_has_bluekey = true
		print("has the blue key")

