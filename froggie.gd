extends CharacterBody2D
var jump
func _ready(): #autocalled on start 
	$Sprite2D.play("idle") 
	jump = 0 

func _physics_process(delta): #updates every frame 
	if not is_on_floor():
		velocity.y +=4000*delta #accesses the y component of velocity 
		#delta is time since last frame
	else: 
		velocity.x = 0 #if you dont have this the floor is made out of ice yikes 
	move_and_slide() #moves body based on velocity, handles collisions 


func _on_timer_timeout() -> void: #runs when timer is called so that the frog jumps
	var side= randf() #decides if it goes left or right 
	if side>position.x/get_viewport().size.x: 
		#weights it so its more common to move center 
		side = 1 #moves right
		$Sprite2D.flip_h=true 
	else: 
		side = -1 #moves left 
		$Sprite2D.flip_h=false 
	var height= randf_range(0.5,1.5) 
	var distance= randf_range(0.5,1.5) 
	velocity.y +=-800*height #jumps up 
	velocity.x +=400*side*distance 
	move_and_slide() #forces to start jumping immediately, 
	#so it doesnt get caught by above move n slide 


func _on_timer_2_timeout() -> void: #runs every time timer finishes 
	$Timer2.wait_time=randf_range(1, 5) #waits to start jump action 
	if is_on_floor(): #starts jump action 
		$Sprite2D.play("jump_start") 
		$Timer.start() 

func _on_sprite_2d_animation_finished() -> void:
	if not is_on_floor(): #starts looping animations 
		jump = 1 #frog is jumping 
		$Sprite2D.play("jump_hold")
	else:
		jump = 0 #frog is idle 
		$Sprite2D.play("idle")

func _on_sprite_2d_animation_looped() -> void:
	if position.y<460 or jump == 0: #if frog is in air or frog is idle
		pass
	else:
		$Sprite2D.play("jump_end")
