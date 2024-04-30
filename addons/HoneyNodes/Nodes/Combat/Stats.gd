tool
class_name Stats
extends NodeCore

const EMPTY_HEALTH := 0
const MIN_EMPTY := 1

signal health_max_changed(new_max)
signal health_changed(new_value)
signal health_depleted()
signal health_reset()

signal damage_taken(source)
signal heal(source)
signal hit_kill(source)
signal received_full_heal(source)


var starting_stats : Resource = null setget set_starting_stats,get_starting_stats

onready var max_health := get_starting_max_health() setget set_max_health,get_max_health
onready var health := max_health setget set_health,get_health


func _ready() -> void:
	initialize()


func initialize() -> void:
	emit_signal("health_max_changed", get_max_health())
	emit_signal("health_changed", get_health())


func take_damage(source: Node) -> void:
	var damage_source := source.get_damage_source() as Resource
	var damage := damage_source.get_damage() as int
	var is_hit_kill := damage_source.is_hit_kill() as bool
	
	if is_hit_kill == true:
		set_health(get_health() - get_max_health())
		emit_signal("hit_kill", source)
		return
	
	if get_health() == EMPTY_HEALTH:
		return
	
	set_health(get_health() - damage, source)


func heal(source: Node) -> void:
	var heal_source := source.get_heal_source() as Resource
	var amount := heal_source.get_amount() as int
	var has_received_full_heal := heal_source.has_received_full_heal() as bool
	
	if has_received_full_heal == true:
		set_health(get_health() + get_max_health())
		emit_signal("received_full_heal", source)
		return
	
	if get_health() == EMPTY_HEALTH:
		return
	
	set_health(get_health() - amount, source)


func change_stats(new_stats: Resource,reset_health: bool = true) -> void:
	set_max_health(new_stats.get_max_health())
	if reset_health == true:
		reset_health()


func reset_health() -> void:
	set_health(get_max_health())
	emit_signal("health_reset")


func set_max_health(value: int) -> void:
	max_health = value
	max_health = max(MIN_EMPTY, value)
	emit_signal("health_max_changed", max_health)


func get_max_health() -> int:
	return max_health


func set_health(value: int,source: Node = null) -> void:
	var prev_health := health
	health = value
	health = clamp(health, EMPTY_HEALTH, max_health)
	
	if health != prev_health:
		emit_signal("health_changed", health)
	if health < prev_health:
		emit_signal("damage_taken", source)
	elif health > prev_health:
		emit_signal("heal", source)
	
	if is_dead() == true:
		emit_signal("health_depleted")


func get_health() -> int:
	return health


func is_dead() -> bool:
	return get_health() == EMPTY_HEALTH


func set_starting_stats(value: Resource) -> void:
	starting_stats = value


func get_starting_stats() -> Resource:
	return starting_stats


func get_starting_max_health() -> int:
	return get_starting_stats().get_max_health() as int if get_starting_stats() != null else EMPTY_HEALTH


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Stats","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"starting_stats","type":TYPE_OBJECT})
	return properties
