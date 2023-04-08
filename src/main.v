module main

import src.tt
import src.jp
import src.rb
import time
import os

const(
	app_name = 'tt'
)

struct App {
mut:
	arguments tt.Arguments
	storage jp.JsonParser
	pid tt.PID
}

fn main() {
	mut app := App{}
	app.arguments = tt.get_arguments()
	app.storage = tt.get_storage(app.arguments)

	if !tt.PID{app_name}.is_running() {
		app.loop(1000)
	}
	else {
		exit(0)
	}
}

fn (mut a App) loop(sleep int) {
	mut cycle := tt.Cycle{ storage: &a.storage }
	for {
		cycle.day_ident() or {
			a.theme_active(err.str())
		}

		time.sleep(sleep * time.millisecond)
	}
}

fn (mut a App) theme_active(theme string) {
	mut command := "${ a.storage.get('command') } $theme"
	os.execute(command)
	rb.Event{'theme', app_name}.println(theme)
}
