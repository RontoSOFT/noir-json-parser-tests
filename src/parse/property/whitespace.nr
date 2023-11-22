use dep::rontosoft::JSON;

use crate::utils::can_parse_as_property;

#[test]
fn whitespace_property_space()
{
    assert(can_parse_as_property(" ") == false);
}

#[test]
fn whitespace_property_tab()
{
    assert(can_parse_as_property("\t") == false);
}

#[test]
fn whitespace_property_newline()
{
    assert(can_parse_as_property("\n") == false);
}

#[test]
fn whitespace_property_carriage_return()
{
    assert(can_parse_as_property("\r") == false);
}

#[test]
fn whitespace_property_byte_null()
{
    assert(can_parse_as_property("\0") == false);
}

#[test]
fn whitespace_property_empty_object_with_leading_null_and_space()
{
    assert(can_parse_as_property(" \0{}") == false);
}

#[test]
fn whitespace_property_empty_object_with_leading_null_and_spaces()
{
    assert(can_parse_as_property("   \0{}") == false);
}

#[test]
unconstrained
fn whitespace_property_empty_object_with_trailing_null_and_space()
{
    assert(JSON::parse("{'a':{}} \0").get_object("a").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_property_empty_object_with_trailing_null_and_spaces()
{
    assert(JSON::parse("{'a':{}}   \0").get_object("a").is_empty() == true);
}

#[test]
unconstrained
fn whitespace_property_value_spaces()
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
fn whitespace_property_array_spaces()
{
    let json = JSON::parse(" { 'a' : [ 1 , 2 , 3 ] } ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("a").eq_string("[1,2,3]") == true);

    let json = JSON::parse("   {   'a'   :   [   1   ,   2   ,   3   ]   }   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("a").eq_string("[1,2,3]") == true);
}
