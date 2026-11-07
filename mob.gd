extends Area2D
@export var speed = 400

var directions = ["left", "right", "center"]
var pick: String = ""


func _ready() -> void:
	var screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2.0, screen_size.y * 0.1)
	rotation = PI
	randomize()
	pick = directions.pick_random()

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	velocity.y += 1

	if pick == "left":
		velocity.x -= 1
	elif pick == "right":
		velocity.x += 1
	else:
		velocity.x = 0
	# 3. Normalize the vector so diagonal movement isn't faster than straight lines
	velocity = velocity.normalized()
	
	# 4. Multiply by speed and delta, then add it to your node's position to actually move it!
	position += velocity * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
