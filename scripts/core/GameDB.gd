extends Node
class_name GameDB
var breeds := {}
var items := {}
func _ready() -> void:
    breeds = _load_dir("res://data/breeds")
    items  = _load_dir("res://data/items")
func _load_dir(path: String) -> Dictionary:
    var d := {}
    for f in DirAccess.get_files_at(path):
        if f.ends_with(".tres") or f.ends_with(".res"):
            var r := load(path + "/" + f)
            if r: d[f] = r
    return d
