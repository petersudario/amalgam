extends Area2D

class_name BlueKeyObject

@onready var delay_timer = $Timer
@onready var player = get_tree().get_nodes_in_group("player")[0]
# Called when the node enters the scene tree for the first time.
func _ready():
	if (Global.player_has_bluekey):
		self.visible = false



# Function to wait for a given number of seconds
func wait(seconds : int):
	delay_timer.wait_time = seconds
	delay_timer.start()
	await delay_timer.timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
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

