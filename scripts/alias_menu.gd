extends Control
class_name AliasMenu

@export var name_lines: Array[LineEdit]
@export var command_lines: Array[LineEdit]
@export var alias_nodes: Array[Alias]
@export var terminal: Node2D

func register_aliases() -> void:
	print("register_aliases")
	var num = 0
	for i in range(alias_nodes.size()):
		alias_nodes[i].alias_name = ""
		alias_nodes[i].alias_cmds.clear()
		alias_nodes[i].args.clear()
		if (alias_nodes[i].enabled):
			num += 1
		
	for i in range(num):
		alias_nodes[i].alias_name = name_lines[i].text

		var line = command_lines[i].text
		print("line: " + line)
		var tokens = line.split(", ")
		for t in tokens:
			print("tokens: " + t)
		
			var split = t.split(" ")
			
			if (split.size() == 1):
				var cmd = terminal.get_cmd(split[0])
				if (cmd):
					alias_nodes[i].alias_cmds.push_front(cmd)
			else:
				var index = 0
				var cmd = terminal.get_cmd(split[index])
				index += 1
				if (cmd):
					alias_nodes[i].alias_cmds.push_front(cmd)
					for j in range(cmd.args):
						alias_nodes[i].args.push_front(split[index])
						index += 1
		
		print(alias_nodes[i].alias_cmds)
		print(alias_nodes[i].args)
				
func execute_alias(alias: Alias) -> void:
	print("execute_alias: " + alias.alias_name)
	var num = alias.alias_cmds.size()
	var arg_index = 0

	for n in range(num):
		var command: String = alias.alias_cmds[n].names[0]
		print("Number of args for command [" + command + "]: " + str(alias.alias_cmds[n].args))
		
		for i in range(alias.alias_cmds[n].args):
			if (alias.args.size() > arg_index):
				var arg = alias.args[arg_index]
				arg_index += 1
				command += " " + arg
		
		terminal.try_cmd(command)
			
