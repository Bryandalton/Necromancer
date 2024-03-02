extends CharacterBody2D

var health = 3

@onready var player_pos = get_node("/root/Game/Player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player_pos.global_position)
	velocity = direction * 150
	move_and_slide()

func take_damage():
	health -= 1
	if health == 0:
		queue_free()
		const DEAD = preload("res://dead_farmer.tscn")
		var dead = DEAD.instantiate()
		# get_parent().add_child(dead)
		get_parent().call_deferred('add_child', dead)
		dead.global_position = global_position
