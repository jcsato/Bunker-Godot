extends Node

const TERRAIN_TYPES = preload('res://TerrainData.gd').TERRAIN_TYPES
var tiles : Array
var tileSize : float = 64.0

var mapWidth : int
var mapHeight : int

func get_tile_at_position (position):
	for x in range(tiles.size()):
		if tiles[x].position == position and tiles[x].hasBuilding == false:
			return tiles[x]
	return null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func move(obj : Node2D, delta : Vector2):
	var curPos = obj.position
	var newPos = curPos + Vector2(delta.x * tileSize, delta.y * tileSize)
	print("curPos: " + str(curPos))
	print("newPos: " + str(newPos))
	print("width: " + str(mapWidth * tileSize))
	print("height: " + str(mapHeight * tileSize))
	if newPos.x >= 0 && newPos.x <= mapWidth * tileSize && newPos.y >= 0 && newPos.y <= mapHeight * tileSize:
		obj.position = newPos

func create_map(width : int = 4, height : int = 4):
	mapWidth = width
	mapHeight = height
	place_tiles(mapWidth, mapHeight)

func place_tiles(mapWidth : int = 4, mapHeight : int = 4):
	var mapArea = mapWidth * mapHeight
	var widthBound = mapWidth * tileSize

	tiles = get_tree().get_nodes_in_group("Tiles")
	var tileScene = load('res://Tile.tscn')
	for x in range(0, mapArea):
		var tile = tileScene.instance()
		var xPos = x * tileSize
		var yPos = 0
		while xPos >= widthBound:
			yPos += tileSize
			xPos -= widthBound
		tile.position = Vector2(xPos + tileSize / 2, yPos + tileSize / 2)
		tile.set_terrain(TERRAIN_TYPES.values()[ randi()%TERRAIN_TYPES.size() ])
		tiles.append(tile)
		add_child(tile)

func place_enemies(enemies : Array):
	for enemy in enemies:
		var randomTile = tiles[rand_range(0, tiles.size())]
		while randomTile.get_occupant() != null:
			randomTile = tiles[rand_range(0, tiles.size())]
		randomTile.set_occupant(enemy)
		enemy.position = randomTile.position

func place_players(players : Array):
	for player in players:
		var startingTile = tiles[rand_range(0, tiles.size())]
		while startingTile.get_occupant() != null:
			startingTile = tiles[rand_range(0, tiles.size())]
		startingTile.set_occupant(player)
		player.position = startingTile.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
