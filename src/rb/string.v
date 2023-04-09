module rb

pub struct String {
	self string
}

pub fn (s String) to_v() string {
	return s.self
}