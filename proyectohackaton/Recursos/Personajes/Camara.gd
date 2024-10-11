extends Camera2D

@export var Seguimiento_objeto: CharacterBody2D
func _process(delta):
	position = Seguimiento_objeto.position
	pass
