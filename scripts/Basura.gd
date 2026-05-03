extends CharacterBody2D

@export var speed = 150
var es_reciclable = false

@onready var label = $Label
@onready var sprite = $Sprite2D

func configurar(nombre, reciclable, dificultad):
	es_reciclable = reciclable
	
	if label:
		label.text = nombre

	speed = 150 + (dificultad * 20)

	if reciclable:
		sprite.modulate = Color.GREEN
	else:
		sprite.modulate = Color.RED

func _physics_process(delta):
	velocity.y = speed
	move_and_slide()

	if position.y > 700:
		queue_free()
