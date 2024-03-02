extends Area2D

func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy= enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BOLT= preload("res://bolt.tscn")
	var new_bolt = BOLT.instantiate()
	new_bolt.global_position = %shooting_point.global_position
	new_bolt.global_rotation = %shooting_point.global_rotation
	%shooting_point.add_child(new_bolt)

func _on_timer_timeout():
	shoot()
