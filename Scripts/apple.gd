extends Node2D

const SPEED = 40

@onready var extra_life : bool = false


func _process(delta) -> void:
	match extra_life:
		false: global_position.x -= SPEED * delta

func explosion_ctrl() -> void:
	extra_life = true
	$Area2D.queue_free()

func _on_area_2d_body_entered(body) -> void:
	if body is Player:
		explosion_ctrl()
		GLOBAL.credits += 1


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


