use dep::rontosoft::JSON;

use crate::utils::can_parse_as_nested;

#[test]
fn whitespace_nested_space()
{
    assert(can_parse_as_nested(" ") == false);
}

#[test]
fn whitespace_nested_tab()
{
    assert(can_parse_as_nested("\t") == false);
}

#[test]
fn whitespace_nested_newline()
{
    assert(can_parse_as_nested("\n") == false);
}

#[test]
fn whitespace_nested_carriage_return()
{
    assert(can_parse_as_nested("\r") == false);
}

#[test]
fn whitespace_nested_byte_null()
{
    assert(can_parse_as_nested("\0") == false);
}

#[test]
fn whitespace_nested_empty_object_with_leading_null_and_space()
{
    assert(can_parse_as_nested(" \0{}") == false);
}

#[test]
fn whitespace_nested_empty_object_with_leading_null_and_spaces()
{
    assert(can_parse_as_nested("   \0{}") == false);
}

#[test]
unconstrained
fn whitespace_nested_empty_object_with_trailing_null()
{
    assert(JSON::parse("{'a':{'b':{}}}\0").child(0).get_object("b").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_nested_empty_object_with_trailing_null_and_space()
{
    assert(JSON::parse("{'a':{'b':{}}} \0").child(0).get_object("b").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_nested_empty_object_with_trailing_null_and_spaces()
{
    assert(JSON::parse("{'a':{'b':{}}}   \0").child(0).get_object("b").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_nested_value_spaces()
{
    let json = JSON::parse(" { 'a' : { 'b' : 1 } } ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);
    assert(json.child(0).get("b").eq_string("1") == true);

    let json = JSON::parse("   {   'a'   :   {   'b'   :   1   }   }   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);
    assert(json.child(0).get("b").eq_string("1") == true);
}

#[test]
unconstrained
fn whitespace_nested_array_spaces()
{
    let json = JSON::parse(" { 'a' : { 'b' : [ 1 , 2 , 3 ] } } ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);
    assert(json.child(0).get("b").eq_string("[1,2,3]") == true);

    let json = JSON::parse("   {   'a'   :   {   'b'   :   [   1   ,   2   ,   3   ]   }   }   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);
    assert(json.child(0).get("b").eq_string("[1,2,3]") == true);
}
