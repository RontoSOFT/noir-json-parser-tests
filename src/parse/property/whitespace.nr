use dep::rontosoft::JSON;

use crate::utils::can_parse_as_property;

#[test]
fn space()
{
    assert(can_parse_as_property(" ") == false);
}

#[test]
fn byte_null()
{
    assert(can_parse_as_property("\0") == false);
}

#[test]
fn empty_object_with_leading_null_and_space()
{
    assert(can_parse_as_property(" \0{}") == false);
}

#[test]
fn empty_object_with_leading_null_and_spaces()
{
    assert(can_parse_as_property("   \0{}") == false);
}

#[test]
unconstrained
fn empty_object_with_trailing_null_and_space()
{
    assert(JSON::parse("{\"a\":{}} \0").get_object("a").is_empty() == true);
}

#[test]
unconstrained
fn empty_object_with_trailing_null_and_spaces()
{
    assert(JSON::parse("{\"a\":{}}   \0").get_object("a").is_empty() == true);
}

#[test]
unconstrained
fn one_with_spaces()
{
    let json = JSON::parse(" { \"a\" : 1 } ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("a").eq_string("1") == true);

    let json = JSON::parse("   {   \"a\"   :   1   }   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn array_with_spaces()
{
    let json = JSON::parse(" { \"a\" : [ 1 , 2 , 3 ] } ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("a").eq_string("[1,2,3]") == true);

    let json = JSON::parse("   {   \"a\"   :   [   1   ,   2   ,   3   ]   }   ");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 0);
    assert(json.get("a").eq_string("[1,2,3]") == true);
}
