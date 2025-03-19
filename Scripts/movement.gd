extends Node
class_name Movement #Registra la clase y nos permite autocompletado

@export var speed: float = 32.0 #Permite ver las variables en otras partes del codigo
var speed_max: float = 32.0
var character: CharacterBody2D
#Inyeccion par tener referencia de que o a quien se le aplica
func setup(character2D: CharacterBody2D):
	character = character2D

func move(input_vector: Vector2):
	character.velocity = input_vector.normalized() * speed
	character.move_and_slide()

func stop_movement():
	character.velocity = Vector2.ZERO
