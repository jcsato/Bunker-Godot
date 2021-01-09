extends Node2D

var actors : Array
var enemies : Array
var players : Array
var unitSelected : bool = false

onready var ui : Node = get_node("UI")
onready var map : Node = get_node("Map")
onready var cursor : Node = load('res://Cursor.tscn').instance()

func on_end_turn():
	pass

func move_cursor(movement : Vector2):
	map.move(cursor, movement)

func confirm():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

	var mapWidth = rand_range(4, 9)
	var mapHeight = rand_range(4, 9)
	map.create_map(mapWidth, mapHeight)

	var numEnemies = rand_range(1, 4)
	var enemyScene = load('res://Entities/Enemy.tscn')
	for i in range(0, numEnemies):
		var enemy = enemyScene.instance()
		enemy.health = rand_range(1, 6)
		enemy.attack = 1
		enemies.append(enemy)
		add_child(enemy)

	var playerScene = load('res://Entities/Player.tscn')
	var player = playerScene.instance()
	player.health = 5
	player.attack = 2
	players.append(player)
	add_child(player)
	
	map.place_enemies(enemies)
	map.place_players(players)
	
	cursor.position = players[0].position
	add_child(cursor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

