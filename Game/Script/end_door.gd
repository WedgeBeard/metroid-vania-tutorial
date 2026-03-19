extends Area2D

# @export makes this variable show up in the inspector
@export var nextLevel : String

func _on_body_entered(_body: Node2D) -> void:
	GameManager.PlayerEnteredTheEndDoor(nextLevel)
