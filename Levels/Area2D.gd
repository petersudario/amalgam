extends Area2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func delay(seconds: int):
	get_tree().paused = true
	await get_tree().create_timer(seconds).timeout
	get_tree().paused = false
	
func _on_area_entered(area):
	if area.is_in_group("player") and !Global.boss_triger:
		get_tree().paused = true
		$"../AudioStreamPlayer".play()
		self.delay(5)
