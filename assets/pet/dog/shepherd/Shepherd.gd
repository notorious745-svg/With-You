extends Node3D

const MaterialTools = preload("res://scripts/material_tools.gd")

@export var fbx_scene_path: String = "res://assets/breed/dog/shepherd/Cartoon_Shepherd_anim_IP.fbx"
@export var textures_dir: String = "res://assets/breed/dog/shepherd/textures"

func _ready() -> void:
    # instance FBX as a child (if not present in scene)
    if get_child_count() == 0 and ResourceLoader.exists(fbx_scene_path):
        var ps: PackedScene = load(fbx_scene_path) as PackedScene
        if ps:
            var inst := ps.instantiate()
            add_child(inst)

    # find first MeshInstance3D under this wrapper and apply materials
    var mi := _find_mesh_instance(self)
    if mi:
        MaterialTools.apply_pbr(mi, textures_dir)

func _find_mesh_instance(n: Node) -> MeshInstance3D:
    if n is MeshInstance3D:
        return n
    for c in n.get_children():
        var r := _find_mesh_instance(c)
        if r:
            return r
    return null
