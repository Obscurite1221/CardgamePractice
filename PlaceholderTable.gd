@tool
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass

func _draw():
	draw_rect(Rect2(Vector2(0.0, 0.0), Vector2(1920.0, 1080.0)), Color("964B00"))
