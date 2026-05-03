extends CharacterBody2D

@export var basura_scene: PackedScene
const BASURA = preload("uid://rp1ypcgnjrye")

var puntos = 0
var dificultad = 1

@onready var label = $Puntaje

func _ready():
	randomize()
	actualizar_ui()

func _on_timer_timeout():
	spawn_basura()

func spawn_basura():
	var b = BASURA.instantiate()

	b.position.x = randi_range(50, 750)
	b.position.y = 0

	# Tipos de basura
	var tipos = [
		{"nombre": "Botella", "reciclable": true},
		{"nombre": "Vidrio", "reciclable": true},
		{"nombre": "Orgánico", "reciclable": false},
		{"nombre": "Pilas", "reciclable": false}
	]

	var elegido = tipos.pick_random()

	b.configurar(elegido["nombre"], elegido["reciclable"], dificultad)

	add_child(b)

func sumar_puntos(valor):
	puntos += valor
	actualizar_ui()
	verificar_estado()

func actualizar_ui():
	label.text = "Puntos: " + str(puntos)

func verificar_estado():
	if puntos >= 100:
		print("🎉 GANASTE")
		get_tree().paused = true
	elif puntos < 0:
		print("💀 PERDISTE")
		get_tree().paused = true

func aumentar_dificultad():
	dificultad += 1
