extends Control

func _ready():
	# Conectando os sinais dos botões usando funções anônimas
	$AudioStreamPlayer2D.play()
	$ButtonIniciarJogo.connect("pressed", func():
		# Lógica para iniciar o jogo
		print("Iniciando o jogo...")
		# Exemplo: mudar para a cena do jogo
		get_tree().change_scene_to_file("res://Levels/SupplyRoom.tscn")
	)
	
	
	$ButtonSair.connect("pressed", func():
		# Lógica para sair do jogo
		print("Saindo do jogo...")
		# Exemplo: fechar o jogo
		get_tree().quit()
	)
	

