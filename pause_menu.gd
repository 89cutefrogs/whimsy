extends Control

func _process(delta):
	escape()

func resume():
	get_tree().paused = false 
	
func pause():
	get_tree().paused = true
	
func escape(): 
	if Input.is_action_just_pressed("ui_cancel") and get_tree().paused ==false:
		pause()
		visible = true 
	elif Input.is_action_just_pressed("ui_cancel") and get_tree().paused ==true:
		resume() 
		visible = false 

func _on_resume_pressed() -> void:
	resume() 
	visible = false 

func _on_quit_pressed() -> void:
	get_tree().quit()
