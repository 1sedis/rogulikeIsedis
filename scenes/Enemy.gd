extends KinematicBody2D

const SPEED = 70
var movedir = Vector2(0,0)
var count = 0

func _physics_process(delta):
	count += 1
	if count == 10:
		count = 0
		random_movement_loop()

func random_movement_loop():
	movedir.x = rand_range(-1, 1)
	movedir.y = rand_range(-1, 1)
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
