extends CharacterBody2D

@export var tipo = "basura" 
@export var speed = 150

func _ready():
	add_to_group("basura")

func _physics_process(delta):
	velocity.y = speed
	move_and_slide()
