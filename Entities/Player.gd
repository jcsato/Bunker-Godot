extends "res://Entities/Actor.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 8
	attack = 2
	initiative = rand_range(2, 4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
