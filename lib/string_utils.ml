let string_of_unicode code_point =
  if code_point < 0x80 then String.make 1 (Char.unsafe_chr code_point)
  else if code_point < 0x800 then
    let byte1 = 0xC0 lor (code_point lsr 6) in
    let byte2 = 0x80 lor (code_point land 0x3F) in
    String.make 2 (Char.unsafe_chr byte1)
    ^ String.make 1 (Char.unsafe_chr byte2)
  else if code_point < 0x10000 then
    let byte1 = 0xE0 lor (code_point lsr 12) in
    let byte2 = 0x80 lor ((code_point lsr 6) land 0x3F) in
    let byte3 = 0x80 lor (code_point land 0x3F) in
    String.make 1 (Char.unsafe_chr byte1)
    ^ String.make 1 (Char.unsafe_chr byte2)
    ^ String.make 1 (Char.unsafe_chr byte3)
  else if code_point < 0x110000 then
    let byte1 = 0xF0 lor (code_point lsr 18) in
    let byte2 = 0x80 lor ((code_point lsr 12) land 0x3F) in
    let byte3 = 0x80 lor ((code_point lsr 6) land 0x3F) in
    let byte4 = 0x80 lor (code_point land 0x3F) in
    String.make 1 (Char.unsafe_chr byte1)
    ^ String.make 1 (Char.unsafe_chr byte2)
    ^ String.make 1 (Char.unsafe_chr byte3)
    ^ String.make 1 (Char.unsafe_chr byte4)
  else invalid_arg "Invalid Unicode code point"
