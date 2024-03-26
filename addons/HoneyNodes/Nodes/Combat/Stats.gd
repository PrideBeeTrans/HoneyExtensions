tool
class_name Stats
extends Component

signal health_max_changed(new_max)
signal health_changed(new_value)
signal health_depleted()
signal health_full()

signal damage_taken(source)
signal healed(source)
signal hit_killed(source)
signal healed_full(source)

const MIN_HEALTH := 1
const EMPTY_HEALTH := 0

var starting_stats : Resource = null setget set_starting_stats,get_starting_stats

onready var max_health := _get_starting_max_health() setget set_max_health,get_max_health
onready var health := max_health setget set_health,get_health


func _ready() -> void:
	if Engine.is_editor_hint() == true:
		return
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
		emit_signal("hit_killed", source)
		return
	
	if get_health() == EMPTY_HEALTH:
		return
	set_health(get_health() - damage, source)


func heal(source: Node) -> void:
	var heal_source := source.get_heal_source() as Resource
	var amount := heal_source.get_amount() as int
	var is_full_heal := heal_source.is_full_heal() as bool
	
	if is_full_heal == true:
		set_health(get_health() + get_max_health())
		emit_signal("healed_full", source)
		return
	
	if get_health() == get_max_health():
		return
	set_health(get_health() + amount, source)


func set_max_health(value: int) -> void:
	max_health = value
	max_health = max(MIN_HEALTH, max_health)


func get_max_health() -> int:
	return max_health


func set_health(value: int,source: Node = null) -> void:
	var prev_health := health
	health = value
	health = clamp(health, MIN_HEALTH, get_max_health())
	
	if health != prev_health:
		emit_signal("health_changed", health)
	if health < prev_health:
		emit_signal("damage_taken", source)
	elif health > prev_health:
		emit_signal("healed", source)
	
	if health == EMPTY_HEALTH:
		emit_signal("health_depleted")


func get_health() -> int:
	return health


func set_starting_stats(value: Resource) -> void:
	starting_stats = value


func get_starting_stats() -> Resource:
	return starting_stats


func _get_starting_max_health() -> int:
	return get_starting_stats().get_max_health() if get_starting_stats() != null else EMPTY_HEALTH


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Stats","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"starting_stats","type":TYPE_OBJECT})
	return properties
