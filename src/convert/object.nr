use dep::rontosoft::JSON;

#[test]
unconstrained
fn convert_object_multiple_keys_with_objects_with_multiple_keys()
{
    let json = JSON::parse("{'abc':{'a':1,'b':true,'c':'123'},'def':{'a':2,'b':false,'c':'456'}}");

    let obj_1 = json.getObject("abc").unwrap();
    assert(obj_1.bytesOf("a").unwrap().eq_string("1") == true);
    assert(obj_1.bytesOf("b").unwrap().eq_string("true") == true);
    assert(obj_1.bytesOf("c").unwrap().eq_string("'123'") == true);

    let obj_2 = json.getObject("def").unwrap();
    assert(obj_2.bytesOf("a").unwrap().eq_string("2") == true);
    assert(obj_2.bytesOf("b").unwrap().eq_string("false") == true);
    assert(obj_2.bytesOf("c").unwrap().eq_string("'456'") == true);
}

#[test]
unconstrained
fn convert_object_multiple_keys_with_nested_objects()
{
    let json = JSON::parse("{'abc':{'a':{'b':1}},'def':{'d':{'e':2}}}");

    let sub_obj_1 = json.getObject("abc").unwrap()
                        .getChildObject("a", json).unwrap();
    assert(sub_obj_1.bytesOf("b").unwrap().eq_string("1") == true);

    let sub_obj_2 = json.getObject("def").unwrap()
                        .getChildObject("d", json).unwrap();
    assert(sub_obj_2.bytesOf("e").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn convert_object_multiple_keys_with_twice_nested_objects()
{
    let json = JSON::parse("{'abc':{'a':{'b':{'c':1}}},'def':{'d':{'e':{'f':2}}}}");

    let sub_sub_obj_1 = json.getObject("abc").unwrap()
                            .getChildObject("a", json).unwrap()
                            .getChildObject("b", json).unwrap();
    assert(sub_sub_obj_1.bytesOf("c").unwrap().eq_string("1") == true);

    let sub_sub_obj_2 = json.getObject("def").unwrap()
                            .getChildObject("d", json).unwrap()
                            .getChildObject("e", json).unwrap();
    assert(sub_sub_obj_2.bytesOf("f").unwrap().eq_string("2") == true);
}

#[test]
unconstrained
fn convert_object_array_two_objects_with_multiple_keys()
{
    let json = JSON::parse("{'abc':[{'a':1,'b':true,'c':'123'},{'a':2,'b':false,'c':'456'}]}");
    let array : [[u8]] = json.getSlice("abc").unwrap();

    let obj_1 = array[0].asObject(json).unwrap();
    assert(obj_1.bytesOf("a").unwrap().eq_string("1") == true);
    assert(obj_1.bytesOf("b").unwrap().eq_string("true") == true);
    assert(obj_1.bytesOf("c").unwrap().eq_string("'123'") == true);

    let obj_2 = array[1].asObject(json).unwrap();
    assert(obj_2.bytesOf("a").unwrap().eq_string("2") == true);
    assert(obj_2.bytesOf("b").unwrap().eq_string("false") == true);
    assert(obj_2.bytesOf("c").unwrap().eq_string("'456'") == true);
}
