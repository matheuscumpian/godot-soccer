extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
var gols_a = 0
var gols_b = 0
var player_id
signal finished(player_id)
signal restart
# Called when the node enters the scene tree for the first time.
func _ready():
	$NinePatchRect/Label.text = str(0)
	$NinePatchRect/Label3.text = str(0)
	var gols = get_tree().get_root().find_node('Game',true,false)
	gols.connect("Goal",self,"_on_goal_entered")
	pass 

#func _process(delta):
	

func _on_goal_entered(goal_id):
	
	if(goal_id == 1):
		gols_a += 1
		$NinePatchRect/Label.text = str(gols_a)
	else:
		gols_b += 1
		$NinePatchRect/Label3.text = str(gols_b)
	
	if gols_a == 3:
		player_id = 2
		emit_signal("finished", player_id)
		$Popup/Label.text = "Player 2 wins !"
		$Popup.popup_centered()
	if gols_b == 3:
		player_id = 1
		emit_signal("finished", player_id)
		$Popup/Label.text = "Player 1 wins !"
		$Popup.popup_centered()
		pass
	
	pass

func _on_Button_pressed():
	emit_signal("restart")
	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().quit()
	pass # Replace with function body.
