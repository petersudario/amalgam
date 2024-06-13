extends Sprite2D

var hp  = 5 setget set_hp

signal hp_changed
signal died


func take_dmg(dmg):
	set_hp(hp - dmg)

func set_hp( new_hp ):
	emit_signal("hp_changed", new_hp)
	hp = new_hp
	if hp <= 0:
		die()

func die()
	emit_signal("died")
	queue_free()
	
