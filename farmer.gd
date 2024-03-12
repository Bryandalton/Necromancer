extends CharacterBody2D
const DEAD = preload("res://dead_farmer.tscn")

var health = 3
var direction_to_player = Vector2.ZERO

func _ready():
	Globals.connect("update_player_position", update_pos)

func _physics_process(_delta):
	velocity = direction_to_player * 150
	move_and_slide()
	var overlapping_mobs = %hurt_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		take_damage()

func take_damage():
	health -= 1
	if health == 0:
		queue_free()
		var dead = DEAD.instantiate()
		get_parent().call_deferred('add_child', dead)
		dead.global_position = global_position

func update_pos(player_position):
	direction_to_player = global_position.direction_to(player_position)
