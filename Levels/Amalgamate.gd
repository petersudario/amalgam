extends CharacterBody2D

@export var speed: float = 60
@onready var target = get_tree().get_nodes_in_group("player")[0]
@onready var animation = $"../Amalgamate/AnimationPlayer"

func _physics_process(delta):
	
	animation.play("idle")
	
	if Global.boss_triger:
		animation.play("left")
		if target == null:
			var target = get_tree().get_nodes_in_group("player")

		if target != null:
			var direction = (target.position - position).normalized()
			velocity = direction * speed
			move_and_slide()


func go_to(x : int, y: int):
	self.global_position = Vector2(x, y)


func _on_area_inimigo_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(100)
