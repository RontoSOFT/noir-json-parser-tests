use dep::rontosoft::JSON;
use dep::rontosoft::globals::BEGIN_OBJECT;
use dep::rontosoft::globals::END_OBJECT;
use dep::rontosoft::globals::QUOTATION_MARK;
use dep::rontosoft::globals::KEY_DELIMITER;

// global bytes_prop : str<5> = r#"{"a":"#;
global bytes_prop   : [u8;  5] = [BEGIN_OBJECT, QUOTATION_MARK, 0x61, QUOTATION_MARK, KEY_DELIMITER];

// global bytes_nested : str<10> = r#"{"a":{"b":"#;
global bytes_nested : [u8; 10] = [BEGIN_OBJECT, QUOTATION_MARK, 0x61, QUOTATION_MARK, KEY_DELIMITER, BEGIN_OBJECT, QUOTATION_MARK, 0x62, QUOTATION_MARK, KEY_DELIMITER];

unconstrained
fn can_parse_as_nested<SIZE>(value : str<SIZE>) -> bool
{
    let size = value.as_bytes().len();

    let json =
    bytes_nested.as_slice()
        .append(value.as_bytes().as_slice())
        .push_back(END_OBJECT)
        .push_back(END_OBJECT)
        .parse(&mut 0, size + 12, -1);

    if (json.doc.len() == 0) { false }
    else { json.children[0][0].value.eq_string(value) }
    // else { json.children[0].get("b").eq_string(value) }
    // else { json.child(0).get("b").eq_string(value) }
}

unconstrained
fn can_parse_as_property<N>(value : str<N>) -> bool
{
    let json =
    bytes_prop.as_slice()
        .append(value.as_bytes().as_slice())
        .push_back(END_OBJECT)
        .parse(&mut 0, N + 6, -1);

    if (json.doc.len() == 0) { false }
    else { json.doc[0].value.eq_string(value) }
}

unconstrained
fn can_parse_as_value<N>(value : str<N>) -> bool
{
    let json = JSON::parse(value);
    if (json.doc.len() == 0) { false }
    else { json.doc[0].value.eq_string(value) }
    // else { json.get("").eq_string(value) }
}
