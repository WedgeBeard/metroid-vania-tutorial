extends Node
# This is a Singleton (Global Script)

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
	
func PlayerEnteredTheEndDoor(nextLevel : String):
	player.SwitchStateToUncontrollable()
	
	if nextLevel:
		get_tree().call_deferred("change_scene_to_file", nextLevel) #using call_deferred instead of change_scene_to_file directly due to error
	else:
		emit_signal("gameOver")
	
	
