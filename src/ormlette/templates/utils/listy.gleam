import gleam/list
import gleam/io
import gleam/int

pub fn index(list: List(a), index: Int){
  case list.drop(from: list, up_to: index) {
    [head, ..] -> head // If there’s an element at this position, return it
    [] -> {
        io.debug("ERROR GETTING INDEX" <> int.to_string(index))
        panic
    }
  }
}