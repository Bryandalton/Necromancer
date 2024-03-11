extends CharacterBody2D

func _on_reanimate_box_body_entered(_body):
	queue_free()
	const RAISED = preload("res://skeleton.tscn")
	var raised = RAISED.instantiate()
	get_parent().call_deferred("add_child", raised)
	raised.global_position = global_position
