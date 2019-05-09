extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
var gols_a = 0
var gols_b = 0
signal finished
# Called when the node enters the scene tree for the first time.
func _ready():
	$NinePatchRect/Label.text = str(0)
	$NinePatchRect/Label3.text = str(0)
	var gols = get_tree().get_root().find_node('Game',true,false)
	gols.connect("Goal",self,"_on_goal_entered")
	
	pass 

#func _process(delta):
	pass

func _on_goal_entered(goal_id):
	
	if(goal_id == 1):
		gols_a += 1
		$NinePatchRect/Label.text = str(gols_a)
	else:
		gols_b += 1
		$NinePatchRect/Label3.text = str(gols_b)
	
	if(gols_a == 3 or gols_b == 3):
		
		emit_signal("finished")
		
		pass
	
	pass