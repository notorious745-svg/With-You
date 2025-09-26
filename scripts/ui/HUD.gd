extends Control
@onready var time_box  : Label = $TopBar/TimeBox
@onready var money_box : Label = $TopBar/MoneyBox
@onready var pet_cards := [
    $PetBar/PetCard1,
    $PetBar/PetCard2,
    $PetBar/PetCard3,
]
func _ready() -> void:
    GameState.time_changed.connect(_on_time)
    GameState.money_changed.connect(_on_money)
    GameState.pets_changed.connect(_on_pets)
    _on_time(GameState.hour, GameState.minute, GameState.day, GameState.season, GameState.year)
    _on_money(GameState.money)
    _on_pets(GameState.active_pets)
func _on_time(h:int, m:int, d:int, season:String, y:int) -> void:
    time_box.text = "%02d:%02d  |  %d %s, Y%d" % [h,m,d,season,y]
func _on_money(amount:int) -> void:
    money_box.text = "฿ %,d" % amount
func _on_pets(ids:Array) -> void:
    for i in range(pet_cards.size()):
        var card = pet_cards[i]
        card.visible = i < ids.size()
