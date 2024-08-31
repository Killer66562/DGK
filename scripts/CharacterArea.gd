extends Area2D
class_name CharacterArea


signal die


func _ready() -> void:
	pass
	

func emit_die():
	emit_signal("die")
