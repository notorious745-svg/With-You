extends Node
class_name PetBrain
signal need_changed(name: String, value: float)
signal mood_changed(mood: String)
signal intent_fired(intent: String, intensity: float)
@export var breed: Resource
var needs := {"hunger":0.2,"thirst":0.1,"energy":0.7,"affection":0.6}
var current_mood := "neutral"
func _process(dt: float) -> void:
    for k in needs.keys():
        needs[k] = clamp(needs[k] - 0.01*dt, 0.0, 1.0)
    if needs.get("hunger",1.0) < 0.25:
        react("hungry", 0.7)
func react(intent:String, intensity:float=0.5) -> void:
    emit_signal("intent_fired", intent, intensity)
