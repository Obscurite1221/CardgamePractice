@tool
extends Node2D

var selected = []
var pairsMatched = 0
var currentLevel = 0
var populateLevel = false
var comparing = false
var cards = []
@export var boardPosition : Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	populateLevel = true
	cards.push_back(preload("res://Assets/templateCard.tscn"))
	#var connector = cards[0].instantiate()
	#connector.connect("was_clicked", selectCard)
	#connector.queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if populateLevel == true:
		var children = get_children()
		for n in children.size():
			children[n].queue_free()
		children.clear()
		generate_level()
	if selected.size() >= 2 && comparing == false:
		compareCards()
	queue_redraw()
	pass

func _draw():
	draw_rect(Rect2(Vector2(0.0, 0.0), Vector2(1920.0, 1080.0)), Color("964B00"))
	pass
	
func selectCard(card : Node):
	if selected.size() == 0 && card.state == 0:
		selected.push_back(card)
	elif selected.size() == 1 && card == selected[0]:
		selected.pop_back()
	elif selected.size() == 1 && card.state == 0:
		selected.push_back(card)
	pass
	
func compareCards():
	if selected[0].flipping == false && selected[1].flipping == false:
		comparing = true
		if selected[0].ID == selected[1].ID:
			pairsMatched += 1
		else:
			selected[0].flipping = true
			selected[1].flipping = true
		selected.pop_back()
		selected.pop_back()
		comparing = false
	pass
	
func generate_level(): #TODO: Finish this properly. This is just for testing.
	var child
	for x in 6:
		for y in 4:
			child = cards[0].instantiate()
			add_child(child)
			child.ID = ((x * 4) + y) / 2
			child.connect("was_clicked", selectCard)
			
			child.set_position(Vector2((x * 60) + boardPosition.x, (y * 80) + boardPosition.y))
	populateLevel = false
	
