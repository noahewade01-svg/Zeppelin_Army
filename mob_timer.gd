extends Timer

const mob_scene = preload("res://mob.tscn")

var screen_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	
	var random_x = randf_range(0, screen_size.x)
	
	mob.position = Vector2(random_x, -50)
	
	add_child(mob)
