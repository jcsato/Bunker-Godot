extends Area2D

const Terrain = preload("res://TerrainData.gd").Terrain
var terrain : Terrain = null
var occupant : Entity = null

onready var terrainIcon : Sprite = get_node("TerrainIcon")

func set_occupant(occupant : Entity):
	occupant = occupant

func get_occupant():
	return occupant

func set_terrain(type : int):
	terrain = Terrain.new(type)

func get_terrain():
	return terrain

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
