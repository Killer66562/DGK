extends Area2D


var speed: float
var velocity: Vector2
var acceleration: float


func _ready() -> void:
	pass
	
	
func _process(delta: float) -> void:
	speed += acceleration * delta
	position += velocity * speed * delta


func _on_Timer_timeout() -> void:
	queue_free()
