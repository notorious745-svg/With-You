extends Control
@onready var timer: Timer = $Timer
func _ready(): timer.start()
func _on_Timer_timeout(): SceneRouter.goto("res://scenes/flow/MainMenu.tscn")
