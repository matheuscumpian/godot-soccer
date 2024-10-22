extends KinematicBody

export var Player_id : int
var motion = Vector3()
export var speed = 12
export var animaton_speed = 20
const GRAVITY = -5
const EPSILON = 0.0001
var can_move = true
# Called when the node enters the scene tree for the first time.
func _ready():
	
	move_lock_y
	rotation_degrees = Vector3()
	
	pass # Replace with function body.

func _physics_process(delta):
	if can_move:
		move()
	fall()
	
	
	pass
	
func _process(delta):
	
	
	animate()
	
	pass
	

func move():
	
	if Input.is_action_pressed("up_p%s" % Player_id) and not Input.is_action_pressed("down_p%s" % Player_id):
		
		motion.z = -1
		
		pass
	elif Input.is_action_pressed("down_p%s" % Player_id) and not Input.is_action_pressed("up_p%s" % Player_id):
	
		motion.z = 1
	
	else:
		
		motion.z = 0
	
	if Input.is_action_pressed("left_p%s" % Player_id) and not Input.is_action_pressed("right_p%s" % Player_id):
		
		motion.x = -1
	elif Input.is_action_pressed("right_p%s" % Player_id) and not Input.is_action_pressed("left_p%s" % Player_id):
		
		motion.x = 1
	
	else:
		motion.x = 0
		
	
	move_and_slide(motion.normalized() * speed, Vector3(0,1,0))


func fall():
	
	if is_on_floor():
		
		motion.y = 0
		
		pass
		
	else:
		motion.y += GRAVITY


	pass	
	
	
func animate():
	
	if not motion.z == 0 or not motion.x == 0:
		if motion.length() > EPSILON:
			$AnimationPlayer.play("Arms Cross Walk")
		look_at(Vector3(-motion.x, 0, -motion.z) * animaton_speed, Vector3.UP)
	else:
		$AnimationPlayer.stop()
		
	pass
	
func can_move(can_move):
	
	self.can_move = can_move
	
	pass