extends Sprite2D

var state = 0 # 0 is unflipped, 1 is flipping to 3, 2 is flipping to 0, 3 is flipped
var flipping = false
var child = Node
var _texture : ImageTexture
var ID = -1
@export var _unflipped : CompressedTexture2D
@export var _flipped : CompressedTexture2D
@export var _scale = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.apply_scale(Vector2(_scale, _scale))
	self.texture = _unflipped
	#get_node("Area2D/CollisionShape2D").connect("was_clicked", _on_collision_shape_2d_was_clicked)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if flipping == true:
		flipCard()
	
func flipCard():
	if state == 0:
		if self.scale.x > 0.1:
			self.scale.x = self.scale.x - (0.05 * _scale)
		else:
			self.texture = _flipped
			state = 1
	elif state == 1:
		if self.scale.x < (1 * _scale):
			self.scale.x = self.scale.x + (0.05 * _scale)
		else:
			state = 3
			flipping = false
	elif state == 3:
		if self.scale.x > 0.1:
			self.scale.x = self.scale.x - (0.05 * _scale)
		else:
			self.texture = _unflipped
			state = 2
	elif state == 2:
		if self.scale.x < (1 * _scale):
			self.scale.x = self.scale.x + (0.05 * _scale)
		else:
			state = 0
			flipping = false
	else:
		pass

func _on_collision_shape_2d_was_clicked(_Node):
	if (state == 0 || state == 3) && flipping == false:
		flipping = true
	pass
	
