extends Control

func _ready():

	$ButtonIniciarJogo.connect("pressed", func():
		
		print("Iniciando o jogo...")
		
		get_tree().change_scene_to_file("res://Levels/SupplyRoom.tscn")
		Global.player_has_bluekey = false
		Global.boss_triger = false
	)
	
	
	$ButtonSair.connect("pressed", func():
		
		print("Saindo do jogo...")

		get_tree().quit()
	)
	

