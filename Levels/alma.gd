extends CharacterBody2D

class_name Enemy

@export var speed: float = 28

@onready var target = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	if target == null:
		var target = get_tree().get_nodes_in_group("player")

	if target != null:
		var direction = (target.position - position).normalized()
		velocity = direction * speed
		move_and_slide()
