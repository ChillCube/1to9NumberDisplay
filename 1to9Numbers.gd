@tool
extends SmoothUI
class_name DigitNumbers

@export_range(0, 9) var number : int:
	set(val):
		number = val;
		if number_resource:
			_ensure_sprite()
			_set_sprite_number(val)

@export var number_resource : NumberResource;

var sprite : Sprite2D;

func _ensure_sprite() -> void: # Needs to be a seperate node, to allow animations
	if !sprite:
		sprite = Sprite2D.new();
		add_child(sprite)
		sprite.global_position = global_position;

func _ready() -> void:
	super()
	scale = Vector2(1,1);
	mover.global_target_scale = Vector2(1,1);

func _set_sprite_number(_number : int):
	if !number_resource:
		return
	_ensure_sprite();
	match _number:
		0:
			sprite.texture = number_resource.zero
		1:
			sprite.texture = number_resource.one
		2:
			sprite.texture = number_resource.two
		3:
			sprite.texture = number_resource.three
		4:
			sprite.texture = number_resource.four
		5:
			sprite.texture = number_resource.five
		6:
			sprite.texture = number_resource.six
		7:
			sprite.texture = number_resource.seven
		8:
			sprite.texture = number_resource.eight
		9:
			sprite.texture = number_resource.nine
