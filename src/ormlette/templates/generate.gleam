// DO NOT EDIT: Code generated by matcha from generate.matcha

import gleam/list
import gleam/string_builder.{type StringBuilder}

pub fn render_builder(paths paths: List(String)) -> StringBuilder {
  let builder = string_builder.from_string("")
  let builder =
    string_builder.append(
      builder,
      "
import ormlette/templates/tables
import ormlette/templates/utils/to_string
import ormlette/templates/decoder_type
import glerd_gen
import ormlette/templates/utils/record_info

",
    )
  let builder =
    list.fold(paths, builder, fn(builder, p: String) {
      let builder =
        string_builder.append(
          builder,
          "
import schema/",
        )
      let builder = string_builder.append(builder, p)
      let builder =
        string_builder.append(
          builder,
          "
",
        )

      builder
    })
  let builder =
    string_builder.append(
      builder,
      "

pub fn main() {
    tables.render([",
    )
  let builder =
    list.fold(paths, builder, fn(builder, p: String) {
      let builder = string_builder.append(builder, p)
      let builder = string_builder.append(builder, ".")
      let builder = string_builder.append(builder, p)
      let builder = string_builder.append(builder, "_table(), ")

      builder
    })
  let builder =
    string_builder.append(
      builder,
      "])
    |> to_string.to_file(\"src/eggs/tables.gleam\", to_string.Write)

    decoder_type.render([",
    )
  let builder =
    list.fold(paths, builder, fn(builder, p: String) {
      let builder = string_builder.append(builder, p)
      let builder = string_builder.append(builder, ".")
      let builder = string_builder.append(builder, p)
      let builder = string_builder.append(builder, "_table(), ")

      builder
    })
  let builder =
    string_builder.append(
      builder,
      "])
    |> to_string.to_file(\"src/eggs/decode.gleam\", to_string.Write)

    record_info.generate_all_to_dicts(record_info.find_records(glerd_gen.record_info), \"src/eggs/convert.gleam\")
}
",
    )

  builder
}

pub fn render(paths paths: List(String)) -> String {
  string_builder.to_string(render_builder(paths: paths))
}
