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
