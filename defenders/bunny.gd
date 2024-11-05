extends StaticBody2D

const ATTACK_RANGE = 300
const CARROT_BULLET = preload("res://defenders/carrot_bullet.tscn")

@onready var shooting_point = $ShootingPoint

var hp = 5;

func _ready():
	# define attack range
	%RayCast2D.target_position.x = ATTACK_RANGE

func _physics_process(delta: float) -> void:
	# check enemy in range
	var collider = %RayCast2D.get_collider()
	start_attacking() if collider else stop_attacking()

func start_attacking():
	if %AttackInterval.is_stopped():
			%AttackInterval.start()

func stop_attacking():
	if !%AttackInterval.is_stopped():
			%AttackInterval.stop()

func shoot_carrot_bullet():
	var bullet_instance = CARROT_BULLET.instantiate()
	bullet_instance.global_position = shooting_point.global_position
	get_tree().root.add_child(bullet_instance)

func _on_attack_interval_timeout():
	shoot_carrot_bullet()

func take_damage(damage: int):
	hp -= damage
	if hp <= 0:
		queue_free()
