extends Area2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func delay(seconds: float):
	await get_tree().create_timer(seconds).timeout
	
func _on_area_entered(area):
	if area.is_in_group("player") and !Global.boss_triger:
		get_tree().paused = true
		$"../AudioStreamPlayer".play()
		await self.delay(0.4)
		$"../Amalgamate".go_to(300, 114)
		await self.delay(0.4)
		$"../Amalgamate".go_to(330, 114)
		await self.delay(0.4)
		$"../Amalgamate".go_to(368, 114)
		await self.delay(3)
		get_tree().paused = false
