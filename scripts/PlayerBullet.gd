extends "res://scripts/Bullet.gd"


"res://scenes/Mob.tscn" var Mob


signal mob_on_damage(damage)
var damage: int


func _ready() -> void:
	pass
	

func _on_PlayerBullet_area_entered(area: Area2D) -> void:
	if area.is_in_group("mob"):
		emit_signal("mob_on_damage")
		queue_free()
