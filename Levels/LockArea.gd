extends Area2D

var count = 0
var is_in_area = false

func _ready():
	pass 

func _process(delta):
	if is_in_area:
		if count >= 15:
			get_tree().change_scene_to_file("res://Cenas/victory.tscn")
		elif Input.is_action_just_pressed("ui_accept"):
			$AudioStreamPlayer2D.play()
			count = count + 1
			print("Conta: ", count)
			



func _on_area_entered(area):
	if area.is_in_group("player"):
		print("Entrou na area da chave")
		is_in_area = true
