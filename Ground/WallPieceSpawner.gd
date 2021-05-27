extends Node2D

export(PackedScene) var WallPiece

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var should_add_child: bool = false
var should_delete_wall: bool = false
var node_to_delete = Node2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#for i in range(1): 
	   #var wall_piece = WallPiece.instance()
	   #var new_y = i * 64
	   #print("new_y:", new_y)
	   #var new_position = Vector2(10, new_y)
	   #wall_piece.set_position(new_position) 
	   #add_child(wall_piece)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#   pass

func _physics_process(_delta):
	if should_add_child == true: 
		should_add_child = false
		spawn_new_wall()

	if should_delete_wall == true:
		should_delete_wall = false 
		node_to_delete.queue_free()

# Called whenever a block enters the new block spawn area
func _on_area_exited(_area):
	node_to_delete = _area.get_parent()
	should_delete_wall = true

func _on_area_entered(_area): 
	should_add_child = true


func spawn_new_wall():
	#print("area entered: ", _area.get_global_position().y)
	var wall_piece = WallPiece.instance()
	var new_pos = Vector2(0, wall_piece.get_position().y - 635)
	wall_piece.set_position(new_pos)
	add_child(wall_piece)
