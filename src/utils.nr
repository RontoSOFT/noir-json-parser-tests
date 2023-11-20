use dep::rontosoft::JSON;
use dep::rontosoft::globals::BEGIN_OBJECT;
use dep::rontosoft::globals::END_OBJECT;
use dep::rontosoft::globals::QUOTATION_MARK;
use dep::rontosoft::globals::KEY_DELIMITER;

// global prop_bytes : str<5> = "{'a':";
global prop_bytes : [u8; 5] = [BEGIN_OBJECT, QUOTATION_MARK, 0x61, QUOTATION_MARK, KEY_DELIMITER];

unconstrained
fn can_parse_as_property<N>(value : str<N>) -> bool
{
    let json =
    prop_bytes.as_slice()
        .append(value.as_bytes().as_slice())
        .push_back(END_OBJECT)
        .parse(&mut 0, N + 6, -1);

    if (json.is_none()) { false } else { json.get("a").eq_string(value) }
}

unconstrained
fn can_parse_as_value<N>(value : str<N>) -> bool
{
    let json = JSON::parse(value);
    if (json.is_none()) { false } else { json.doc[0].value.eq_string(value) }
}
