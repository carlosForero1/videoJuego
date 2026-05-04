extends Node2D

func _on_button_pressed() -> void:
		var ruta  = "res://escenaPrincipales/niveles/escenaNivel" + str(GameManager.nivel) + ".tscn"
		get_tree().change_scene_to_file(ruta)
