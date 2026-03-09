extends Node

var player
var playerOriginalPos
@onready var root: Node = $"."

func PlayerEnteredResetArea():
	player.position = playerOriginalPos

func SpawnVFX(vfxToSpawn : Resource, position : Vector2):
	var vfxInstance = vfxToSpawn.instantiate()
	vfxInstance.global_position = position
	root.add_child(vfxInstance)
	
	return vfxInstance
