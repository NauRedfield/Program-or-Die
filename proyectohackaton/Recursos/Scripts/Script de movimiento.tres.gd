extends CharacterBody2D

@export var velocidad_movimiento: float
@export var velocidad_salto: float
@onready var spray_animacion = $Animacion
@export var salud = 4
var jugador_derecha = true
var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")
var inmune: bool = false

func _physics_process(delta): # Sistema de movimiento
	
	MovimientoX()
	Giro()
	Salto(delta)
	Act_Animaciones()
	move_and_slide()

func _process(delta): # Sistema de vida
	
	Daño_crtl()

func Daño_crtl():
	if inmune == true:
		if salud < 0:
			salud - 1
			inmune == false
		if salud <= 0:
			get_tree().reload_current_scene()

func Giro():
	if (jugador_derecha and velocity.x < 0) or (not jugador_derecha and velocity.x > 0): #Moviemientos verticales
		scale.x *= -1
		jugador_derecha = not jugador_derecha

func MovimientoX():

	var Input_axis = Input.get_axis("move_left", "move_right")
	velocity.x = Input_axis * velocidad_movimiento

func Salto(delta):
	if Input.is_action_just_pressed("Salto") and is_on_floor():
		velocity.y = -velocidad_salto
	
	if not is_on_floor():
		velocity.y += gravedad * delta

func Act_Animaciones():
	if not is_on_floor():
		if velocity.y < 0:
			spray_animacion.play("Salto")
		else:
			spray_animacion.play("Caida")
		return
	
	if velocity.x:
		spray_animacion.play("Correr")
	else:
		spray_animacion.play("Reposo")
