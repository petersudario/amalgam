extends CharacterBody2D

class_name PlayerCharacter

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, 1)
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var hud: Control = $HUD
@onready var hp_label: Label = $HUD/HPLabel
var max_hp: int = 100
var current_hp: int = 100
var has_bluekey = false

func _ready():
	update_hud_position()
	update_hp_display()
	if Global.player_position != Vector2():
		global_position = Global.player_position
		Global.player_position = Vector2()
		
	update_animation_parameters(starting_direction)
	
func _process(delta):
	update_hud_position()

func _physics_process(_delta):
	
		var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
		update_animation_parameters(input_direction)
	
		velocity = input_direction * move_speed 
	
		move_and_slide()
	
		pick_new_state()
		
		
	
func update_animation_parameters(move_input : Vector2) :
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)


func pick_new_state():
	if (velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")


func take_damage(amount: int):
	current_hp -= amount
	if current_hp < 0:
		current_hp = 0
	update_hp_display()
	check_if_dead()


func heal(amount: int):
	current_hp += amount
	if current_hp > max_hp:
		current_hp = max_hp
		update_hp_display()


func check_if_dead():
	if current_hp <= 0:
		die()


func die():
	print("Player is dead!")
	get_tree().change_scene_to_file("res://Levels/death_screen.tscn")


func update_hp_display():
	hp_label.text = "HP: " + str(current_hp) + "/" + str(max_hp)


func update_hud_position():
	hud.position = Global.player_position

func _on_hitbox_area_entered(area):
	if area.is_in_group("Enemy"):
		take_damage(25)
