extends CharacterBody2D

var direction_to_player = Vector2.ZERO

func _ready():
	Globals.connect("update_player_position", update_pos)

func _physics_process(_delta):
	var enemies_in_range = %agro_area.get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		var chase_enemy = global_position.direction_to(enemies_in_range.front().global_position)
		velocity = chase_enemy * 150
		move_and_slide()
	else:
		velocity = direction_to_player * 150
		move_and_slide()

func update_pos(player_position):
	direction_to_player = global_position.direction_to(player_position)
