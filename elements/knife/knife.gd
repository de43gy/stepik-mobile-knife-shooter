extends CharacterBody2D

var is_flying := false
var speed := 4500.0

func _physics_process(delta: float):
	if is_flying:
		var collision = move_and_collide(Vector2.UP * speed * delta)
		if collision:
			handle_collision(collision)
		else:
			var screen_limits = Rect2(Vector2.ZERO, get_viewport().size)
			if not screen_limits.has_point(global_position):
				queue_free()

func throw():
	is_flying = true

func handle_collision(collision: KinematicCollision2D):
	var collider := collision.get_collider()
	if collider is Target:
		attach_knife_to_target(collider, collision.get_position(), collision.get_normal())
		is_flying = false

func attach_knife_to_target(target: Target, collision_position: Vector2, collision_normal: Vector2):
	reparent(target.items_container, true)
	global_position = collision_position + collision_normal * (20 + randi_range(1, 30))
	rotation = -target.rotation
	set_physics_process(false)
