extends Node2D

@export_range(0.0, 1.0) var slow_time = 0.5
@export var player : CharacterBody2D
@export var alias_menu : AliasMenu

@onready var text = $Text
@onready var cmd_container = $Commands

var commands = {}
var is_terminal_open = false

func _ready() -> void:
	Globals.terminal = self

func _process(delta: float) -> void:
	if (is_terminal_open):
		Engine.time_scale = slow_time
	else:
		Engine.time_scale = 1.0
	
	if (Input.is_action_just_pressed('terminal')):
		# Open command terminal
		if(!is_terminal_open):
			is_terminal_open = true
			text.grab_focus()

			text.text = ''
			text.visible = true
			text.editable = true
			
		# Close command terminal
		elif (is_terminal_open):
			if (alias_menu.visible): return
			is_terminal_open = false

			text.visible = false
			text.editable = false
			alias_menu.visible = false
			try_cmd(text.text)
			text.text = ''
			
	elif (Input.is_action_just_pressed('alias')):		
		var alias_script: AliasMenu = alias_menu.get_script() as AliasMenu
		
		# Open alias menu
		if (!is_terminal_open):
			is_terminal_open = true
			
			alias_menu.visible = true
			alias_menu.get_node('AliasNames/Name1').grab_focus()
		
		# Close alias menu
		elif (is_terminal_open && (alias_script && !alias_script.is_text_selected)):
			is_terminal_open = false
			
			text.visible = false
			text.editable = false
			alias_menu.visible = false
			
func try_cmd(ttxt: String):
	if ttxt.is_empty(): return
	
	var args = ttxt.split(" ")
	var scripts = cmd_container.find_children("*", "Command", true, false)
	for s: Command in scripts:
		if args[0] in s.names:
			if s.enabled == false: return
			
			args.remove_at(0)
			
			var instance = s.code.new()
			add_child(instance)
			instance.cmd(args)
			instance.queue_free()
			return
			
	var aliases = cmd_container.find_children("*", "Alias", true, false)
	for a: Alias in aliases:
		if args[0] == a.alias_name:
			if a.enabled == false: return
			alias_menu.execute_alias(a)
			
func enable_cmd(cmd_name):
	var scripts = cmd_container.find_children("*", "Command", true, false)
	for s: Command in scripts:
		if cmd_name in s.names:
			s.enabled = true
			print(s)
			return
	
func get_cmd(cmd_name) -> Command:
	var scripts = cmd_container.find_children("*", "Command", true, false)
	for s: Command in scripts:
		if cmd_name in s.names:
			if (s.enabled):
				return s
	return null
