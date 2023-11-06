use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_object_one_key_as_object()
{
    let json = JSON::parse("{'abc':{'a':1,'b':true,'c':'123'}}");

    let obj = json.get("abc").unwrap().as_object(json).unwrap();
    assert(obj.get("a").unwrap().eq_string("1") == true);
    assert(obj.get("b").unwrap().eq_string("true") == true);
    assert(obj.get("c").unwrap().eq_string("'123'") == true);
}

#[test]
unconstrained
fn convert_object_two_keys_with_objects_with_multiple_keys()
{
    let json = JSON::parse("{'abc':{'a':1,'b':true,'c':'123'},'def':{'a':2,'b':false,'c':'456'}}");

    let obj_1 = json.get_object("abc").unwrap();
    assert(obj_1.get("a").unwrap().eq_string("1") == true);
    assert(obj_1.get("b").unwrap().eq_string("true") == true);
    assert(obj_1.get("c").unwrap().eq_string("'123'") == true);

    let obj_2 = json.get_object("def").unwrap();
    assert(obj_2.get("a").unwrap().eq_string("2") == true);
    assert(obj_2.get("b").unwrap().eq_string("false") == true);
    assert(obj_2.get("c").unwrap().eq_string("'456'") == true);
}

#[test]
unconstrained
fn convert_object_two_keys_with_nested_objects()
{
    let json = JSON::parse("{'abc':{'a':{'b':1}},'def':{'d':{'e':2}}}");

    let sub_obj_1 = json.get_object("abc").unwrap()
                        .get_child_object("a", json).unwrap();
    assert(sub_obj_1.get("b").unwrap().eq_string("1") == true);

    let sub_obj_2 = json.get_object("def").unwrap()
                        .get_child_object("d", json).unwrap();
    assert(sub_obj_2.get("e").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn convert_object_two_keys_with_twice_nested_objects()
{
    let json = JSON::parse("{'abc':{'a':{'b':{'c':1}}},'def':{'d':{'e':{'f':2}}}}");

    let sub_sub_obj_1 = json.get_object("abc").unwrap()
                            .get_child_object("a", json).unwrap()
                            .get_child_object("b", json).unwrap();
    assert(sub_sub_obj_1.get("c").unwrap().eq_string("1") == true);

    let sub_sub_obj_2 = json.get_object("def").unwrap()
                            .get_child_object("d", json).unwrap()
                            .get_child_object("e", json).unwrap();
    assert(sub_sub_obj_2.get("f").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn convert_object_array_two_objects_with_multiple_keys()
{
    let json = JSON::parse("{'abc':[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]}");
    let array : [[u8]] = json.get_array("abc").unwrap();

    let obj_1 = array[0].as_object(json).unwrap();
    assert(obj_1.get("a").unwrap().eq_string("1") == true);
    assert(obj_1.get("b").unwrap().eq_string("true") == true);
    assert(obj_1.get("c").unwrap().eq_string("'123'") == true);

    let obj_2 = array[1].as_object(json).unwrap();
    assert(obj_2.get("a").unwrap().eq_string("2") == true);
    assert(obj_2.get("b").unwrap().eq_string("false") == true);
    assert(obj_2.get("c").unwrap().eq_string("'456'") == true);
}
