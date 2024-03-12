extends CharacterBody2D

signal health_depleted

var health = 100

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 300
	move_and_slide()
	Globals.player_position = global_position
	const DAMAGE_RATE = 5
	var overlapping_mobs = %hurt_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <=0:
			health_depleted.emit()
			
