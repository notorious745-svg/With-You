extends Control
var target: Node3D
func set_text(t:String): $Label.text = t
func follow_node(n:Node3D): target = n
func _process(_dt):
    # simple follow: you can improve with world->screen transform
    pass
