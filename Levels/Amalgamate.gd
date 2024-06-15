extends CharacterBody2D

# Target X position
func go_to(x : int, y: int):
	self.global_position = Vector2(x, y)
