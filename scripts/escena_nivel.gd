extends Node2D

var puntos = 0
var vidas = 3
var nivel = 0

func _ready():
	actualizar_ui()

# SUMAR PUNTOS
func sumar_punto():
	puntos += 1
	actualizar_ui()
	
	if puntos >= 1:
		GameManager.nivel += 1
		print(GameManager.nivel)
		if GameManager.nivel == 4:
			juego_finalizado()
		else:
			siguiente_nivel()

# PERDER VIDA
func perder_vida():
	vidas -= 1
	actualizar_ui()
	
	if vidas <= 0:
		game_over()

# ACTUALIZAR TEXTO EN PANTALLA
func actualizar_ui():
	$PuntajeLabel.text = "Puntos: " + str(puntos)
	$VidasLabel.text = "Vidas: " + str(vidas)

# GAME OVER
func game_over():
	GameManager.nivel = 1
	get_tree().change_scene_to_file("res://escenaPrincipales/gameOver.tscn")

func siguiente_nivel():
	GameManager.siguiente_nivel()
	queue_free()
	
func juego_finalizado():
	get_tree().change_scene_to_file("res://escenaPrincipales/juegoTerminado.tscn")

	
	
