extends Node
class_name EmoteController
@export var config_dir := "res://data/pets/emotes"
@onready var anim: AnimationTree = $"../AnimationTree"
@onready var sfx  := $"../SfxController"
var table := {}
func _ready() -> void:
    table = _load_configs(config_dir)
    var brain := get_parent().get_node("PetBrain")
    if brain: brain.intent_fired.connect(play)
func play(intent:String, intensity:float) -> void:
    if not table.has(intent):
        return
    var cfg = table[intent]
    if cfg.anim_name != "":
        anim.set("parameters/%s/transition_request" % cfg.anim_name, true)
    _spawn_bubble(_pick(cfg.bubble_texts))
    sfx.play_any(cfg.sfx_tags, intensity)
func _load_configs(path:String)->Dictionary:
    var d := {}
    for f in DirAccess.get_files_at(path):
        if f.ends_with(".tres"):
            var r := load(path + "/" + f)
            if r: d[r.intent] = r
    return d
func _pick(arr:Array) -> String:
    return arr[randi() % arr.size()] if arr.size()>0 else ""
func _spawn_bubble(text:String) -> void:
    if text == "": return
    var b := preload("res://scenes/ui/Bubble.tscn").instantiate()
    b.set_text(text)
    get_tree().current_scene.add_child(b)
    if b.has_method("follow_node"):
        b.follow_node(get_parent())
