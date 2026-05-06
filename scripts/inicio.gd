extends Node2D


func _on_boton_inicio_pressed():
	get_tree().change_scene_to_file("res://escenaPrincipales/niveles/escenaNivel.tscn")	


func _on_boton_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://escenaPrincipales/tutorial.tscn")	
