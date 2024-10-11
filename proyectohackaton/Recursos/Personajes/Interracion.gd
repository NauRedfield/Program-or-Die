extends StaticBody2D

var entrar = false

func _input(event):
	if event.is_action_pressed("Interactuar") and entrar == true:
		print("Hola a todos")

func _on_area_2d_body_entered(body):
	entrar = false

func _on_area_2d_body_exited(body):
	entrar = true
