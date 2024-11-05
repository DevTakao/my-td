extends Area2D

const SPEED = 400
const ATTACK_RANGE = 900
const DAMAGE = 1

var travelled_distance = 0

func _physics_process(delta):
	var direction = Vector2.RIGHT
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	
	if travelled_distance >= ATTACK_RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(DAMAGE) 
