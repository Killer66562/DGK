extends Node2D
class_name Character


var health: int
var bullet_speed: float
var bullet_acceleration: float
var bullet_veloctiy: Vector2
var shoot_cooldown: float
onready var can_shoot: bool = true


func _ready() -> void:
	$BulletTimer.wait_time = shoot_cooldown
	$BulletTimer.start()
	

func _before_shoot_bullet():
	can_shoot = false
	

func _shoot_bullet():
	_before_shoot_bullet()


func _on_BulletTimer_timeout() -> void:
	can_shoot = true


func _on_CollisionArea_die() -> void:
	queue_free()
