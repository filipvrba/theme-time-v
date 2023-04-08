module tt

import os
import src.rb

pub struct PID {
	app string
}

pub fn (p PID) is_running() bool {
	pid := os.getpid()
	pid_exist := p.get_exist_pid()

	if pid != pid_exist {
		rb.Event{'warning', p.app}
			.println("This $pid_exist pid still running in process.")
		return true
	}

	return false
}

fn (p PID) get_exist_pid() int {
	return os.execute("pgrep '^$p.app$'").output.int()
}