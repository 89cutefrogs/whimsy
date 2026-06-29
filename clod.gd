extends CharacterBody2D
var inity
const CLOD = preload("uid://bxc41nwmmhvdj")
const CLODY = preload("uid://bf2k02k47jcvy")

func _ready(): 
	inity = position.y
	clodsettings()
	
func _physics_process(delta): 
	move_and_slide() 
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	position.x = -600
	clodsettings()

func clodsettings():
	position.y = inity+randf_range(-5, 5)
	velocity.x = 70+randf_range(-20, 20)
	var clod = randf()
	if clod >0.3:
		modulate.a = randfn(0.5,0.4) #modifies cloud opacity 
		#randfn is normal dist. random, 1st num = mean, 2nd num = std. dev 
	else: 
		modulate.a = 0
	scale.x = randf_range(0.7,1.5) 
	if randf()>0.5:
		$Clod.texture = CLODY
	else: 
		$Clod.texture = CLOD
