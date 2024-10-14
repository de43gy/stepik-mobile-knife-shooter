extends CharacterBody2D
class_name Target

var speed := PI
var sticking_depth := 20

@onready var attached_knives := $ItemsContainer

func _physics_process(delta: float):
	rotation += speed * delta

func attach_to_target(knife: Node2D, collision_position: Vector2, collision_normal: Vector2):
	print("knife = ", knife, " collision_position = ", collision_position, " collision_normal = ", collision_normal)
	knife.reparent(attached_knives, true)
	knife.global_position = collision_position + collision_normal * (sticking_depth + randi_range(1, 30))
	knife.rotation = -self.rotation
	knife.set_physics_process(false)
