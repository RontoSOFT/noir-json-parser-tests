use dep::rontosoft::JSON;
use dep::rontosoft::Property;

use crate::utils::can_parse_as_value;

#[test]
fn empty()
{
    assert(can_parse_as_value("[]") == true);
}

#[test]
fn left_bracket()
{
    assert(can_parse_as_value("[") == false);
}

#[test]
fn right_bracket()
{
    assert(can_parse_as_value("]") == false);
}

#[test]
fn left_bracket_and_number()
{
    assert(can_parse_as_value("[12") == false);
}

#[test]
fn right_bracket_and_number()
{
    assert(can_parse_as_value("12]") == false);
}

#[test]
fn left_bracket_and_number_quote()
{
    assert(can_parse_as_value(r#"[12""#) == false);
}

#[test]
fn quote_right_bracket_and_number()
{
    assert(can_parse_as_value(r#""12]"#) == false);
}

#[test]
fn left_brace_and_literal()
{
    assert(can_parse_as_value("[true") == false);
}

#[test]
fn right_brace_and_literal()
{
    assert(can_parse_as_value("true]") == false);
}

#[test]
fn empty_values()
{
    assert(can_parse_as_value("[,]") == false);
}

#[test]
fn faulty_colon()
{
    assert(can_parse_as_value("[:]") == false);
}

#[test]
fn left_brace_outer()
{
    assert(can_parse_as_value("{[]") == false);
}

#[test]
fn right_brace_outer()
{
    assert(can_parse_as_value("[]}") == false);
}

#[test]
fn left_brace_inner()
{
    assert(can_parse_as_value("[{]") == false);
}

#[test]
fn right_brace_inner()
{
    assert(can_parse_as_value("[}]") == false);
}

#[test]
fn duplicate_left_bracket()
{
    assert(can_parse_as_value("[[]") == false);
}

#[test]
fn duplicate_right_bracket()
{
    assert(can_parse_as_value("[]]") == false);
}

#[test]
fn empty_space_empty()
{
    assert(can_parse_as_value("[] []") == false);
}

#[test]
fn empty_comma_empty()
{
    assert(can_parse_as_value("[],[]") == false);
}

#[test]
fn empty_nested_values()
{
    assert(can_parse_as_value("[[,]]") == false);
}

#[test]
fn empty_nested_missing_missing_value_before()
{
    assert(can_parse_as_value("[,[]]") == false);
}

#[test]
fn empty_nested_missing_missing_value_after()
{
    assert(can_parse_as_value("[[],]") == false);
}

#[test]
fn empty_nested()
{
    assert(can_parse_as_value("[[]]") == true);
}

#[test]
fn multiple_empty_nested()
{
    assert(can_parse_as_value("[[],[],[]]") == true);
}

#[test]
fn single_number()
{
    assert(can_parse_as_value("[1]") == true);
}

#[test]
fn single_number_missing_value()
{
    assert(can_parse_as_value("[1,]") == false);
}

#[test]
fn number_faulty_colon()
{
    assert(can_parse_as_value("[1:]") == false);
}

#[test]
fn multiple_numbers()
{
    assert(can_parse_as_value("[1,2,3]") == true);
}

#[test]
fn multiple_numbers_missing_value()
{
    assert(can_parse_as_value("[1,2,3,]") == false);
}

#[test]
fn multiple_numbers_missing_value_space()
{
    assert(can_parse_as_value("[1,2,3, ]") == false);
}

#[test]
fn single_number_nested()
{
    assert(can_parse_as_value("[[1]]") == true);
}

#[test]
fn multiple_numbers_nested()
{
    assert(can_parse_as_value("[[1],[2],[3]]") == true);
}

#[test]
fn multiple_array_numbers_nested()
{
    assert(can_parse_as_value("[[1,1],[2,2],[3,3]]") == true);
}

#[test]
fn one_empty_string()
{
    assert(can_parse_as_value(r#"[""]"#) == true);
}

#[test]
fn multiple_empty_strings()
{
    assert(can_parse_as_value(r#"["","",""]"#) == true);
}

#[test]
fn multiple_strings()
{
    assert(can_parse_as_value(r#"["1","2","3"]"#) == true);
}

#[test]
fn mixed_types()
{
    assert(can_parse_as_value(r#"[1,"2",true]"#) == true);
}

#[test]
fn null_null()
{
    assert(can_parse_as_value("[null,null]") == true);
}

#[test]
fn single_number_letter()
{
    assert(can_parse_as_value("[1x]") == false);
}

#[test]
fn single_number_literal_letter()
{
    assert(can_parse_as_value("[1f]") == false);
}

#[test]
fn single_literal_wrong_trux()
{
    assert(can_parse_as_value("[trux]") == false);
}

#[test]
fn single_literal_wrong_truf()
{
    assert(can_parse_as_value("[truf]") == false);
}

#[test]
fn single_literal_wrong_nul()
{
    assert(can_parse_as_value("[nul]") == false);
}

#[test]
fn single_literal_wrong_random()
{
    assert(can_parse_as_value("[lfseu]") == false);
}

#[test]
fn literal_faulty_colon()
{
    assert(can_parse_as_value("[true:]") == false);
}

#[test]
fn literal_true_space_true()
{
    assert(can_parse_as_value("[true true]") == false);
}

#[test]
fn number_one_space_two()
{
    assert(can_parse_as_value("[1 2]}") == false);
}

#[test]
fn string_space_string()
{
    assert(can_parse_as_value(r#"["string" "string"]"#) == false);
}

#[test]
fn array_space_array()
{
    assert(can_parse_as_value("[[] []]") == false);
}

#[test]
fn object_space_object()
{
    assert(can_parse_as_value("[{} {}]") == false);
}

#[test]
fn mixed_types_missing_value()
{
    assert(can_parse_as_value(r#"[1,,"2",true,[],{}]"#) == false);
}

#[test]
unconstrained
fn empty_object()
{
    let json = JSON::parse("[{}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).is_empty() == true);
}

#[test]
unconstrained
fn empty_multiple_object()
{
    let json = JSON::parse("[{},{},{}]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).is_empty() == true);
    assert(json.child(1).is_empty() == true);
    assert(json.child(2).is_empty() == true);
}

#[test]
unconstrained
fn empty_multiple_objects_nested_arrays()
{
    let json = JSON::parse("[[{}],[{}],[{}]]");

    assert(json.doc.len() == 1);
    assert(json.children.len() == 3);

    assert(json.child(0).is_empty() == true);
    assert(json.child(1).is_empty() == true);
    assert(json.child(2).is_empty() == true);
}

#[test]
unconstrained
fn mixed_types_null_object_array()
{
    let json = JSON::parse(r#"[1,null,"2",true,[],{}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).is_empty() == true);
}

#[test]
unconstrained
fn one_object_one_property()
{
    let json = JSON::parse(r#"[{"a":1}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn one_object_multiple_properties()
{
    let json = JSON::parse(r#"[{"a":1,"b":true,"c":"123"}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("c").eq_string("\"123\"") == true);
}

#[test]
unconstrained
fn multiple_objects_multiple_properties()
{
    let json = JSON::parse(r#"[{"a":1,"b":true,"c":"123"},{"a":2,"b":false,"c":"456"}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("c").eq_string("\"123\"") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("2") == true);
    assert(json.child(1).get("b").eq_string("false") == true);
    assert(json.child(1).get("c").eq_string("\"456\"") == true);
}

#[test]
unconstrained
fn one_object_one_one_value()
{
    let json = JSON::parse(r#"[{"a":[1]}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("a").eq_string("[1]") == true);
}

#[test]
unconstrained
fn multiple_objects_one_one_value()
{
    let json = JSON::parse(r#"[{"a":[1]},{"b":[2]}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("a").eq_string("[1]") == true);

    assert(json.child(1).len() == 1);
    assert(json.child(1).get("b").eq_string("[2]") == true);
}

#[test]
unconstrained
fn one_object_one_multiple_values()
{
    let json = JSON::parse(r#"[{"abc":[1,2,3]}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("abc").eq_string("[1,2,3]") == true);
}

#[test]
unconstrained
fn multiple_objects_one_multiple_values()
{
    let json = JSON::parse(r#"[{"abc":[1,2,3]},{"def":[4,5,6]}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 1);
    assert(json.child(0).get("abc").eq_string("[1,2,3]") == true);

    assert(json.child(1).len() == 1);
    assert(json.child(1).get("def").eq_string("[4,5,6]") == true);
}

#[test]
unconstrained
fn one_object_one_single_value()
{
    let json = JSON::parse(r#"[{"a":1,"b":true,"c":[1]}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("c").eq_string("[1]") == true);
}

#[test]
unconstrained
fn multiple_objects_one_single_value()
{
    let json = JSON::parse(r#"[{"a":1,"b":true,"c":[1]},{"a":2,"b":false,"c":[2]}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("c").eq_string("[1]") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("a").eq_string("2") == true);
    assert(json.child(1).get("b").eq_string("false") == true);
    assert(json.child(1).get("c").eq_string("[2]") == true);
}

#[test]
unconstrained
fn one_object_multiple_properties_array_multiple_values()
{
    let json = JSON::parse(r#"[{"a":1,"b":true,"abc":[1,2,3]}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 1);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("abc").eq_string("[1,2,3]") == true);
}

#[test]
unconstrained
fn multiple_objects_one_multiple_mixed_values()
{
    let json = JSON::parse(r#"[{"a":1,"b":true,"abc":[1,2,3]},{"x":2,"y":false,"def":[4,5,6]}]"#);

    assert(json.doc.len() == 1);
    assert(json.children.len() == 2);

    assert(json.child(0).len() == 3);
    assert(json.child(0).get("a").eq_string("1") == true);
    assert(json.child(0).get("b").eq_string("true") == true);
    assert(json.child(0).get("abc").eq_string("[1,2,3]") == true);

    assert(json.child(1).len() == 3);
    assert(json.child(1).get("x").eq_string("2") == true);
    assert(json.child(1).get("y").eq_string("false") == true);
    assert(json.child(1).get("def").eq_string("[4,5,6]") == true);
}
