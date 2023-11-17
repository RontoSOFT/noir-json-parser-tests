use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_object_one_key_as_object()
{
    let json = JSON::parse("{'abc':{'a':1,'b':true,'c':'123'}}");

    let obj = json.get("abc").as_object(json);
    assert(obj.get("a").eq_string("1") == true);
    assert(obj.get("b").eq_string("true") == true);
    assert(obj.get("c").eq_string("'123'") == true);
}

#[test]
unconstrained
fn convert_object_two_keys_with_objects_with_multiple_keys()
{
    let json = JSON::parse("{'abc':{'a':1,'b':true,'c':'123'},'def':{'a':2,'b':false,'c':'456'}}");

    let obj_1 = json.get_object("abc");
    assert(obj_1.get("a").eq_string("1") == true);
    assert(obj_1.get("b").eq_string("true") == true);
    assert(obj_1.get("c").eq_string("'123'") == true);

    let obj_2 = json.get_object("def");
    assert(obj_2.get("a").eq_string("2") == true);
    assert(obj_2.get("b").eq_string("false") == true);
    assert(obj_2.get("c").eq_string("'456'") == true);
}

#[test]
unconstrained
fn convert_object_two_keys_with_nested_objects()
{
    let json = JSON::parse("{'abc':{'a':{'b':1}},'def':{'d':{'e':2}}}");

    let sub_obj_1 = json.get_object("abc")
                        .get_object("a");
    assert(sub_obj_1.get("b").eq_string("1") == true);

    let sub_obj_2 = json.get_object("def")
                        .get_object("d");
    assert(sub_obj_2.get("e").eq_string("2") == true);
}

#[test]
unconstrained
fn convert_object_two_keys_with_twice_nested_objects()
{
    let json = JSON::parse("{'abc':{'a':{'b':{'c':1}}},'def':{'d':{'e':{'f':2}}}}");

    let sub_sub_obj_1 = json.get_object("abc")
                            .get_object("a")
                            .get_object("b");
    assert(sub_sub_obj_1.get("c").eq_string("1") == true);

    let sub_sub_obj_2 = json.get_object("def")
                            .get_object("d")
                            .get_object("e");
    assert(sub_sub_obj_2.get("f").eq_string("2") == true);
}

#[test]
unconstrained
fn convert_object_array_two_objects_with_multiple_keys()
{
    let json = JSON::parse("{'abc':[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]}");
    let array : [[u8]] = json.get_array("abc");

    let obj_1 = array[0].as_object(json);
    assert(obj_1.get("a").eq_string("1") == true);
    assert(obj_1.get("b").eq_string("true") == true);
    assert(obj_1.get("c").eq_string("'123'") == true);

    let obj_2 = array[1].as_object(json);
    assert(obj_2.get("a").eq_string("2") == true);
    assert(obj_2.get("b").eq_string("false") == true);
    assert(obj_2.get("c").eq_string("'456'") == true);
}

#[test]
unconstrained
fn convert_value_string_empty_object1()
{
    assert(JSON::parse("''").get_object("").is_none() == true);
}

#[test]
unconstrained
fn convert_value_string_object_empty()
{
    assert(JSON::parse("'{}'").get_object("").is_empty() == true);
}

#[test]
unconstrained
fn convert_value_string_object()
{
    assert(JSON::parse("'{\\'a\\':1}'").get_object("").get("a").eq_string("1") == true);
}

#[test]
unconstrained
fn convert_value_string_nested_object()
{
    assert(JSON::parse("'{\\'a\\':{\\'b\\':1}}'").get_object("").get_object("a").get("b").eq_string("1") == true);
}
