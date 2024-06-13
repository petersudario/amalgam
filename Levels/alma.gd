extends CharacterBody2D

class_name Enemy

@export var speed: float = 28
@onready var target = get_tree().get_nodes_in_group("player")[0]
@onready var animation = $Alma/ChaserPlayer
@onready var sound = $Alma/AudioStreamPlayer2D

func _physics_process(delta):
	animation.play("new_animation")
	if target == null:
		var target = get_tree().get_nodes_in_group("player")

	if target != null:
		var direction = (target.position - position).normalized()
		velocity = direction * speed
		move_and_slide()
		
func _on_Enemy_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(50)
