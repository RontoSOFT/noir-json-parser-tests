use dep::rontosoft::JSON;

use crate::utils::can_parse_as_value;

#[test]
fn whitespace_value_space()
{
    assert(can_parse_as_value(" ") == false);
}

#[test]
fn whitespace_value_empty_object_with_leading_null_and_space()
{
    assert(can_parse_as_value(" \0{}") == false);
}

#[test]
fn whitespace_value_empty_object_with_leading_null_and_spaces()
{
    assert(can_parse_as_value("   \0{}") == false);
}

#[test]
unconstrained
fn whitespace_value_empty_object_with_trailing_null_and_space()
{
    assert(JSON::parse("{} \0").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_value_empty_object_with_trailing_null_and_spaces()
{
    assert(JSON::parse("{}   \0").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_value_value_spaces()
{
    let json = JSON::parse(" 1 ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("").eq_string("1") == true);

    let json = JSON::parse("   1   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("").eq_string("1") == true);
}

#[test]
unconstrained
fn whitespace_value_array_spaces()
{
    let json = JSON::parse(" [ 1 , 2 , 3 ] ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("").eq_string("[1,2,3]") == true);

    let json = JSON::parse("   [   1   ,   2   ,   3   ]   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("").eq_string("[1,2,3]") == true);
}
