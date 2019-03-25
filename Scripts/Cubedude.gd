extends KinematicBody


var motion = Vector3()
export var speed = 10
const GRAVITY = -5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	move()
	fall()
	
	
	pass
	

func move():
	
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		
		motion.z = -1
		
		pass
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
	
		motion.z = 1
	
	else:
		
		motion.z = 0
	
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		
		motion.x = -1
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		
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