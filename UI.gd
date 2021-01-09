extends Control

onready var gameManager : Node = get_node('/root/MainScene')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EndTurnButton_pressed():
	gameManager.on_end_turn()


func _unhandled_input(event):
	if event is InputEventKey:
		if (event.is_action_pressed("ui_left")):
			gameManager.move_cursor(Vector2(-1, 0))
			get_tree().set_input_as_handled()
		elif (event.is_action_pressed("ui_right")):
			gameManager.move_cursor(Vector2(1, 0))
			get_tree().set_input_as_handled()
		elif (event.is_action_pressed("ui_down")):
			gameManager.move_cursor(Vector2(0, 1))
			get_tree().set_input_as_handled()
		elif (event.is_action_pressed("ui_up")):
			gameManager.move_cursor(Vector2(0, -1))
			get_tree().set_input_as_handled()
		if (event.is_action_pressed("ui_select")):
			gameManager.confirm()
			get_tree().set_input_as_handled()
