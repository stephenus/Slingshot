extends RigidBody2D

var drag_enabled = false

signal released

func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")


func _physics_process(delta):
	if drag_enabled:
		position = get_global_mouse_position()

func _input_event(viewport, event, shape_idx):
	if mode == MODE_STATIC:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT:
				drag_enabled = event.pressed
				if(not drag_enabled):
					emit_signal("released")
