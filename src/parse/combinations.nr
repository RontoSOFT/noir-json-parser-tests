use dep::rontosoft::JSON;

global chars =
[
    " ".as_bytes()[0],
    "'".as_bytes()[0],
    ":".as_bytes()[0],
    ",".as_bytes()[0],
    "[".as_bytes()[0],
    "]".as_bytes()[0],
    "0".as_bytes()[0],
    "1".as_bytes()[0],
    // ".".as_bytes()[0],
    // "E".as_bytes()[0],
    // "e".as_bytes()[0],
    // "+".as_bytes()[0],
    "-".as_bytes()[0],
    // "\\".as_bytes()[0],
    // "a".as_bytes()[0],
    // "f".as_bytes()[0],
    // "l".as_bytes()[0],
    // "n".as_bytes()[0],
    // "r".as_bytes()[0],
    // "s".as_bytes()[0],
    // "t".as_bytes()[0],
    // "u".as_bytes()[0],
    "{".as_bytes()[0],
    "}".as_bytes()[0],
];

unconstrained
fn parse_and_print_valid(bytes : [u8], size : Field)
{
    let json = bytes.parse(&mut 0, size, -1);
    if (!json.is_none()) { bytes.print(); }
}

unconstrained
fn generate_combinations(mut combination : &mut [u8], index: Field, size : Field)
{
    if (index == size) { parse_and_print_valid(*combination, size); }
    else
    {
        for c in chars
        {
            combination[index] = c;
            generate_combinations(combination, index + 1, size);
        }
    }
}

#[test]
unconstrained
fn generate_and_parse()
{
    let size : Field = 3;

    let mut combination = [];
    for _ in 0..size { combination = combination.push_back(0); };

    generate_combinations(&mut combination, 0, size);
}
