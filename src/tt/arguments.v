module tt

import src.op

pub struct Arguments {
pub mut:
	start f32
	end f32
	command string
}

pub fn get_arguments() Arguments {
	mut arguments := Arguments{start: -1, end: -1}
	mut ref_args := &arguments

	mut option_parser := op.OptionParser{}
	mut ref_op := &option_parser

	option_parser.banner('This app is for change themes in an time intervals.\n\nOptions:')
	option_parser.on("-h", "--help", "Show help", fn [mut ref_op] (_ string) {
		print(ref_op.help_str())
		exit(0)
	})
	option_parser.on("--set-start NUMBER", "", "Set a 'start' value.", fn [mut ref_args] (number string) {
		ref_args.start = number.f32()
	})
	option_parser.on("--set-end NUMBER", "", "Set a 'end' value.", fn [mut ref_args] (number string) {
		ref_args.end = number.f32()
	})
	option_parser.on("--set-command COMMAND", "", "Set a 'command' value.", fn [mut ref_args] (command string) {
		ref_args.command = command
	})
	option_parser.init()

	return arguments
}