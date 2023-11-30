extends CollisionShape2D

var mouseEntered = false
signal is_clicked

func _process(delta):
	if Input.is_action_pressed("MouseLeft") && mouseEntered == true && $"../../..".selected.size() < 2:
		self.get_parent().get_parent().emit_signal("was_clicked", $"../..")
		self.emit_signal("is_clicked")

func _on_area_2d_mouse_shape_entered(shape_idx):
	mouseEntered = true


func _on_area_2d_mouse_shape_exited(shape_idx):
	mouseEntered = false
