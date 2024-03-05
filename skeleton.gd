extends CharacterBody2D

@onready var Player_pos = get_node("/root/Game/Player")

func _physics_process(_delta):
	var follow_player = global_position.direction_to(Player_pos.global_position)
	var enemies_in_range = %agro_area.get_overlapping_bodies()
	var chase_enemy = global_position.direction_to(enemies_in_range.front().global_position)
	if enemies_in_range.size() > 0:
		velocity = chase_enemy * 150
		move_and_slide()
	else:
		velocity = follow_player * 150
		move_and_slide()
