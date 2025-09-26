extends Node
func goto(scene_path: String) -> void:
    var next := load(scene_path).instantiate()
    var root := get_tree().root
    root.call_deferred("add_child", next)
    for c in root.get_children():
        if c != next: c.queue_free()
