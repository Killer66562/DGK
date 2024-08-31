extends Node


var _score: int setget set_score, get_score


func set_score(s: int):
	_score = s
	
	
func get_score() -> int:
	return _score

	
func _ready() -> void:
	pass
