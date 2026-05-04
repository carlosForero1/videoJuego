extends Node2D

var puntos = 0
var vidas = 3

func _ready():
	actualizar_ui()

# SUMAR PUNTOS
func sumar_punto():
	puntos += 1
	actualizar_ui()
	print("Puntos:", puntos)

# PERDER VIDA
func perder_vida():
	vidas -= 1
	actualizar_ui()
	print("Vidas:", vidas)
	
	if vidas <= 0:
		game_over()

# ACTUALIZAR TEXTO EN PANTALLA
func actualizar_ui():
	$PuntajeLabel.text = "Puntos: " + str(puntos)
	$VidasLabel.text = "Vidas: " + str(vidas)

# GAME OVER
func game_over():
	print("GAME OVER")
	get_tree().paused = true
