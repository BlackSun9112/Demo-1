extends Area2D
@onready var skeleton: AnimatedSprite2D = $Skeleton
signal player_died 
var speed = 50
var direction = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.alive:
		emit_signal("player_died", body)
	if body.name == "TileMapLayer":
		direction *= -1
		skeleton.flip_h = !skeleton.flip_h
