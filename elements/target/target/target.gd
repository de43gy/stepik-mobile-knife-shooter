extends CharacterBody2D
class_name Target

var speed := PI
var sticking_depth := 20
var random_depth_range := Vector2(1, 30)

@onready var attached_knives := $ItemsContainer

func _physics_process(delta: float):
	rotation += speed * delta

func attach_to_target(knife: Node2D, collision_position: Vector2, collision_normal: Vector2):
	knife.reparent(attached_knives, true)
	var random_depth = sticking_depth + randi_range(random_depth_range.x, random_depth_range.y)
	knife.global_position = collision_position + collision_normal * random_depth
	knife.rotation = -self.rotation
	knife.set_physics_process(false)
