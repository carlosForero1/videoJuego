extends Node

var nivel = 1
func siguiente_nivel():
	get_tree().change_scene_to_file("res://escenaPrincipales/siguienteNivel.tscn")
