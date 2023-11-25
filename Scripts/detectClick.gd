extends CollisionShape2D

var mouseEntered = false
signal was_clicked(Node)

func _process(delta):
	if Input.is_action_pressed("MouseLeft") && mouseEntered == true:
		emit_signal("was_clicked", self)

func _on_area_2d_mouse_shape_entered(shape_idx):
	mouseEntered = true


func _on_area_2d_mouse_shape_exited(shape_idx):
	mouseEntered = false
