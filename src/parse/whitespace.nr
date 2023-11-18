use dep::rontosoft::JSON;

#[test]
unconstrained
fn whitespace_space()
{
    assert(JSON::parse(" ").is_none() == true);
}

#[test]
unconstrained
fn whitespace_tab()
{
    assert(JSON::parse("\t").is_none() == true);
}

#[test]
unconstrained
fn whitespace_newline()
{
    assert(JSON::parse("\n").is_none() == true);
}

#[test]
unconstrained
fn whitespace_carriage_return()
{
    assert(JSON::parse("\r").is_none() == true);
}

#[test]
unconstrained
fn whitespace_byte_null()
{
    assert(JSON::parse("\0").is_none() == true);
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
    assert(JSON::parse(" \0{}").is_none() == true);
}

#[test]
unconstrained
fn whitespace_empty_object_with_leading_null_and_spaces()
{
    assert(JSON::parse("   \0{}").is_none() == true);
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
