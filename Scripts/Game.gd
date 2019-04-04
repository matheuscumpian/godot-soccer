extends Spatial

export onready var BOLA = get_tree().get_root().find_node("Bola",true,false)
var dir = Vector3()
var force = 20
func _ready():
	pass



func _on_Area_body_entered(body, goal_id):
	
	if(body == BOLA):
		dir = Vector3(1,1,0) if goal_id == 1 else Vector3(-1,1,0)
		$BolaPresa.start()
	
	
	pass 


func _on_BolaPresa_timeout():
	
	BOLA.apply_impulse(Vector3(), dir * force)
	
	pass 


func _on_Area_body_exited(body):
	if(body == BOLA):
		$BolaPresa.stop()
	
	pass 

func _on_Gol_body_entered(body, goal_id):
	
	if(goal_id == 1):
		print("Gol 1")
	else:
		print("Gol 2")
		
	$Bola.axis_lock_angular_x = true
	$Bola.axis_lock_angular_z = true
	$Bola.axis_lock_angular_y = true
	$Bola.axis_lock_linear_x = true
	$Bola.axis_lock_linear_y = true
	$Bola.axis_lock_linear_z = true
	
	pass