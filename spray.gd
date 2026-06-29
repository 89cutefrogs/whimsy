extends Control
var particles 
func ready():
	particles = $GPUParticles2D

func _on_texture_button_pressed() -> void:
	$GPUParticles2D.emitting = true
