module tt

import jp
import time

const(
	themes = [
		'light',
		'dark'
	]
)

pub struct Cycle {
	storage &jp.JsonParser
mut:
	bitwise u8
}

pub fn (mut c Cycle) day_ident() ! {
	if c.is_day() {
		if !c.is_activate(1) {
			c.bitwise |= 1

			if c.is_activate(2) {
				c.bitwise &= ~2
			}
			return error(themes[0])  // call block
		}
	}
	else if c.is_night() {
		if !c.is_activate(2) {
			c.bitwise |= 2

			if c.is_activate(1) {
				c.bitwise &= ~1
			}
			return error(themes[1])  // call block
		}
	}
}

fn (c Cycle) is_activate(bit u8) bool {
	return c.bitwise & bit != 0
}

fn (c Cycle) is_night() bool {
	mut storage := c.storage
	hour := time.now().hour
	return hour < storage.get('start').int() || hour >= storage.get('end').int()
}

fn (c Cycle) is_day() bool {
	mut storage := c.storage
	hour := time.now().hour
	return hour >= storage.get('start').int() && hour < storage.get('end').int()
}