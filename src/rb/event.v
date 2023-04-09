module rb

import time

pub struct Event {
	name string
	app string = 'app'
}

pub fn (e Event) println(message string) {
	f_time := time.now().custom_format("hh:mm:ss A")
	println("$f_time [$e.app] $e.name.to_upper() | $message")
}