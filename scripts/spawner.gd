extends Node2D

@export var basuras: Array[PackedScene]

func _ready():
	randomize()

func spawn_basura():
	if basuras.size() == 0:
		print("NO HAY BASURAS")  
		return
	
	var escena = basuras[randi() % basuras.size()]
	var obj = escena.instantiate()
	
	obj.position = Vector2(randi() % 600, 0)
	
	add_child(obj)

func _on_timer_timeout():
	spawn_basura()
