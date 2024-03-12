extends Node

signal update_player_position(player_position)

var player_position := Vector2(0, 0):
	get:
		return player_position
	set(_value):
		player_position = _value
		update_player_position.emit(player_position)
