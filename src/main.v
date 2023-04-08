module main

import src.tt
import src.rb
import time
import os

const(
	app_name = 'tt'
)

struct App {
mut:
	arguments tt.Arguments
	storage tt.Storage
	pid tt.PID
}

fn main() {
	mut app := App{}
	app.arguments = tt.get_arguments()
	app.storage = tt.get_storage()

	if !app.arguments.is_gs {
		app.storage.app = app_name
		app.storage.set_storage(app.arguments)
	}
	else {
		rb.Event{'get', app_name}.println(app.storage.json_parser.str())
		exit(0)
	}

	if app.arguments.is_empty() {
		if !tt.PID{app_name}.is_running() {
			app.loop(1000)
		}
		else {
			exit(0)
		}
	}
}

fn (mut a App) loop(sleep int) {
	mut cycle := tt.Cycle{ storage: &a.storage.json_parser }
	for {
		cycle.day_ident() or {
			a.theme_active(err.str())
		}

		time.sleep(sleep * time.millisecond)
	}
}

fn (mut a App) theme_active(theme string) {
	mut command := "${ a.storage.json_parser.get('command') } $theme"
	os.execute(command)
	rb.Event{'theme', app_name}.println(theme)
}
