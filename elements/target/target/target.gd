extends CharacterBody2D
class_name Target

var speed := PI

@onready var items_container := $ItemsContainer

func _physics_process(delta: float):
	rotation += speed * delta
