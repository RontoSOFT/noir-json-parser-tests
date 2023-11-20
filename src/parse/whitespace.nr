use dep::rontosoft::JSON;

use crate::utils::can_parse_as_property;
use crate::utils::can_parse_as_value;

#[test]
fn whitespace_space()
{
    assert(can_parse_as_property(" ") == false);
}

#[test]
fn whitespace_tab()
{
    assert(can_parse_as_property("\t") == false);
}

#[test]
fn whitespace_newline()
{
    assert(can_parse_as_property("\n") == false);
}

#[test]
fn whitespace_carriage_return()
{
    assert(can_parse_as_property("\r") == false);
}

#[test]
unconstrained
fn whitespace_byte_null()
{
    assert(can_parse_as_property("\0") == false);
}

#[test]
unconstrained
fn whitespace_empty_object_with_trailing_null_and_space()
{
    assert(JSON::parse("{} \0").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_empty_object_with_trailing_null_and_spaces()
{
    assert(JSON::parse("{}   \0").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_empty_object_with_leading_null_and_space()
{
    assert(can_parse_as_property(" \0{}") == false);
}

#[test]
unconstrained
fn whitespace_empty_object_with_leading_null_and_spaces()
{
    assert(can_parse_as_property("   \0{}") == false);
}

#[test]
unconstrained
fn whitespace_object_spaces()
{
    let json = JSON::parse(" { 'a' : 1 } ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("a").eq_string("1") == true);

    let json = JSON::parse("   {   'a'   :   1   }   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn whitespace_object_array_object_spaces()
{
    let json = JSON::parse("{ 'a' : [ { 'b' : 1 } ] }");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("b").eq_string("1") == true);

    let json = JSON::parse("   {   'a'  :   [   {   'b'   :   1   }   ]   }   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("b").eq_string("1") == true);
}
