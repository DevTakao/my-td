extends CharacterBody2D

const CODE_NAME = 'axeman'
const DAMAGE = 1
const SPEED = 50
var hp = 5;

const TRAVEL_LIMIT = 900
var travelled_distance = 0

func _physics_process(delta):
	var direction = Vector2.LEFT
	velocity = direction * SPEED * delta
	
	move_and_collide(velocity)

func take_damage(damage: int):
	hp -= damage
	if hp <= 0:
		queue_free()

func attack():
	$AnimationPlayer.play('attack')
	var body = $AttackRange.get_overlapping_bodies()[0];
	if body.has_method("take_damage"):
		body.take_damage(DAMAGE)


func _on_attack_speed_timeout() -> void:
	attack()

func _on_attack_range_body_entered(body: Node2D) -> void:
	attack()
	$AttackInterval.start()

func _on_attack_range_body_exited(body: Node2D) -> void:
	$AttackInterval.stop()
	$AnimationPlayer.stop()
