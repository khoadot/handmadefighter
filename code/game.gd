
extends Node2D

var Hitbox = 0;
var HitboxInitialPos = Vector2(0, -120)

func _ready():
	set_fixed_process(false)

	var Root = get_node("/root").get_child(0)
	Hitbox = preload("res://StaticHitbox.tscn").instance()

	Root.add_child(Hitbox)
	Hitbox.set_owner(Root)
	Hitbox.set_pos(HitboxInitialPos)

	var TimerNode = find_node("Timer")
	TimerNode.connect("timeout", self, "OnTimerTimeout")

func OnTimerTimeout():
	# TODO(hugo) : Is the root this very node ?
	var Root = get_node("/root").get_child(0)

	if(typeof(Hitbox) != TYPE_NIL):
		Root.remove_child(Hitbox)
		Hitbox.free()

	Hitbox = preload("res://StaticHitbox.tscn").instance()

	Hitbox.set_pos(HitboxInitialPos)
	Root.add_child(Hitbox)
	Hitbox.set_owner(Root)
