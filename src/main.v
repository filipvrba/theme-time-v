module main

import src.tt

fn main() {
	arguments := tt.get_arguments()
	storage := tt.get_storage(arguments)
	println(storage)
}
