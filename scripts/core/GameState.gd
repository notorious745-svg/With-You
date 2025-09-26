extends Node
class_name GameState
signal time_changed(hour:int, minute:int, day:int, season:String, year:int)
signal money_changed(amount:int)
signal pets_changed(active_ids:Array)
signal player_stat_changed(stat:Dictionary)
var hour := 8
var minute := 0
var day := 1
var season := "Spring"
var year := 1
var money := 0
var active_pets: Array[String] = []
var player_stat := {"hp":100, "energy":80, "mood":"ok"}
func tick_minutes(delta_min:int=1):
    minute += delta_min
    if minute >= 60:
        minute -= 60
        hour = (hour + 1) % 24
    emit_signal("time_changed", hour, minute, day, season, year)
func add_money(v:int):
    money += v
    emit_signal("money_changed", money)
func set_active_pets(ids:Array[String]):
    active_pets = ids.slice(0,3)
    emit_signal("pets_changed", active_pets)
func set_player_stat(d:Dictionary):
    player_stat = d
    emit_signal("player_stat_changed", player_stat)
