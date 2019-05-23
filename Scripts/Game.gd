extends Spatial

export onready var BOLA = get_tree().get_root().find_node("Bola",true,false)
var dir = Vector3()
var force = 20
signal Goal(Player_id)
func _ready():
	reset_pitch()
	Global.Root = self
	$GUI.connect("finished",self,"_on_game_finished")
	$GUI.connect("restart",self,"_on_game_restart")
	pass

func reset_pitch():
	
	var ball_spawn = get_tree().get_root().find_node("Ball",true,false)
	var player1 = $StartPositions/Player1
	var player2 = $StartPositions/Player2	
	BOLA.translation = ball_spawn.translation
	$Player/Cubedude.translation = player1.translation
	$Player/Cubedude2.translation = player2.translation
	get_tree().call_group("Player", "can_move", true)
	lock_ball(false)
	
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

#warning-ignore:unused_argument
func _on_Gol_body_entered(body, goal_id):
	
	get_tree().call_group("Player", "can_move", false)
	
	if(goal_id == 1):
		print("Gol 1")
		emit_signal('Goal', goal_id)
	else:
		emit_signal('Goal', goal_id)
		
	lock_ball(true)

	$Reset_pitch.start()
	pass

func _on_Reset_pitch_timeout():
	
	reset_pitch()
	
	pass # Replace with function body.

func lock_ball(is_locked : bool):
	
	$Bola.axis_lock_angular_x = is_locked
	$Bola.axis_lock_angular_z = is_locked
	$Bola.axis_lock_angular_y = is_locked
	$Bola.axis_lock_linear_x = is_locked
	$Bola.axis_lock_linear_y = is_locked
	$Bola.axis_lock_linear_z = is_locked
	
	
	pass
	
func _on_game_finished(player_id):
	
	print("Cabou o jogo, o vencedor foi o jogador %s" % str(player_id))
	get_tree().paused = true

	
	pass
func _on_game_restart():
	get_tree().paused = false
	get_tree().reload_current_scene()
	

