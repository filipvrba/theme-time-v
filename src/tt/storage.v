module tt

import src.jp

pub fn get_storage(arguments Arguments) jp.JsonParser {
	mut json_parser := jp.JsonParser{ path: 'config/storage.json' }
	json_parser.on('start', 7.0.str())
	json_parser.on('end', 19.0.str())
	json_parser.on('command', 'theme')

	if arguments.start != -1.0 {
		json_parser.set('start', arguments.start.str())
	}
	if arguments.end != -1.0 {
		json_parser.set('end', arguments.end.str())
	}
	if arguments.command != "" {
		json_parser.set('command', arguments.command)
	}

	return json_parser
}