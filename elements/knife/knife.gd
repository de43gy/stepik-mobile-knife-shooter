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
	var target := collision.get_collider()
	if target is Target:
		target.attach_to_target(self, collision.get_position(), collision.get_normal())
		is_flying = false
