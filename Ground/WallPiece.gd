extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var fall_speed:float = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	#var val = connect("wall_deleted", get_parent(), "_on_wall_deleted")
	#print("pos: ", get_global_position().y)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_y =  get_position().y + (fall_speed * delta)
	var new_pos = Vector2(position.x, new_y)
	set_position(new_pos)


