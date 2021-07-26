extends KinematicBody2D

const SPEED = 70

var movedir = Vector2(0,0)
var spritemir = 0
var playertype = "WhiteMage"
var animrun 
var animidle 
var fix

func _ready():
	player_change()

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritemir_loop()
	anim_switch()
	

func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP	    = Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))

func spritemir_loop():
	if movedir.x == -1:
		$playersprite.flip_h = true
	elif movedir.x == 1:
		$playersprite.flip_h = false

func anim_switch():
	if movedir != Vector2(0,0):
		$playersprite.animation = animrun
	else:
		$playersprite.animation = animidle

func player_change():
	if playertype == "SlimeBoy":
		 animrun = "SBrun"
		 animidle = "SBidle"
	elif playertype == "GoldKnight":
		animrun = "GKrun"
		animidle = "GKidle"
	elif playertype == "WhiteMage":
		animrun = "WMrun"
		animidle = "WMidle"
		
		
func _input(event):
	if event is InputEventScreenTouch:
		if position.x < 160:
			if event.pressed:
				fix = [event.position.x, event.position.y]
			else:
				fix = []
				
