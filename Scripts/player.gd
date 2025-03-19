extends CharacterBody2D
class_name Player

@onready var movement: Movement = $Movement as Movement
#Hace que al momento de cargar, se carge en ese momento. Lo de as Movement es para completar

var input_vector: Vector2

func _ready():
	movement.setup(self) #refiriendose a las acciones en si mismo aplicadas al movement "un this"

func _process(delta):
	input_vector.x = Input.get_axis("move_left","move_right")
	input_vector.y = Input.get_axis("move_up","move_down")

func _physics_process(delta):
	movement.move(input_vector.normalized())
