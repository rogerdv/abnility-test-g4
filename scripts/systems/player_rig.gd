extends Node3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_dir


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_player():
	return $player

func get_camera():
	return $pivot/Camera3D	
		
func face_to(dir:Vector2):
	var a = $player.signed_angle_to(transform.basis.z.normalized(), Vector3(dir.x, 0, dir.y).normalized(), Vector3.UP)
		#then just rotate about y
		#$player.rotate_y(a)
	$player.rotation = Vector3($player.rotation.x,a,$player.rotation.z)
			
func move(dir:Vector2, delta):
	
	if dir!=Vector2.ZERO:
		current_dir = dir
		var speed = delta*2*$player.speed_mod
		$player.get_animator().playback_speed=$player.speed_mod
		$player.play_anim("Run")
		#var rel = $player.translation + Vector3(dir.x,0,dir.y)*-1
		#$player.look_at(rel,Vector3.UP)
		face_to(dir)
		#var a = $player.signed_angle_to(transform.basis.z.normalized(), Vector3(dir.x, 0, dir.y).normalized(), Vector3.UP)
		#then just rotate about y
		#$player.rotate_y(a)
		#$player.rotation = Vector3($player.rotation.x,a,$player.rotation.z)
		var coll = $player.move_and_collide(Vector3(dir.x,0,dir.y)*speed)
		$pivot.translation = $player.translation
	else:
		$player.get_animator().playback_speed=1.0
		if not $player.get_animator().is_playing(): 
			$player.play_anim("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
