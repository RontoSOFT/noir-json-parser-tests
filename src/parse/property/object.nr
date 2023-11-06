use dep::rontosoft::JSON;

use crate::utils::object_one;
use crate::utils::object_two;
use crate::utils::object_three;
use crate::utils::object_four;
use crate::utils::object_five;
use crate::utils::object_six;

#[test]
unconstrained
fn property_object_empty()
{
    let json = JSON::parse("{'a':{}}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(object_one) == true);

    assert(json.children.len() == 1);
    assert(json.child(0).is_empty_object());
}

#[test]
unconstrained
fn property_object_empty_colon()
{
    assert(JSON::parse("{'a':{:}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_empty_comma()
{
    assert(JSON::parse("{'a':{'b':{,}}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_empty_key()
{
    assert(JSON::parse("{'a':{''}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_empty_key_with_colon()
{
    assert(JSON::parse("{'a':{'':}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_key_with_colon_missing_value()
{
    assert(JSON::parse("{'a':{'b':}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_missing_key_with_value()
{
    assert(JSON::parse("{'a':{:1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_empty_key_with_value()
{
    assert(JSON::parse("{'a':{'':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_single_character_key_with_value()
{
    let json = JSON::parse("{'a':{'b':1}}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(object_one) == true);

    assert(json.children.len() == 1);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn property_object_multi_character_key_with_value()
{
    let json = JSON::parse("{'abc':{'b':1}}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("abc").unwrap().eq_array(object_one) == true);

    assert(json.children.len() == 1);
    assert(json.child(0).bytesOf("b").unwrap().eq_string("1") == true);
}

// whitespace tests skipped

// key with control character tests skipped

#[test]
unconstrained
fn property_object_faulty_colon()
{
    assert(JSON::parse("{'a':{:'b':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_quote_before_key()
{
    assert(JSON::parse("{'a':{''b':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_quote_after_key()
{
    assert(JSON::parse("{'a':{'b'':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_left_brace_before_key()
{
    assert(JSON::parse("{'a':{{'b':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_left_brace_after_key()
{
    assert(JSON::parse("{'a':{'b'{:1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_right_brace_before_key()
{
    assert(JSON::parse("{'a':{}'b':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_right_brace_after_key()
{
    assert(JSON::parse("{'a':{'b'}:1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_left_bracket_before_key()
{
    assert(JSON::parse("{'a':{['b':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_left_bracket_after_key()
{
    assert(JSON::parse("{'a':{'b'[:1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_right_bracket_before_key()
{
    assert(JSON::parse("{'a':{]'b':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_right_bracket_after_key()
{
    assert(JSON::parse("{'a':{'b']:1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_leading_comma()
{
    assert(JSON::parse("{'a':{,'b':1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_comma_after_key()
{
    assert(JSON::parse("{'a':{'b',:1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_comma_after_colon()
{
    assert(JSON::parse("{'a':{'b':,1}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_trailing_comma()
{
    assert(JSON::parse("{'a':{'b':1,}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_one_comma_minus()
{
    assert(JSON::parse("{'a':{'b':1,-}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_empty_key_second_key()
{
    assert(JSON::parse("{'a':{'b':1,''}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_missing_colon_second_key()
{
    assert(JSON::parse("{'a':{'b':1,'c'}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_missing_value_second_key()
{
    assert(JSON::parse("{'a':{'b':1,'c':}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_faulty_minus_second_key()
{
    assert(JSON::parse("{'a':{'b':1,'c':-}}").doc.len() == 0);
}

#[test]
unconstrained
fn property_object_two_keys()
{
    let json = JSON::parse("{'a':{'value':1},'b':{'value':2}}");

    assert(json.doc.len() == 2);
    assert(json.bytesOf("a").unwrap().eq_array(object_one) == true);
    assert(json.bytesOf("b").unwrap().eq_array(object_two) == true);

    assert(json.children.len() == 2);
    assert(json.child(0).bytesOf("value").unwrap().eq_string("1") == true);
    assert(json.child(1).bytesOf("value").unwrap().eq_string("2") == true);
}

// TODO: fix this
#[test]
unconstrained
fn property_object_two_keys_same_name_replace_property()
{
    let json = JSON::parse("{'a':{'value':1},'a':{'value':2}}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(object_two) == true);

    assert(json.children.len() == 2); // TODO: 1
    assert(json.child(1).bytesOf("value").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn property_object_one_child_nested()
{
    let json = JSON::parse("{'a':{'b':{'value':1}}}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(object_one) == true);

    assert(json.children.len() == 2);
    assert(json.child(0).bytesOf("b").unwrap().eq_array(object_two) == true);
    assert(json.child(1).bytesOf("value").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn property_object_two_children_nested()
{
    let json = JSON::parse("{'a':{'b':{'value':1},'c':{'value':2}}}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(object_one) == true);

    assert(json.children.len() == 3);

    assert(json.child(0).bytesOf("b").unwrap().eq_array(object_two) == true);
    assert(json.child(1).bytesOf("value").unwrap().eq_string("1") == true);

    assert(json.child(0).bytesOf("c").unwrap().eq_array(object_three) == true);
    assert(json.child(2).bytesOf("value").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn property_object_two_parents_one_child()
{
    let json = JSON::parse("{'abc':{'a':{'value':1}},'def':{'b':{'value':2}}}");

    assert(json.doc.len() == 2);
    assert(json.bytesOf("abc").unwrap().eq_array(object_one) == true);
    assert(json.bytesOf("def").unwrap().eq_array(object_three) == true);

    assert(json.children.len() == 4);

    assert(json.child(0).bytesOf("a").unwrap().eq_array(object_two) == true);
    assert(json.child(1).bytesOf("value").unwrap().eq_string("1") == true);

    assert(json.child(2).bytesOf("b").unwrap().eq_array(object_four) == true);
    assert(json.child(3).bytesOf("value").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn property_object_one_child_nested_twice()
{
    let json = JSON::parse("{'a':{'b':{'c':{'value':1}}}}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(object_one) == true);

    assert(json.children.len() == 3);
    assert(json.child(0).bytesOf("b").unwrap().eq_array(object_two) == true);
    assert(json.child(1).bytesOf("c").unwrap().eq_array(object_three) == true);
    assert(json.child(2).bytesOf("value").unwrap().eq_string("1") == true);
}

#[test]
unconstrained
fn property_object_two_children_nested_twice()
{
    let json = JSON::parse("{'a':{'b':{'c':{'value':1}},'d':{'e':{'value':2}}}}");

    assert(json.doc.len() == 1);
    assert(json.bytesOf("a").unwrap().eq_array(object_one) == true);

    assert(json.children.len() == 5);

    assert(json.child(0).bytesOf("b").unwrap().eq_array(object_two) == true);
    assert(json.child(1).bytesOf("c").unwrap().eq_array(object_three) == true);
    assert(json.child(2).bytesOf("value").unwrap().eq_string("1") == true);

    assert(json.child(0).bytesOf("d").unwrap().eq_array(object_four) == true);
    assert(json.child(3).bytesOf("e").unwrap().eq_array(object_five) == true);
    assert(json.child(4).bytesOf("value").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn property_object_two_parents_one_child_nested()
{
    let json = JSON::parse("{'abc':{'a':{'b':{'value':1}}},'def':{'c':{'d':{'value':2}}}}");

    assert(json.doc.len() == 2);
    assert(json.bytesOf("abc").unwrap().eq_array(object_one) == true);
    assert(json.bytesOf("def").unwrap().eq_array(object_four) == true);

    assert(json.children.len() == 6);

    assert(json.child(0).bytesOf("a").unwrap().eq_array(object_two) == true);
    assert(json.child(1).bytesOf("b").unwrap().eq_array(object_three) == true);
    assert(json.child(2).bytesOf("value").unwrap().eq_string("1") == true);

    assert(json.child(3).bytesOf("c").unwrap().eq_array(object_five) == true);
    assert(json.child(4).bytesOf("d").unwrap().eq_array(object_six) == true);
    assert(json.child(5).bytesOf("value").unwrap().eq_string("2") == true);
}
