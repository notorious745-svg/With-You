extends Node
class_name SfxController
@export var bark_soft: Array[AudioStream]
@export var bark_mid:  Array[AudioStream]
@export var whine:     Array[AudioStream]
@export var whine_soft:Array[AudioStream]
@export var purr:      Array[AudioStream]
@onready var player := AudioStreamPlayer3D.new()
func _ready() -> void:
    add_child(player)
func play_any(tags:Array[String], intensity:float) -> void:
    if tags.is_empty(): return
    var tag = tags[randi() % tags.size()]
    var bank: Array = get(tag)
    if bank.is_empty(): return
    player.stream = bank[randi() % bank.size()]
    player.volume_db = lerp(-8.0, 0.0, clamp(intensity,0,1))
    player.pitch_scale = lerp(0.9, 1.1, randf())
    player.play()
