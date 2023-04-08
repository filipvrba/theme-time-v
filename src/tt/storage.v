module tt

import src.rb
import src.jp

pub struct Storage {
pub mut:
	json_parser jp.JsonParser
	app string
}

pub fn get_storage() Storage {
	mut json_parser := jp.JsonParser{ path: '~/.config/theme-time/storage.json' }
	json_parser.on('start', 7.str())
	json_parser.on('end', 19.str())
	json_parser.on('command', 'theme')

	return Storage{json_parser: json_parser}
}

pub fn (s Storage) set_storage(arguments Arguments) {
	mut json_parser := s.json_parser
	event := rb.Event{'set', s.app}

	if arguments.start != -1.0 {
		json_parser.set('start', arguments.start.str())
		event.println('start: $arguments.start.str()')
	}
	if arguments.end != -1.0 {
		json_parser.set('end', arguments.end.str())
		event.println('end: $arguments.end.str()')
	}
	if arguments.command != "" {
		json_parser.set('command', arguments.command)
		event.println('command: $arguments.command.str()')
	}
}
