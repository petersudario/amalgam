extends Control



func _ready():

	$Equipe.visible = false
	$ButtonVoltar.visible = false

	$AudioStreamPlayer2D.play()
	$ButtonIniciarJogo.connect("pressed", func():
		# Lógica para iniciar o jogo
		print("Iniciando o jogo...")
		# Exemplo: mudar para a cena do jogo
		get_tree().change_scene_to_file("res://Levels/SupplyRoom.tscn")
	)
	
	$ButtonSobre.connect("pressed", func():
		$ButtonIniciarJogo.visible = false
		$ButtonSair.visible = false
		$ButtonVoltar.visible = true
		$Equipe.visible = true
	)
	
	$ButtonVoltar.connect("pressed", func():
		$ButtonIniciarJogo.visible = true
		$ButtonSair.visible = true
		$ButtonVoltar.visible = false
		$Equipe.visible = false
	)
	
	$ButtonSair.connect("pressed", func():
		# Lógica para sair do jogo
		print("Saindo do jogo...")
		# Exemplo: fechar o jogo
		get_tree().quit()
	)
	

