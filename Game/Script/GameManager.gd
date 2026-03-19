extends Node

var player : PlayerController
var playerOriginalPos
@onready var root: Node = $"."

signal gameOver()

func PlayerEnteredResetArea():
	player.position = playerOriginalPos

func SpawnVFX(vfxToSpawn : Resource, position : Vector2):
	var vfxInstance = vfxToSpawn.instantiate()
	vfxInstance.global_position = position
	root.add_child(vfxInstance)
	
	return vfxInstance

func PlayerIsDead():
	emit_signal("gameOver")
	
func PlayerEnteredTheEndDoor():
	player.SwitchStateToUncontrollable()
	emit_signal("gameOver")
