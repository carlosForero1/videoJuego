extends CharacterBody2D

@export var speed = 600

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("derecha"):
		direction.x += 1
	if Input.is_action_pressed("izquierda"):
		direction.x -= 1

	velocity.x = direction.x * speed
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_method("configurar"):  # asegurarse que es basura
		if body.es_reciclable:
			print("♻️ Correcto")
		else:
			print("🚫 Incorrecto")
		
		body.queue_free()  
