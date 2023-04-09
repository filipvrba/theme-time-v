module rb

pub struct File {
	path string
}

pub fn (f File) dirname() String {
	mut s_path := f.path.split('/')
	s_path.trim(s_path.len - 1)
	path := s_path.join('/')
	return String{ path }
}
