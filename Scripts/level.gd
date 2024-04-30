extends Node2D

@export var enemy : PackedScene
@export var apple : PackedScene

func _ready() -> void:
	GLOBAL.score = 0
	GLOBAL.credits = 1
	
func _process(delta) -> void:
	parallax_bg(delta)
	
	
	$PathSpawn/PathFollow.set_progress($PathSpawn/PathFollow.get_progress() + 80 * delta)
	
	
func parallax_bg(delta_time) -> void:
	$Background/Back.scroll_base_offset -= Vector2(1, 0) * 8 * delta_time
	$Background/Stars.scroll_base_offset -= Vector2(1, 0) * 16 * delta_time
	$Background/Planet_1.scroll_base_offset -= Vector2(1, 0) * 24 * delta_time
	$Background/Planet_2.scroll_base_offset -= Vector2(1, 0) * 24 * delta_time

func _on_timer_timeout():
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = $PathSpawn/PathFollow.global_position
	add_child(enemy_instance)

func _on_timer_2_timeout():
	var apple_instance = apple.instantiate()
	apple_instance.global_position = $PathSpawn/PathFollow.global_position
	add_child(apple_instance)
