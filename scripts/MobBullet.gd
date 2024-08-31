extends "res://scripts/Bullet.gd"
class_name MobBullet


func _ready() -> void:
	pass
	
	
func _on_MobBullet_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		queue_free()
