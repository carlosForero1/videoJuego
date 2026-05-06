extends CharacterBody2D

@export var speed = 400

var objeto_cargado = null
var basura_cerca = null
@onready var anim = $AnimatedSprite2D
var contenedor_cerca = null

func _physics_process(delta):
	var direction = 0
	
	if Input.is_action_pressed("derecha"):
		direction += 1
	if Input.is_action_pressed("izquierda"):
		direction -= 1
	
	velocity.x = direction * speed
	move_and_slide()
	
	if direction != 0:
		anim.play("caminar")
		
		# Girar sprite según dirección
		anim.flip_h = direction < 0
	else:
		anim.play("idle")

# DETECTAR COSAS CERCA
func _on_detector_body_entered(body):
	if body.is_in_group("basura"):
		basura_cerca = body
	
	if body.is_in_group("contenedor"):
		contenedor_cerca = body

func _on_detector_body_exited(body):
	if body == basura_cerca:
		basura_cerca = null
	
	if body == contenedor_cerca:
		contenedor_cerca = null

func _input(event):
	if event.is_action_pressed("recoger"):
		
		# RECOGER
		if objeto_cargado == null and basura_cerca != null:
			objeto_cargado = basura_cerca
			objeto_cargado.visible = false


		# SOLTAR
		elif objeto_cargado != null and contenedor_cerca != null:
			if objeto_cargado.tipo == contenedor_cerca.tipo:
				get_parent().sumar_punto()
				$sonidoCorrecto.play()
			else:
				$sonidoIncorrecto.play()
				get_parent().perder_vida()
			
			objeto_cargado.queue_free()
			objeto_cargado = null
