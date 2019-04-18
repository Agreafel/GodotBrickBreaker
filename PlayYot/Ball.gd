extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shot = false
var player = null
var speed = 400
var bounce_coeffecient = 1
var reflect = true
var velocity_def = (Vector2(1,-1).normalized())*speed
var velocity = velocity_def
var lives = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	if(get_node_or_null("../Player") != null):
		self.player = get_node("../Player")
		self.position = self.player.position
		self.position.y -= 50
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	if(self.shot):
		var collision = move_and_collide(velocity * delta)
		if collision:
			velocity = velocity.bounce(collision.normal)
			if collision.collider.has_method("hit"):
				collision.collider.hit()
		if(self.position.y > 850 && lives > 0):
			self.position = self.player.position
			self.position.y -= 50
			lives -= 1
			var velocity = velocity_def
			shot = false
	if(!self.shot && self.player != null):
		self.position = self.player.position
		self.position.y -= 50
	if(Input.is_action_pressed("move_up") && !self.shot):
		self.shot = true
	