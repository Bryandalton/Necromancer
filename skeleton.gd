extends CharacterBody2D

@onready var farmer_pos = get_node("/root/Game/Farmer")

func _physics_process(_delta):
	var direction = global_position.direction_to(farmer_pos.global_position)
	velocity = direction * 150
	move_and_slide()
