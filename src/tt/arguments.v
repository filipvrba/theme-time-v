module tt

import op

pub struct Arguments {
pub mut:
	is_gs bool
	start int = -1
	end int = -1
	command string
}

pub fn get_arguments() Arguments {
	mut arguments := Arguments{}
	mut ref_args := &arguments

	mut option_parser := op.OptionParser{}
	mut ref_op := &option_parser

	option_parser.banner('This app is for change themes in an time intervals.\n\nOptions:')
	option_parser.on("-h", "--help", "Show help", fn [mut ref_op] (_ string) {
		print(ref_op.help_str())
		exit(0)
	})
	option_parser.on("-gs", "--get-storage", "Shows the application configuration data.", fn [mut ref_args] (_ string) {
		ref_args.is_gs = true
	})
	option_parser.on("--set-start NUMBER", "", "Set a 'start' value.", fn [mut ref_args] (number string) {
		ref_args.start = number.int()
	})
	option_parser.on("--set-end NUMBER", "", "Set a 'end' value.", fn [mut ref_args] (number string) {
		ref_args.end = number.int()
	})
	option_parser.on("--set-command COMMAND", "", "Set a 'command' value.", fn [mut ref_args] (command string) {
		ref_args.command = command
	})
	option_parser.init()

	return arguments
}

pub fn (a Arguments) is_empty() bool {
	return a == Arguments{}
}