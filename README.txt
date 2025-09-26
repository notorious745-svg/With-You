Godot Pet Game Skeleton (Nintendogs-style)
-------------------------------------------
1) Put these folders at your project root (res://).
2) Set Autoload (Project Settings -> Autoload):
   - scripts/core/SceneRouter.gd as SceneRouter
   - scripts/core/GameState.gd as GameState
   - scripts/core/GameDB.gd as GameDB
   - (optional) scripts/core/Save.gd as Save (stub not provided)
3) Set Main Scene: scenes/flow/Splash.tscn
4) Add your pet model under assets/pets and make a scene inheriting from scenes/_base/pet/PetBase.tscn.
5) Use scenes/ui/HUD.tscn in your gameplay scenes.
