extends Area2D
signal hit
@export var speed = 200
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2.0, screen_size.y * 0.70)

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x = +1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	
	if velocity.x > 0 and $AnimatedSprite2D.animation != "pixil-frame-1":
		$AnimatedSprite2D.animation = "right"
	elif velocity.x < 0 and $AnimatedSprite2D.animation != "pixil-frame-2":
		$AnimatedSprite2D.animation = "left"
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()

func start(pos):
	position = pos
	show()
	$CollisionShape2d.disabled = false


func _on_area_entered(area: Area2D) -> void:
	hide()
	hit.emit()
