extends Area2D
class_name Coin

signal coin_collected  # Señal que podemos conectar para sumar puntos o reproducir un sonido

func _on_body_entered(body):
	if body.is_in_group("player"):  # Mejor que usar el nombre del nodo
		coin_collected.emit()  # Emitimos la señal
		queue_free()  # Eliminamos la moneda
