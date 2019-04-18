extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 8
# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("move_left") && !Input.is_action_pressed("move_right")
			&& self.transform.origin.x >= 60):
		self.transform.origin -= Vector2(speed,0)
	elif(Input.is_action_pressed("move_right") && !Input.is_action_pressed("move_left")
			&& self.transform.origin.x <= 600-60):
		self.transform.origin += Vector2(speed,0)