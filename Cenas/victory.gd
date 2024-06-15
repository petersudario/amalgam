extends Control

func _ready():
	# Conectando os sinais dos botões usando funções anônimas
	$AudioStreamPlayer2D.play()

	
	$ButtonSair.connect("pressed", func():
		# Lógica para sair do jogo
		print("Saindo do jogo...")
		# Exemplo: fechar o jogo
		get_tree().quit()
	)
	

