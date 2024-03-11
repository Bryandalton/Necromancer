extends CharacterBody2D

@onready var Player_pos = get_node("/root/Game/Player")

func _physics_process(_delta):
	var follow_player = global_position.direction_to(Player_pos.global_position)
	var enemies_in_range = %agro_area.get_overlapping_bodies()
	#if there is an enemy in range code works as intended, but skeleton will not follow player check layers
	if enemies_in_range.size() > 0:
		var chase_enemy = global_position.direction_to(enemies_in_range.front().global_position)
		velocity = chase_enemy * 150
		move_and_slide()
	else:
		velocity = follow_player * 150
		move_and_slide()
