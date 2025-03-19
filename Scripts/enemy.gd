extends CharacterBody2D
class_name  Enemy

@onready var movement: Movement  =$"Movement" as Movement
@onready var sensor: Area2D = $"Sensor"
@onready var Rotate: Timer = $"RotateDirection"

var player: CollisionObject2D
func _ready():
	movement.setup(self)

func _physics_process(delta):
	if player != null:
		var direction = player.global_position - global_position
		var distancia = global_position.distance_to(player.global_position)
		if distancia != 10: 
			movement.move(direction)
	else:
		if Rotate.is_stopped():
			Rotate.start()

func _on_sensor_body_entered(body):
	player = body


func _on_sensor_body_exited(body: Node2D) -> void:
	player = null


func _on_rotate_direction_timeout() -> void:
	var x_lado = [10, -10].pick_random()
	var y_lado = [10, -10].pick_random()
	var vectorNuevo = Vector2(x_lado, y_lado)
	movement.move(vectorNuevo)
