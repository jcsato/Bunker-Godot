extends Node

const TERRAIN_TYPES = {
	LIGHT = 0,
	MEDIUM = 1,
	HEAVY = 2
}

class Terrain:
	var type : int
	var texture : Texture
	
	var movementCost : int

	func _init (type : int):
		self.type = type
		var texture
		var movementCost
		if type == TERRAIN_TYPES.LIGHT:
			texture = preload("res://Sprites/terrain1.png")
			movementCost = 1
		elif type == TERRAIN_TYPES.MEDIUM:
			texture = preload("res://Sprites/terrain2.png")
			movementCost = 2
		elif type == TERRAIN_TYPES.HEAVY:
			texture = preload("res://Sprites/terrain3.png")
			movementCost = 3
		self.texture = texture
		self.movementCost = movementCost
