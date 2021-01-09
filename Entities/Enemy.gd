extends "res://Entities/Actor.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	health = rand_range(1, 6)
	attack = rand_range(1, 3)
	initiative = rand_range(1, 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
